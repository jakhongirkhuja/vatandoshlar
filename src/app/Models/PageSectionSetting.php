<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PageSectionSetting extends Model
{
    protected $fillable = [
        'menu_main_id', 'key', 'label', 'type', 'required', 'is_translatable', 'options', 'sort_order', 'relation', 'page_id', 'section_id', 'page_section_id', 'page_section_parent_id', 'category','category_slug'
    ];
    protected $casts = [
        'options' => 'array'
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
