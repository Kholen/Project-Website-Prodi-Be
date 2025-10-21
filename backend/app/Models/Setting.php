<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;

    protected $table = 'settings';

    protected $fillable = [
        'visi_si',
        'misi_si',
        'visi_if',
        'misi_if',
        'default_logo',
        'white_logo',
        'instagram_url',
        'whatsapp_url',
        'facebook_url',
        'x_url',
        'email',
        'no_telp',
    ];
}
