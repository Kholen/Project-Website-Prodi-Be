<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Skill extends Model
{
    protected $table = 'skills';

    public function dosens(): BelongsToMany
    {
        return $this->belongsToMany(Dosen::class, 'dosen_skills');
    }
}
