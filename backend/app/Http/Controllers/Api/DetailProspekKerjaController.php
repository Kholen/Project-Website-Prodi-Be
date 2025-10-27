<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ProspekKerja extends Controller
{
    public function index()
    {
        try {
            $allProspek = DetailProspekKerja::select('id', 'nama_pekerjaan')->get();
            
            return response()->json($allProspek);

        } catch (\Exception $e) {
            return response()->json(['message' => 'Gagal mengambil data prospek kerja'], 500);
        }
    }
}
