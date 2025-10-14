<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Berita;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

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
    public function show($identifier)
    {
         if (is_numeric($identifier)) {
            // Jika ya, cari berita berdasarkan primary key (ID)
            $berita = Berita::findOrFail($identifier);
        } else {
            // Jika bukan angka, anggap itu adalah Slug
            // Cari berita berdasarkan kolom 'slug'
            // 'firstOrFail()' adalah pengganti 'findOrFail()' saat menggunakan 'where'
            $berita = Berita::where('slug', $identifier)->firstOrFail();
        }

        return response()->json($berita);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Berita $berita)
    {
        $validator = Validator::make($request->all(), [
            'judul' => 'required|string|max:255',
            'kepala_berita' => 'nullable|string',
            'tubuh_berita' => 'required|string',
            'ekor_berita' => 'nullable|string',
            // Gambar tidak 'required' saat update
            'gambar_berita' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048', 
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Ambil semua data input kecuali gambar
        $input = $request->except('gambar_berita');

        // Cek jika ada file gambar baru yang diupload
        if ($request->hasFile('gambar_berita')) {
            // 1. Hapus gambar lama jika ada
            if ($berita->gambar_berita && Storage::disk('public')->exists($berita->gambar_berita)) {
                Storage::disk('public')->delete($berita->gambar_berita);
            }

            // 2. Upload gambar baru
            $path = $request->file('gambar_berita')->store('berita_images', 'public');
            $input['gambar_berita'] = $path;
        }

        // Update data di database
        $berita->update($input);

        return response()->json([
            'message' => 'Data berita berhasil diperbarui!',
            'data' => $berita
        ], 200);
    }
    public function destroy($berita) {
        $berita = Berita::findOrFail($berita);

        // Hapus gambar dari storage jika ada
        if ($berita->gambar_berita && Storage::disk('public')->exists($berita->gambar_berita)) {
            Storage::disk('public')->delete($berita->gambar_berita);
        }

        // Hapus data berita dari database
        $berita->delete();

        return response()->json(['message' => 'Data berita berhasil dihapus!'], 200);
    }
}
