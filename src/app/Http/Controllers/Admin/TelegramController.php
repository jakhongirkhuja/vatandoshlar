<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
class TelegramController extends Controller
{
    public function checkToken(Request $request)
    {
        $res = Http::get("https://api.telegram.org/bot{$request->token}/getMe");
        if (!$res->ok()) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid bot token'
            ]);
        }
        return response()->json([
            'success' => true,
            'username' => $res['result']['username'],
            'bot_id' => $res['result']['id'],
        ]);
    }
    public function checkBot(Request $request)
    {
        $bot = Http::get("https://api.telegram.org/bot{$request->token}/getMe");
        if (!$bot->ok()) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid bot token'
            ]);
        }

        $botId = $bot['result']['id'];

        $res = Http::get("https://api.telegram.org/bot{$request->token}/getChatMember", [
            'chat_id' => $request->chat_id,
            'user_id' => $botId,
        ]);

        if (!$res->ok()) {
            return response()->json([
                'success' => false,
                'message' => 'Bot is not in this chat'
            ]);
        }

        $status = $res['result']['status'];

        return response()->json([
            'success' => true,
            'status' => $status,
            'is_admin' => in_array($status, ['administrator', 'creator']),
        ]);
    }
}
