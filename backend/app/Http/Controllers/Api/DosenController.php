<?php

namespace App\Http\Controllers\Api;

// PERBAIKAN: Gunakan 'Dosen' dengan huruf kapital agar konsisten
use App\Models\Dosen; 
use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log; // Kita mungkin butuh ini untuk debugging nanti

class DosenController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        try {
            $dosens = Dosen::with(['skills', 'jabatans', 'prodis', 'imageUrl'])
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
            $dosen = Dosen::with(['skills', 'jabatans', 'prodis', 'imageUrl'])
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

    public function update(Request $request, string $id)
    {
        // 1. Validasi data
        $validatedData = $request->validate([
            'nama'        => 'sometimes|required|string|max:255',
            'NUPTK'       => [
                'sometimes', 'required', 'string',
                Rule::unique('dosens')->ignore($id),
            ],
            'kontak'      => 'sometimes|nullable|string|max:20',
            // ??? PERBAIKAN: Tambahkan validasi untuk 'image_url' sebagai string URL ???
            'image_url'   => 'sometimes|nullable|url',
            
            'prodi_ids'   => 'sometimes|array',
            'prodi_ids.*' => 'integer|exists:prodi,id',
            'jabatan_ids' => 'sometimes|array',
            'jabatan_ids.*' => 'integer|exists:jabatans,id',
            'skill_ids'   => 'sometimes|array',
            'skill_ids.*' => 'integer|exists:skills,id',
        ]);

        $dosen = Dosen::findOrFail($id);
        $dosen->update($validatedData);

        // ??? PERBAIKAN: Logika baru yang benar untuk mengupdate URL gambar ???
        if ($request->has('image_url')) {
            // Cari relasi gambar di tabel pivot 'dosen_images'
            $dosenImage = DB::table('dosen_images')->where('dosen_id', $dosen->id)->first();

            if ($dosenImage) {
                // Jika ada, update URL di tabel 'image_url' menggunakan image_id dari pivot
                DB::table('image_url')
                  ->where('id', $dosenImage->image_id)
                  ->update(['url' => $request->image_url]);
            }
        }

        // --- Logika sync() Anda yang sudah benar ---
        if ($request->has('prodi_ids')) {
            $dosen->prodis()->sync($request->prodi_ids);
        }
        if ($request->has('jabatan_ids')) {
            $dosen->jabatans()->sync($request->jabatan_ids);
        }
        if ($request->has('skill_ids')) {
            $dosen->skills()->sync($request->skill_ids);
        }
        // --- Blok 'image_ids' yang salah sudah dihapus ---

        // 5. Kembalikan response
        return response()->json([
            'message' => 'Data dosen berhasil diperbarui!',
            // ??? PERBAIKAN: Ganti 'imagesUrl' menjadi 'imageUrl' sesuai nama relasi di Model ???
            'data'    => $dosen->fresh()->with(['prodis', 'jabatans', 'skills', 'imageUrl'])
        ], 200);
    }
    public function store(Request $request) 
    {
        $validateData = $request->validate([
            'nama'        => 'required|string|max:255',
            'NUPTK'       => 'required|string|unique:dosens,NUPTK', // NUPTK harus unik
            'kontak'      => 'nullable|string|max:20',
            'image_url'   => 'required|url', // URL gambar wajib ada saat membuat
            'prodi_ids'   => 'required|array|min:1',
            'jabatan_ids' => 'sometimes|array',
            'skill_ids'   => 'sometimes|array',
        ]);

        $dosen = Dosen::create([
            'nama' => $validateData['nama'],
            'NUPTK' => $validateData['NUPTK'],
            'kontak' => $validateData['kontak'],
        ]);

        if ($request->has('prodi_ids')) {
            $dosen->prodis()->attach($request->prodi_ids);
        }
        if ($request->has('jabatan_ids')) {
            $dosen->jabatans()->attach($request->jabatan_ids);
        }
        if ($request->has('skill_ids')) {
            $dosen->skills()->attach($request->skill_ids);
        }

        return response()->json($dosen->load(['prodis', 'jabatans', 'skills', 'imageUrl']), 201);
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
