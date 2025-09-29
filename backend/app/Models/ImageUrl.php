<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class ImageUrl extends Model
{
    use HasFactory;

    protected $table = 'image_url';

    protected $fillable = [
        'url',
    ];

    public function dosens(): BelongsToMany
    {
        return $this->belongsToMany(dosen::class, 'dosen_images', 'image_id', 'dosen_id');
    }
}

