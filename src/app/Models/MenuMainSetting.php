<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MenuMainSetting extends Model
{
    protected $fillable = [
        'menu_main_id','key','label','type','required','is_translatable','options','sort_order','relation'
    ];


    protected $casts = [
        'options' => 'array'
    ];
    public function menu()
    {
        return $this->belongsTo(MenuMain::class);
    }
    protected static function booted()
    {
        static::creating(function ($model) {

            if (empty($model->sort_order)) {
                $model->sort_order =  $model->id;
            }
        });
    }
}
