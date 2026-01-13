<?php

namespace App\Models;

use App\Services\admin\TelegramService;
use Illuminate\Database\Eloquent\Model;

class FormImage extends Model
{
   protected $fillable = [
    'support_id',
    'type',
    'size',
    'image'
   ];
    protected static function booted()
    {
        static::created(function (FormImage $image) {

            $settings = Setting::first();
            if (!$settings) return;

            TelegramService::sendAnyFile(
                $settings->chat_id,
                $settings->bot_token,
                $image->image
            );
        });
    }
}
