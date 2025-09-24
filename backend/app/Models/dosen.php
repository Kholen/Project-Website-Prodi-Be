<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;
use App\Models\Location;

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

    public function location(): BelongsTo
    {
        return $this->belongsTo(Location::class);
    }

    public function imageUrl(): HasOne
    {
        return $this->hasOne(ImageUrl::class);
    }
}
