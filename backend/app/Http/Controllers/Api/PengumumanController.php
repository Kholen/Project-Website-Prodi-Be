<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Pengumuman;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class PengumumanController extends Controller
{
    public function index(): JsonResponse
    {
        $pengumuman = Pengumuman::orderByDesc('created_at')->orderByDesc('id')->get();

        return response()->json($pengumuman);
    }

    public function store(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'judul' => 'required|string|unique:pengumuman,judul',
            'gambar' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'kepala_pengumuman' => 'nullable|string',
            'isi_pengumuman' => 'required|string',
            'ekor_pengumuman' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $gambarPath = null;

        if ($request->hasFile('gambar')) {
            $image = $request->file('gambar');
            $imageName = time() . '_' . uniqid('', true) . '.' . $image->getClientOriginalExtension();
            $gambarPath = $image->storeAs('pengumuman-images', $imageName, 'public');
        }

        $pengumuman = Pengumuman::create([
            'judul' => $request->judul,
            'gambar' => $gambarPath,
            'kepala_pengumuman' => $request->input('kepala_pengumuman', ''),
            'isi_pengumuman' => $request->isi_pengumuman,
            'ekor_pengumuman' => $request->input('ekor_pengumuman', ''),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Pengumuman berhasil ditambahkan!',
            'data' => $pengumuman,
        ], 201);
    }

    public function show(Pengumuman $pengumuman): JsonResponse
    {
        return response()->json($pengumuman);
    }

    public function update(Request $request, Pengumuman $pengumuman): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'judul' => ['sometimes', 'required', 'string', Rule::unique('pengumuman', 'judul')->ignore($pengumuman->id)],
            'gambar' => 'sometimes|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'kepala_pengumuman' => 'nullable|string',
            'isi_pengumuman' => 'sometimes|required|string',
            'ekor_pengumuman' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        if ($request->has('judul')) {
            $pengumuman->judul = $request->judul;
        }

        if ($request->has('kepala_pengumuman')) {
            $pengumuman->kepala_pengumuman = $request->input('kepala_pengumuman', '');
        }

        if ($request->has('isi_pengumuman')) {
            $pengumuman->isi_pengumuman = $request->isi_pengumuman;
        }

        if ($request->has('ekor_pengumuman')) {
            $pengumuman->ekor_pengumuman = $request->input('ekor_pengumuman', '');
        }

        if ($request->hasFile('gambar')) {
            $image = $request->file('gambar');
            $imageName = time() . '_' . uniqid('', true) . '.' . $image->getClientOriginalExtension();
            $gambarPath = $image->storeAs('pengumuman-images', $imageName, 'public');

            if ($pengumuman->gambar) {
                Storage::disk('public')->delete($pengumuman->gambar);
            }

            $pengumuman->gambar = $gambarPath;
        }

        $pengumuman->save();

        return response()->json([
            'success' => true,
            'message' => 'Pengumuman berhasil diperbarui!',
            'data' => $pengumuman->fresh(),
        ]);
    }

    public function destroy(Pengumuman $pengumuman): JsonResponse
    {
        if ($pengumuman->gambar) {
            Storage::disk('public')->delete($pengumuman->gambar);
        }

        $pengumuman->delete();

        return response()->json([
            'success' => true,
            'message' => 'Pengumuman berhasil dihapus.',
        ]);
    }
}
