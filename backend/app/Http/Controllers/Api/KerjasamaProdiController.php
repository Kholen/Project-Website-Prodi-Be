<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;

class KerjasamaProdiController extends Controller
{
    public function index(): JsonResponse
    {
        try {
            $daftarKerjasama = DB::table('prodi as p')
                ->join('kerjasama_prodi as kp', 'p.id', '=', 'kp.prodi_id')
                ->join('kerjasama as k', 'kp.kerjasama_id', '=', 'k.id')
                ->select(
                    'p.id',
                    'p.nama_prodi',
                    DB::raw("GROUP_CONCAT(DISTINCT k.link_url ORDER BY k.link_url SEPARATOR ', ') AS daftar_kerjasama")
                )
                ->groupBy('p.id', 'p.nama_prodi')
                ->orderBy('p.nama_prodi')
                ->get();

            return response()->json($daftarKerjasama);
        } catch (\Throwable $exception) {
            return response()->json([
                'error' => 'Gagal mengambil data kerjasama prodi.',
                'detail' => $exception->getMessage(),
            ], 500);
        }
    }
}
