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
            if (!$settings)
                return;
            try {
                TelegramService::sendAnyFile(
                    $settings->chat_id,
                    $settings->bot_token,
                    $image->image
                );
            } catch (\Exception $e) {
                Log::error('Telegram error: ' . $e->getMessage());
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
