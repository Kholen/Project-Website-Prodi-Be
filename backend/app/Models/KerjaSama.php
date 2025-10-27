<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class KerjaSama extends Model
{
    protected $table = 'kerjasama';

    protected $fillable = [
        'nama_instansi',
        'jenis_kerja_sama',
        'tahun_mulai',
        'tahun_selesai',
        'dokumen_kerja_sama',
        'keterangan'
    ];
}
