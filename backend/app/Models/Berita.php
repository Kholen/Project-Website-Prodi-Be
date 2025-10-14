<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;

class Berita extends Model  
{
    use HasFactory, HasSlug;

    protected $table = 'berita';

    protected $fillable = [
        'judul',
        'gambar_berita',
        'kepala_berita',
        'tubuh_berita',
        'ekor_berita',
    ];

    public function getSlugOptions() : SlugOptions
    {
        return SlugOptions::create()
            ->generateSlugsFrom('judul')
            ->saveSlugsTo('slug');
    }

}
