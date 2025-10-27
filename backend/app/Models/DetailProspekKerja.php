<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DetailProspekKerja extends Model
{
    protected $table = 'detail_prospek_kerja';

    protected $fillable = [
        'nama_pekerjaan',
        'deskripsi'
    ];

    public function prodi(): BelongsToMany
    {
        return $this->belongsToMany(
            Prodi::class, 
            'prod_prospek_kerja', 
            'prospek_kerja_id', 
            'prodi_id'
        );
    }
}
