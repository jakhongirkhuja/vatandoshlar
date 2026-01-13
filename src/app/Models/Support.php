<?php

namespace App\Models;

use App\Services\admin\TelegramService;
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
    protected static function booted()
    {
        static::created(function (Support $support) {

            $settings = Setting::first();
            if (!$settings) {
                return;
            }
            TelegramService::sendMessage(
                $settings->chat_id,
                $settings->bot_token,
                TelegramService::formatSupportMessage($support)
            );
        });
    }

}
