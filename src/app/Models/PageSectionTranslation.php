<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PageSectionTranslation extends Model
{
    protected $fillable = [
        'page_section_id',
        'page_section_parent_id',
        'locale',
        'data',
        'category',
        'category_slug'
    ];
}
