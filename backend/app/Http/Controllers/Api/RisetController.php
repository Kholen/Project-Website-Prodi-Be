<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;

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
}
