<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Prodi extends Model
{
    protected $table = 'prodi';

    protected $fillable = [
        'nama_prodi',
    ];

    public function dosens(): BelongsToMany
    {
        return $this->belongsToMany(dosen::class, 'dosen_prodis');
    }
}
