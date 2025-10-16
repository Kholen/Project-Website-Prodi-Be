<?php

namespace App\Http\Controllers\Api;

use App\Models\Dosen;
use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

class DosenController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        try {
            $dosens = Dosen::with(['skills', 'jabatans', 'prodis'])
                            ->orderBy('nama')
                            ->get();
            return response()->json($dosens);
        } catch (\Throwable $exception) {
            return response()->json([
                'error' => 'Gagal mengambil data dosen.',
                'detail' => $exception->getMessage(),
            ], 500);
        }
    }

    public function show(int $id): JsonResponse
    {
        try {
            $dosen = Dosen::with(['skills', 'jabatans', 'prodis'])
                           ->findOrFail($id);
            return response()->json($dosen);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $exception) {
            return response()->json(['message' => 'Data dosen tidak ditemukan.'], 404);
        } catch (\Throwable $exception) {
            return response()->json([
                'error' => 'Gagal mengambil data dosen.',
                'detail' => $exception->getMessage(),
            ], 500);
        }
    }

    public function update(Request $request, Dosen $dosen)
{
    $validatedData = $request->validate([
        'nama'        => 'sometimes|required|string|max:255',
        // Aturan 'unique' akan mengabaikan record dari dosen yang sedang diedit
        'NUPTK'       => ['sometimes', 'required', 'string', Rule::unique('dosens')->ignore($dosen->id)],
        'email'       => ['sometimes', 'required', 'email', Rule::unique('dosens')->ignore($dosen->id)],
        'image'       => 'nullable|image|mimes:jpeg,png,jpg,gif|max:5120', // Terima file baru (opsional)
        'prodi_ids'   => 'sometimes|array',
        'prodi_ids.*' => 'exists:prodi,id',
        'jabatan_ids' => 'sometimes|array',
        'skill_ids'   => 'sometimes|array',
    ]);

    // 2. Siapkan data dasar untuk di-update
    $dataToUpdate = $request->only(['nama', 'NUPTK', 'email']);

    // 3. Handle upload gambar BARU (jika ada)
    if ($request->hasFile('image')) {
        // Hapus gambar lama dari storage jika ada
        if ($dosen->image_url) {
            Storage::disk('public')->delete(str_replace('/storage/', '', $dosen->image_url));
        }

        // Simpan gambar baru dan siapkan path untuk di-update
        $path = $request->file('image')->store('images/dosen', 'public');
        $dataToUpdate['image'] = Storage::url($path);
    }

    // 4. Lakukan update pada model Dosen
    $dosen->update($dataToUpdate);

    // 5. Sinkronkan relasi jika data dikirim dari frontend
    if ($request->has('prodi_ids')) {
        $dosen->prodis()->sync($request->input('prodi_ids', []));
    }
    if ($request->has('jabatan_ids')) {
        $dosen->jabatans()->sync($request->input('jabatan_ids', []));
    }
    if ($request->has('skill_ids')) {
        $dosen->skills()->sync($request->input('skill_ids', []));
    }

    // 6. Kembalikan data yang sudah fresh (terbaru) beserta relasinya
    return response()->json([
        'message' => 'Data dosen berhasil diperbarui!',
        'data'    => $dosen->fresh(['prodis', 'jabatans', 'skills']),
    ], 200);
    }

    public function store(Request $request)
    {
    $validator = Validator::make($request->all(), [
        'nama'        => 'required|string|max:255',
        'NUPTK'       => 'required|string|unique:dosens,NUPTK',
        'email'       => 'required|email|unique:dosens,email',
        'image'       => 'nullable|image|mimes:jpeg,png,jpg,gif|max:5120', 
        'prodi_ids'   => 'required|array|min:1',
        'prodi_ids.*' => 'exists:prodi,id',
        'jabatan_ids' => 'nullable|array',
        'jabatan_ids.*' => 'exists:jabatans,id',
        'skill_ids'   => 'nullable|array',
        'skill_ids.*' => 'exists:skills,id',
    ]);

    if ($validator->fails()) {
        return response()->json(['errors' => $validator->errors()], 422);
    }

    // 2. Siapkan data dasar dari request.
    $dataToCreate = $request->only(['nama', 'NUPTK', 'email']);

    // 3. Tambahkan LOGIKA UPLOAD FILE yang benar.
    if ($request->hasFile('image')) {
        // Simpan file ke 'storage/app/public/images/dosen'
        $path = $request->file('image')->store('images/dosen', 'public');
        
        // Dapatkan URL yang bisa diakses publik dan tambahkan ke data.
        $dataToCreate['image'] = Storage::url($path);
    }

    // 4. Buat record Dosen baru dengan semua data yang sudah disiapkan.
    $dosen = Dosen::create($dataToCreate);

    // 5. Sinkronkan relasi many-to-many.
    $dosen->prodis()->sync($request->input('prodi_ids', []));
    $dosen->jabatans()->sync($request->input('jabatan_ids', []));
    $dosen->skills()->sync($request->input('skill_ids', []));

    // 6. Kembalikan data lengkap.
    return response()->json($dosen->load(['prodis', 'jabatans', 'skills']), 201);
    }
    public function destroy(string $id)
    {
        try {
            // Cari dosen, atau gagal dengan error 404
            $dosen = Dosen::findOrFail($id);

            // Hapus data
            $dosen->delete();

            // Kembalikan response sukses
            return response()->json(['message' => 'Data dosen berhasil dihapus.'], 200);

        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['message' => 'Data dosen tidak ditemukan.'], 404);
        } catch (\Throwable $e) {
            // Tangani error lain jika ada
            return response()->json(['message' => 'Terjadi kesalahan saat menghapus data.'], 500);
        }
    }
}
