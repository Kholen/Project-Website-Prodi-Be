<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Berita;
use Illuminate\Support\Facades\Validator;

use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;

class BeritaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return response()->json(Berita::all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'judul' => 'required|string|unique:berita,judul',
            'gambar_berita' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:5120',
            'kepala_berita' => 'nullable|string',
            'tubuh_berita' => 'required|string',
            'ekor_berita' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $gambarPath = null;
        if ($request->hasFile('gambar_berita')) {
            $image = $request->file('gambar_berita');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $gambarPath = $image->storeAs('images/berita', $imageName, 'public');
        }

        try {
            $berita = Berita::create([
                'judul' => $request->judul,
                'gambar_berita' => $gambarPath,
                'kepala_berita' => $request->input('kepala_berita', ''),
                'tubuh_berita' => $request->tubuh_berita,
                'ekor_berita' => $request->input('ekor_berita', ''),
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Berita berhasil ditambahkan!',
                'data' => $berita,
            ], 201);
        } catch (\Throwable $e) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal menyimpan berita.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Berita $berita)
    {
        return response()->json($berita);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Berita $berita)
    {
        $validator = Validator::make($request->all(), [
            'judul' => ['sometimes', 'required', 'string', Rule::unique('berita', 'judul')->ignore($berita->id)],
            'gambar_berita' => 'sometimes|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'kepala_berita' => 'nullable|string',
            'tubuh_berita' => 'sometimes|required|string',
            'ekor_berita' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        try {
            if ($request->has('judul')) {
                $berita->judul = $request->judul;
            }

            if ($request->has('kepala_berita')) {
                $berita->kepala_berita = $request->input('kepala_berita', '');
            }

            if ($request->has('tubuh_berita')) {
                $berita->tubuh_berita = $request->tubuh_berita;
            }

            if ($request->has('ekor_berita')) {
                $berita->ekor_berita = $request->input('ekor_berita', '');
            }

            if ($request->hasFile('gambar_berita')) {
                $image = $request->file('gambar_berita');
                $imageName = time() . '.' . $image->getClientOriginalExtension();
                $gambarPath = $image->storeAs('image/berita', $imageName, 'public');

                if ($berita->gambar_berita) {
                    Storage::disk('public')->delete($berita->gambar_berita);
                }

                $berita->gambar_berita = $gambarPath;
            }

            $berita->save();

            return response()->json([
                'success' => true,
                'message' => 'Berita berhasil diperbarui!',
                'data' => $berita->fresh(),
            ], 200);
        } catch (\Throwable $e) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal memperbarui berita.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function destroy(Berita $berita)
    {
        try {
            if ($berita->gambar_berita) {
                Storage::disk('public')->delete($berita->gambar_berita);
            }

            $berita->delete();

            return response()->json([
                'success' => true,
                'message' => 'Berita berhasil dihapus.',
            ], 200);
        } catch (\Throwable $e) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal menghapus berita.',
                'error' => $e->getMessage(),
            ], 500);
        }
        }
}
