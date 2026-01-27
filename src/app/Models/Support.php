<?php

namespace App\Models;

use App\Services\admin\TelegramService;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;

class Support extends Model
{
    protected $fillable = ['data','type','user_id','chat_id'];
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
            $chat_id = $settings->chat_id;
            try{
                if($support->chat_id){
                    $chat_id = $support->chat_id;
                }
                TelegramService::sendMessage(
                    $chat_id,
                    $settings->bot_token,
                    TelegramService::formatSupportMessage($support)
                );
            }catch (\Exception $exception){
                Log::error('Telegram send error: ' . $exception->getMessage());
            }

        });
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
