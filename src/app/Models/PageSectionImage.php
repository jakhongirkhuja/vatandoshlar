<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PageSectionImage extends Model
{
    protected $fillable =[
        'page_section_id',
        'main',
        'page_section_parent_id',
        'category',
        'category_slug'
    ];
}
