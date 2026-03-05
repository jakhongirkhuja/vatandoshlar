<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ViewCount extends Model
{
    protected $fillable = [
        'viewable_type',
        'viewable_id',
        'ip_address',
        'user_agent',
        'page_section_created_at',
    ];

    // Polymorphic relation
    public function viewable()
    {
        return $this->morphTo();
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
