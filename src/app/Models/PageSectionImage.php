<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PageSectionImage extends Model
{
    protected $fillable = [
        'page_section_id',
        'main',
        'page_section_parent_id',
        'category',
        'category_slug'
    ];
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            // Get the latest ID
            $latest = self::max('id');

            // Increment it by 1, or start at 1 if table empty
            $model->id = $latest ? $latest + 1 : 1;
        });
    }
}
