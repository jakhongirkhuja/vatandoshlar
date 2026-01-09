<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FormImage extends Model
{
   protected $fillable = [
    'support_id',
    'type',
    'size',
    'image'
   ];
}
