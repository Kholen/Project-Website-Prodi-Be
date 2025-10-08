<?php

namespace App\Http\Controllers\Api;

use App\Models\Dosen;
use App\Models\ImageUrl;
use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Arr;

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
            'email'      => 'sometimes|nullable|string|max:255',
            'image_url'   => 'sometimes|nullable|url',

            'prodi_ids'   => 'sometimes|array',
            'prodi_ids.*' => 'integer|exists:prodi,id',
            'jabatan_ids' => 'sometimes|array',
            'jabatan_ids.*' => 'integer|exists:jabatans,id',
            'skill_ids'   => 'sometimes|array',
            'skill_ids.*' => 'integer|exists:skills,id',
        ]);

        $dosen = Dosen::findOrFail($id);

        $dosen->fill(Arr::only($validatedData, ['nama', 'NUPTK', 'email']));
        $dosen->save();

        if ($request->has('image_url')) {
            $imageRelation = $dosen->imageUrl();
            $currentImage = $imageRelation->first();

            if ($request->filled('image_url')) {
                if ($currentImage) {
                    $currentImage->update(['url' => $request->image_url]);
                    $imageRelation->sync([$currentImage->getKey()]);
                } else {
                    $newImage = ImageUrl::create(['url' => $request->image_url]);
                    $imageRelation->sync([$newImage->getKey()]);
                }
            } elseif ($currentImage) {
                $imageRelation->detach($currentImage->getKey());
                $currentImage->delete();
            }
        }

        if ($request->has('prodi_ids')) {
            $dosen->prodis()->sync($request->prodi_ids);
        }
        if ($request->has('jabatan_ids')) {
            $dosen->jabatans()->sync($request->jabatan_ids);
        }
        if ($request->has('skill_ids')) {
            $dosen->skills()->sync($request->skill_ids);
        }

        $updatedDosen = $dosen->fresh(['prodis', 'jabatans', 'skills', 'imageUrl']);

        return response()->json([
            'message' => 'Data dosen berhasil diperbarui!',
            'data'    => $updatedDosen,
        ], 200);
    }
    public function store(Request $request) 
    {
        $validateData = $request->validate([
            'nama'        => 'required|string|max:255',
            'NUPTK'       => 'required|string|unique:dosens,NUPTK', // NUPTK harus unik
            'email'      => 'nullable|string|max:20',
            'image_url'   => 'required|url', // URL gambar wajib ada saat membuat
            'prodi_ids'   => 'required|array|min:1',
            'jabatan_ids' => 'sometimes|array',
            'skill_ids'   => 'sometimes|array',
        ]);

        $dosen = Dosen::create([
            'nama' => $validateData['nama'],
            'NUPTK' => $validateData['NUPTK'],
            'email' => $validateData['email'] ?? null,
        ]);

        $image = ImageUrl::create(['url' => $validateData['image_url']]);
        $dosen->imageUrl()->sync([$image->getKey()]);

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
