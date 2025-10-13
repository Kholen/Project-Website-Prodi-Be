<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Berita;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

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
        // Langkah 1: Validasi Input
        $validator = Validator::make($request->all(), [
            'judul' => 'required|string|max:255|unique:berita,judul',
            'gambar_berita' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048', // Validasi file gambar
            'kepala_berita' => 'nullable|string',
            'tubuh_berita' => 'required|string',
            'ekor_berita' => 'nullable|string',
        ]);

        // Jika validasi gagal, kembalikan response error
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Langkah 2: Proses Upload Gambar
        $gambarPath = null;
        if ($request->hasFile('gambar_berita')) {
            // Dapatkan file gambar dari request
            $image = $request->file('gambar_berita');
            
            // Buat nama file yang unik berdasarkan waktu
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            
            // Simpan file ke folder 'berita-images' di dalam disk 'public'
            // dan langsung tangkap path yang dikembalikan oleh Laravel.
            $gambarPath = $image->storeAs('berita-images', $imageName, 'public');
        }

        // Langkah 3: Buat dan Simpan Data
        try {
            $berita = Berita::create([
                'judul' => $request->judul,
                'slug' => Str::slug($request->judul), // Slug dibuat otomatis dari judul
                'gambar_berita' => $gambarPath,
                'kepala_berita' => $request->kepala_berita,
                'tubuh_berita' => $request->tubuh_berita,
                'ekor_berita' => $request->ekor_berita,
            ]);

            // Langkah 4: Kembalikan Response Sukses
            return response()->json([
                'success' => true,
                'message' => 'Berita berhasil ditambahkan!',
                'data' => $berita,
            ], 201); // 201 Created

        } catch (\Exception $e) {
            // Jika terjadi error saat menyimpan ke database
            return response()->json([
                'success' => false,
                'message' => 'Gagal menyimpan berita.',
                'error' => $e->getMessage()
            ], 500); // 500 Internal Server Error
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
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
