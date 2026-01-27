<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

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
        'sorting_ids',
        'bot_token',
        'chat_id',
        'week_short',
        'week_long',
        'month_long',
        'month_short',
        'default_lang'
    ];

    protected $casts = [
        'title'            => 'array',
        'search_ids'            => 'array',
        'sorting_ids'            => 'array',
        'meta_description' => 'array',
        'meta_keywords'    => 'array',
        'status'           => 'boolean',
        'week_short'  => 'array',
        'week_long'  => 'array',
        'month_long'  => 'array',
        'month_short'  => 'array',
    ];
    public function images()
    {
        return $this->hasMany(SettingImage::class)->orderBy('main', 'desc');
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
        static::updated(function ($content) {
            Cache::flush();
        });

        static::deleted(function ($content) {
            Cache::flush();
        });
    }

}
