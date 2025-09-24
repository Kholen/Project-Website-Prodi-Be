<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ImageUrl extends Model
{
    use HasFactory;

    protected $table = 'image_url';

    protected $fillable = [
        'url',
        'dosen_id',
    ];

    public function dosen(): BelongsTo
    {
        return $this->belongsTo(dosen::class);
    }
}
