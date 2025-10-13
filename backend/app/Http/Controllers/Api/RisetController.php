<?php

namespace App\Http\Controllers\Api;

use App\Models\Riset;
use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Log;

class RisetController extends Controller
{
    /**
     * Display a listing of the riset resources.
     */
    public function index(): JsonResponse
    {
        try {
            $riset = DB::table('riset')
                ->select(
                    'id',
                    'nama_ketua',
                    'judul',
                    'journal_name',
                    'url_riset',
                    'published_at',
                    'tahun',
                    'created_at',
                    'updated_at'
                )
                ->orderByDesc('published_at')
                ->orderByDesc('tahun')
                ->orderBy('judul')
                ->get();

            return response()->json($riset);
        } catch (\Throwable $exception) {
            return response()->json([
                'error' => 'Gagal mengambil data riset.',
                'detail' => $exception->getMessage(),
            ], 500);
        }
    }
    public function show(Riset $id): JsonResponse
    {
        // Karena Route Model Binding, Laravel sudah otomatis mencari data Riset untuk Anda.
        // Anda tinggal mengembalikannya sebagai JSON.
        return response()->json($id);
    }
    public function update(Request $request, Riset $id): JsonResponse
    {
        // 1. Validasi data yang masuk. 'sometimes' berarti hanya divalidasi jika ada di request.
        $validatedData = $request->validate([
            'nama_ketua'      => 'required|string|max:255',
            'anggota_penulis' => 'nullable|string',
            'judul'           => 'required|string|max:255',
            'published_at'    => 'nullable|date',
            'journal_name'    => 'nullable|string',
            'url_riset'       => 'nullable|url',
            'tahun'           => 'required|integer|digits:4',
        ]);

        // 2. Karena Route Model Binding, Laravel sudah mencari data riset untuk Anda ($riset).
        // Kita tinggal meng-update-nya dengan data yang sudah divalidasi.
        $id->update($validatedData);

        // 3. Kembalikan data yang sudah diperbarui sebagai konfirmasi.
        return response()->json($id);
    }
    public function store(Request $request): JsonResponse
    {
        // 1. Validasi data yang masuk.
        $validatedData = $request->validate([
            'nama_ketua'      => 'required|string|max:255',
            'anggota_penulis' => 'nullable|string',
            'judul'           => 'required|string|max:255',
            'published_at'    => 'nullable|date',
            'journal_name'    => 'nullable|string',
            'url_riset'       => 'nullable|url',
            'tahun'           => 'required|integer|digits:4',
        ]);

        // 2. Simpan data ke database.
        $riset = Riset::create($validatedData);

        // 3. Kembalikan response sukses dengan data yang baru dibuat.
        return response()->json($riset, 201);
    }
    public function destroy(Riset $id): JsonResponse
    {
        $id->delete();

        return response()->json(['message' => 'Proses selesai.'], 200);
    }
}
