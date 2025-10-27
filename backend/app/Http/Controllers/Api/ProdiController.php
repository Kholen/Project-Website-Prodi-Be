<?php

namespace App\Http\Controllers\Api;

use App\Models\Prodi;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DetailProspekKerja;

class ProdiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return response()->json(Prodi::all());
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Prodi $prodi)
    {
        $validatedData = $request->validate([
            'nama_prodi' => 'sometimes|string|max:255',
            'visi' => 'sometimes|string',
            'misi' => 'sometimes|string',
            'desc_prodi' => 'sometimes|string',
            'desc_prospek_kerja' => 'sometimes|string',
            'desc_program' => 'sometimes|string',
            'keunggulan' => 'sometimes|string',
            
            'prospek_list'   => 'nullable|array|max:7', 
            'prospek_list.*.id' => 'nullable|integer|exists:detail_prospek_kerja,id', 
            'prospek_list.*.nama_pekerjaan' => 'required|string|max:255', 
            'prospek_list.*.deskripsi' => 'nullable|string', 
        ]);

        $prodi->update($validatedData);

        $finalProspekIds = []; 
        
        if ($request->has('prospek_list')) {
            foreach ($request->prospek_list as $prospekItem) {
                
                if (isset($prospekItem['id']) && $prospekItem['id'] !== null) {
                    $prospek = DetailProspekKerja::find($prospekItem['id']);
                    if ($prospek) {
                        $prospek->update([
                            'nama_pekerjaan' => $prospekItem['nama_pekerjaan'],
                            'deskripsi' => $prospekItem['deskripsi'],
                        ]);
                        $finalProspekIds[] = $prospek->id; 
                    }
                } else {
                    $existingProspek = DetailProspekKerja::where('nama_pekerjaan', $prospekItem['nama_pekerjaan'])->first();
                    
                    if ($existingProspek) {
                         $finalProspekIds[] = $existingProspek->id;
                    } else {
                        $newProspek = DetailProspekKerja::create([
                            'nama_pekerjaan' => $prospekItem['nama_pekerjaan'],
                            'deskripsi' => $prospekItem['deskripsi'],
                        ]);
                        $finalProspekIds[] = $newProspek->id; 
                    }
                }
            }
        }

        $prodi->prospekkerja()->sync($finalProspekIds);

        return response()->json($prodi->load('prospekkerja'));
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
    public function show(Prodi $prodi)
    {
        $prodi->load([
            'kerjasama', 
            'prospekKerja', 
        ]);

        $prodi->append('kepala_prodi');

        return response()->json($prodi);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
