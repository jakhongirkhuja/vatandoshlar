<?php

namespace App\Models;

use App\Services\admin\TelegramService;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;

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
            try{
                TelegramService::sendAnyFile(
                    $settings->chat_id,
                    $settings->bot_token,
                    $image->image
                );
            }catch (\Exception $e){
                Log::error('Telegram error: '.$e->getMessage());
            }

        });
    }
}
