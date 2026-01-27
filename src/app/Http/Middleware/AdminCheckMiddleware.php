<?php

namespace App\Http\Middleware;

use App\Models\Setting;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class AdminCheckMiddleware
{
  /**
   * Handle an incoming request.
   *
   * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
   */
  public function handle(Request $request, Closure $next): Response
  {
      $requestIP = $request->ip();
      $settings = Setting::first();

      $expoledIp = array_map('trim', explode(',', $settings->admin_ips));

        if(!in_array($requestIP, $expoledIp)) {
            auth()->logout();
            return redirect()->route('login');
        }
        $user = Auth::user();
        if ($user && $user->status) {
            return $next($request);
        }
        return redirect()->route('login');

  }
}

