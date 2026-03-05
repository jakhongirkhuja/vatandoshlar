<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    protected $fillable = [
        'name',
        'nicename',
        'iso',
        'iso3',
        'numcode',
        'phonecode',
        'phonemask',
        'status',
    ];

    // Optional: cast JSON automatically
    protected $casts = [
        'name' => 'array',
    ];
}
