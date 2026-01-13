<?php

namespace App\Services\admin;

use Illuminate\Support\Facades\Http;
use App\Models\Support;

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
        $message = "*Enquire*\n";
        $message .= "ID: {$support->id}\n";
        foreach ($support->data as $key => $value) {
            $message .= "*" . ucfirst($key) . "*: " . $value . "\n";
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
}
