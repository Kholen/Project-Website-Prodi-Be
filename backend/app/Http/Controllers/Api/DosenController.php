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
            'NUPTK'       => ['sometimes', 'required', 'string', Rule::unique('dosens')->ignore($dosen->id)],
            'email'       => ['sometimes', 'required', 'email', Rule::unique('dosens')->ignore($dosen->id)],
            'image'       => 'nullable|image|mimes:jpeg,png,jpg,gif|max:5120', 
            'prodi_ids'   => 'sometimes|array',
            'prodi_ids.*' => 'exists:prodi,id',
            'jabatan_ids' => 'sometimes|array',
            'skill_ids'   => 'sometimes|array',
        ]);

        $dataToUpdate = $request->only(['nama', 'NUPTK', 'email']);

        if ($request->hasFile('image')) {
            if ($dosen->image_url) {
                Storage::disk('public')->delete(str_replace('/storage/', '', $dosen->image_url));
            }

            $path = $request->file('image')->store('images/dosen', 'public');
            $dataToUpdate['image'] = Storage::url($path);
        }

        $dosen->update($dataToUpdate);

        if ($request->has('prodi_ids')) {
            $dosen->prodis()->sync($request->input('prodi_ids', []));
        }
        if ($request->has('jabatan_ids')) {
            $dosen->jabatans()->sync($request->input('jabatan_ids', []));
        }
        if ($request->has('skill_ids')) {
            $dosen->skills()->sync($request->input('skill_ids', []));
        }

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

        $dataToCreate = $request->only(['nama', 'NUPTK', 'email']);

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('images/dosen', 'public');
            $dataToCreate['image'] = Storage::url($path);
        }

        $dosen = Dosen::create($dataToCreate);

        $dosen->prodis()->sync($request->input('prodi_ids', []));
        $dosen->jabatans()->sync($request->input('jabatan_ids', []));
        $dosen->skills()->sync($request->input('skill_ids', []));

        return response()->json($dosen->load(['prodis', 'jabatans', 'skills']), 201);
    }
    public function destroy(string $id)
    {
        try {
            $dosen = Dosen::findOrFail($id);
            $dosen->delete();
            return response()->json(['message' => 'Data dosen berhasil dihapus.'], 200);

        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['message' => 'Data dosen tidak ditemukan.'], 404);
        } catch (\Throwable $e) {
            return response()->json(['message' => 'Terjadi kesalahan saat menghapus data.'], 500);
        }
    }
}
