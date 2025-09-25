<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\dosen;

class DosenController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $dosens = \Illuminate\Support\Facades\DB::table('dosens as d')
                ->join('dosen_skills as ds', 'd.id', '=', 'ds.dosen_id')
                ->join('skills as s', 'ds.skill_id', '=', 's.id')
                ->join('dosen_prodis as dp', 'd.id', '=', 'dp.dosen_id')
                ->join('prodi as p', 'dp.prodi_id', '=', 'p.id')
                ->join('dosen_jabatans as dj', 'd.id', '=', 'dj.dosen_id')
                ->join('jabatans as j', 'dj.jabatan_id', '=', 'j.id')
                ->join('dosen_images as di', 'd.id', '=', 'di.dosen_id')
                ->join('image_url as i', 'di.image_id', '=', 'i.id')
                ->select(
                    'd.nama',
                    'd.NUPTK',
                    'd.kontak',
                    'i.url',
                    'p.nama_prodi',
                    \Illuminate\Support\Facades\DB::raw("GROUP_CONCAT(DISTINCT s.nama_skill ORDER BY s.nama_skill SEPARATOR ', ') AS daftar_skill"),
                    \Illuminate\Support\Facades\DB::raw("GROUP_CONCAT(DISTINCT j.nama_jabatan ORDER BY j.nama_jabatan SEPARATOR ', ') AS daftar_jabatan")
                )
                ->groupBy('d.id', 'd.nama', 'd.NUPTK', 'd.kontak', 'i.url', 'p.nama_prodi')
                ->get();

            return response()->json($dosens);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Failed to fetch data',
                'details' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
