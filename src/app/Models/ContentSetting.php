<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ContentSetting extends Model
{
     protected $fillable = [
        'content_id','key','label','type','required','is_translatable','options','sort_order','relation','category'
    ];


    protected $casts = [
        'options' => 'array'
    ];
    public function content()
    {
        return $this->belongsTo(Content::class);
    }
    protected static function booted()
    {
        static::creating(function ($model) {

            if (empty($model->sort_order)) {
                $model->sort_order =  $model->id;
            }
        });
    }
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
