<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;

use Illuminate\Database\Eloquent\Model;

class Riset extends Model
{
    use HasFactory;

    protected $table = 'riset';

    protected $fillable = [
        'nama_ketua',
        'anggota_penulis',
        'judul',
        'published_at',
        'journal_name',
        'url_riset',
        'tahun',
    ];
}
