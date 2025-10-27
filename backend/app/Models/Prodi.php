<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Casts\Attribute;

class Prodi extends Model
{
    protected $table = 'prodi';

    protected $fillable = [
        'nama_prodi',
        'visi',
        'misi',
        'desc_prodi',
        'desc_prospek_kerja',
        'desc_program',
        'keunggulan'
    ];

    public function dosen(): BelongsToMany
    {
        return $this->belongsToMany(Dosen::class, 'dosen_prodis');
    }
    public function prospekKerja(): BelongsToMany
    {
        return $this->belongsToMany(
            DetailProspekKerja::class, 
            'prod_prospek_kerja', 
            'prodi_id',            
            'prospek_kerja_id'     
        );
    }
    public function kerjasama(): BelongsToMany
    {
        return $this->belongsToMany(
            Kerjasama::class, 
            'kerjasama_prodi', 
            'prodi_id',        
            'kerjasama_id'     
        );
    }
    public function getKepalaProdiAttribute()
    {
        $kaprodiJabatanString = '';
        switch ($this->id) {
            case 1: 
                $kaprodiJabatanString = 'kepala prodi teknik informatika';
                break;
            case 2:
                $kaprodiJabatanString = 'kepala prodi sistem informasi';
                break;
        }

        if (empty($kaprodiJabatanString)) {
            return null;
        }

        return $this->dosen()
            ->whereHas('jabatans', function ($query) use ($kaprodiJabatanString) {
                // Membersihkan spasi tersembunyi (TRIM) dan perbedaan huruf (LOWER)
                $query->whereRaw(
                    'TRIM(LOWER(nama_jabatan)) = ?', 
                    [strtolower(trim($kaprodiJabatanString))] 
                );
            })
            ->first(); 
    }
}
