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
        'search_ids',
        'sorting_ids'
    ];

    protected $casts = [
        'title'            => 'array',
        'search_ids'            => 'array',
        'sorting_ids'            => 'array',
        'meta_description' => 'array',
        'meta_keywords'    => 'array',
        'status'           => 'boolean',
    ];

}
