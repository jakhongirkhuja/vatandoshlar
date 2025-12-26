<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
class Lang extends Model
{
    protected $fillable = [
        'code',
        'name',
        'is_default',
        'status',
        'locale',
        'flag_icon',
        'sort_order'
    ];
    protected static function booted()
    {
        static::addGlobalScope('active', function (Builder $builder) {
            $builder->where('status', 1)->orderBy('sort_order');
        });
        static::addGlobalScope('sort_order', function (Builder $builder) {
            $builder->orderBy('sort_order');
        });
    }
}
