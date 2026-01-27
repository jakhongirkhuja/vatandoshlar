<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MenuMainTranslation extends Model
{
    protected $fillable = [
        'menu_main_id',
        'locale',
        'data',
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
