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
    ];

    // Polymorphic relation
    public function viewable()
    {
        return $this->morphTo();
    }
}
