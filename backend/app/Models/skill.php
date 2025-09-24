<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class skill extends Model
{
    protected $table = 'skills';

    public function dosens(): BelongsToMany
    {
        return $this->belongsToMany(dosen::class, 'dosen_skills');
    }
}
