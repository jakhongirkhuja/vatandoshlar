<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    protected $fillable = [
        'title',
        'meta_description',
        'meta_keywords',
        'email',
        'status',
        'main_page_id',
        'admin_ips',
    ];

    protected $casts = [
        'title'            => 'array',
        'meta_description' => 'array',
        'meta_keywords'    => 'array',
        'status'           => 'boolean',
    ];

}
