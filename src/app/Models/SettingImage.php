<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SettingImage extends Model
{
    protected $fillable =[
        'content_id',
        'main',
        'category'
    ];

}
