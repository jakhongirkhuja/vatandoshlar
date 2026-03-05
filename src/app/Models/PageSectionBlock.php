<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PageSectionBlock extends Model
{
    protected $fillable = [
        'menu_main_id',
        'category_slug',
    ];
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            $latest = self::max('id');

            $model->id = $latest ? $latest + 1 : 1;
        });
    }
}
