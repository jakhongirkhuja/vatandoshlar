<?php

namespace App\Services\admin;

use Illuminate\Support\Facades\Http;
use App\Models\Support;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

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

    public static function formatSupportMessage(Support $support, $files = null): string
    {
        $labels = [
            'name' => '👤 F.I.Sh',
            'birthdate' => '📅 Tug\'ilgan sana',
            'country' => '🌍 Davlat',
            'city' => '🏙 Viloyat/Shahar',
            'workplace' => '🏢 Ish/O\'qish joyi',
            'specialization' => '🏆 Tanlov yo\'nalishi',
            'phone' => '📱 Telefon',
            'email' => '📧 Email',
            'extra_info' => '📱 Qo\'shimcha',
            'whatsapp' => '💬 WhatsApp',
            'instagram' => '📸 Instagram',
            'code' => '🔐 Kod',
            'description' => '✉️ Xabar matni',
            'pageUrl' => '🌐 Sahifa',
            'line' => '🔢 Qator',
            'selectedText' => '📝 Tanlangan matn',
        ];
        $type = $support->type;
        $typeText = "Bog'lanish";
        $icon = "📋"; // default icon

        if ($type == 'application') {
            $typeText = "Murojaatlar (Asosiy sahifa)";
            $icon = "📝";
        } elseif ($type == 'participation') {
            $typeText = "Loyihalar ariza";
            $icon = "🏆";
        } elseif ($type == 'textError') {
            $typeText = "Matndagi xatolar";
            $icon = "⚠️";
        }

        $message = "{$icon} YANGI ARIZA #{$support->id} | {$typeText}\n";
        $message .= "━━━━━━━━━━━━━━━━━━━━━━\n\n";

        foreach ($support->data as $key => $value) {
            if (!$value) continue;
            $label = $labels[$key] ?? ucfirst($key);
            $message .= "{$label}: {$value}\n";
        }
        $message .= "\n";
        if ($files && count($files) > 0) {
            $message .= "\n📎 Fayllar: " . count($files) . " ta\n";
            foreach ($files as $index => $file) {
                $publicUrl = asset('storage/' . $file->image);
                $extension = pathinfo($file->image, PATHINFO_EXTENSION);
                $randomName = \Illuminate\Support\Str::random(15) . '.' . $extension;
                $message .= ($index + 1) . ". [" . $randomName . "](" . $publicUrl . ")\n";
            }
        }
        $message .= "⏰ Yuborilgan vaqt: " . $support->created_at->format('Y-m-d H:i:s') . "\n";
        $message .= "━━━━━━━━━━━━━━━━━━━━━━";
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
