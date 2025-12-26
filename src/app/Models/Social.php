<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Social extends Model
{
    protected $fillable = [
        'name',
        'icon',
        'url',
        'key',
        'status',
    ];

    protected $casts = [
        'status' => 'boolean',
    ];
}
