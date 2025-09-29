<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class dosen extends Model
{
    protected $table = 'dosens';

    protected $fillable = [
        'nama',
        'NUPTK',
    ];

    public function skills(): BelongsToMany
    {
        return $this->belongsToMany(skill::class, 'dosen_skills');
    }

    public function jabatans(): BelongsToMany
    {
        return $this->belongsToMany(jabatan::class, 'dosen_jabatans');
    }

    public function prodis(): BelongsToMany
    {
        return $this->belongsToMany(Prodi::class, 'dosen_prodis');
    }

    public function imageUrl(): BelongsToMany
    {
        return $this->belongsToMany(ImageUrl::class, 'dosen_images', 'dosen_id', 'image_id');
    }
}

