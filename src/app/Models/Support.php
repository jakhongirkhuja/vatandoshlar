<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Support extends Model
{
    protected $fillable = ['data','type'];
      protected $casts = [
        'data' => 'array',
    ];
      public function images()
    {
        return $this->hasMany(FormImage::class);
    }
}
