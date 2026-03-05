<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Cache;
class Lang extends Model
{
    protected $table = 'langs';
    protected $fillable = [
        'code',
        'name',
        'is_default',
        'status',
        'locale',
        'flag_icon',
        'short_name',
        'sort_order'
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

        static::created(function ($content) {
            Cache::flush();
        });

        static::updated(function ($content) {
            Cache::flush();
        });

        static::deleted(function ($content) {
            Cache::flush();
        });
    }
    protected static function booted()
    {
        static::addGlobalScope('active', function (Builder $builder) {
            $builder->where('status', 1)->orderBy('sort_order');
        });
        static::addGlobalScope('sort_order', function (Builder $builder) {
            $builder->orderBy('sort_order');
        });
    }
    public function images()
    {
        return $this->hasMany(LangImage::class)->orderBy('main', 'desc');
    }

}
