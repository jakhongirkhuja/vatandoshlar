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
}
