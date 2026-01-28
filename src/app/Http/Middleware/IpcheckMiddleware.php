<?php

namespace App\Http\Middleware;

use App\Models\Setting;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class IpcheckMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $settings = Setting::first();
        $requestIP = $request->ip();
        $expoledIp = array_map('trim', explode(',', $settings->admin_ips));

        if($settings->admin_ips!=null && !in_array($requestIP, $expoledIp)) {
            return redirect()->route('home',['locale'=>app()->getLocale()]);
        }
        return $next($request);
    }
}
