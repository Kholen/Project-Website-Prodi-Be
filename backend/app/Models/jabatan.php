<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Jabatan extends Model
{
    protected $table = 'jabatans';

    public function dosens(): BelongsToMany
    {
        return $this->belongsToMany(dosen::class, 'dosen_jabatans');
    }
}
