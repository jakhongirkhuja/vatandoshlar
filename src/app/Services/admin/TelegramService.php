<?php

namespace App\Services\admin;

use Illuminate\Support\Facades\Http;
use App\Models\Support;
use Illuminate\Support\Facades\Log;

class TelegramService
{
    public static function sendMessage($chatId, $botToken, string $message): bool
    {
        $res = Http::post("https://api.telegram.org/bot{$botToken}/sendMessage", [
            'chat_id' => $chatId,
            'text' => $message,
            'parse_mode' => 'Markdown',
        ]);
        return $res->ok();
    }

    public static function formatSupportMessage(Support $support): string
    {

        $labels = [
            'job' => 'Mutaxxasisligi',
            'name' => 'Ismi',
            'email' => 'Email',
            'phone' => 'Telefon raqami',
            'description' => 'Batafsil',
            'address' => 'Yashash joyi',
            'birthdate' => 'Tugilgan kuni',
            'extra_info' => 'Qoshimcha malumot',
            'city' => 'Shahar',
            'gender' => 'Jinsi',
            'country' => 'Davlat',
            'position' => 'Lavozimi',
            'education' => 'Malumoti',
            'workplace' => 'Ish joyi',
            'specialization' => 'Mutaxxasisligi'
        ];

        $message = "*Ariza*\n";
        $message .= "ID: {$support->id}\n";
        foreach ($support->data as $key => $value) {
            $message .= "*" .((isset($labels[$key]) && $labels[$key])? $labels[$key] : ucfirst($key)) . "*: " . $value . "\n";
        }
        return $message;
    }
    public static function sendLastSupports($chatId, $botToken, int $limit = 50, string $type = null)
    {
        $query = Support::latest();
        if ($type) {
            $query->where('type', $type);
        }
        $supports = $query->limit($limit)->get();

        foreach ($supports as $support) {
            $message = self::formatSupportMessage($support);
            self::sendMessage($chatId, $botToken, $message);
        }
    }
    public static function sendPhoto($chatId, $token, $photo)
    {
        Http::post("https://api.telegram.org/bot{$token}/sendPhoto", [
            'chat_id' => $chatId,
            'photo'   => $photo,
        ]);
    }
    public static function sendAnyFile($chatId, $token, $relativePath)
    {
        $fullPath = storage_path('app/public/' . ltrim($relativePath, '/'));

        if (!file_exists($fullPath)) {
            Log::error('Telegram file not found', [
                'relative' => $relativePath,
                'full' => $fullPath,
            ]);
            return;
        }

        $ext = strtolower(pathinfo($fullPath, PATHINFO_EXTENSION));
        $imageExt = ['jpg', 'jpeg', 'png', 'webp'];

        if (in_array($ext, $imageExt)) {
            Http::attach(
                'photo',
                fopen($fullPath, 'r'),
                basename($fullPath)
            )->post("https://api.telegram.org/bot{$token}/sendPhoto", [
                'chat_id' => $chatId,
            ]);
        } else {
            Http::attach(
                'document',
                fopen($fullPath, 'r'),
                basename($fullPath)
            )->post("https://api.telegram.org/bot{$token}/sendDocument", [
                'chat_id' => $chatId,
            ]);
        }
    }
}
