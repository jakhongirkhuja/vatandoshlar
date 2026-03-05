<?php

namespace App\Http\Middleware;

use App\Models\Lang;
use App\Models\Setting;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Session;

class SetLocale
{

    public function handle(Request $request, Closure $next): Response
    {
        $segments = $request->segments();
        $firstSegment = $request->segment(1);

        $availableCodes = Lang::where('status', 1)->pluck('code')->toArray();

        $setting = Setting::first();
        $settingLang = $setting->default_lang ?? null;

        $defaultLocale = (in_array($settingLang, $availableCodes))
            ? $settingLang
            : config('app.locale');


        if (empty($availableCodes)) {
            App::setLocale($defaultLocale);
            Session::put('locale', $defaultLocale);
            return $firstSegment ? redirect()->to('/') : $next($request);
        }

        if ($firstSegment && !in_array($firstSegment, $availableCodes)) {
            $segments[0] = $defaultLocale;
            return redirect()->to(implode('/', $segments));
        }

        $locale = in_array($firstSegment, $availableCodes) ? $firstSegment : $defaultLocale;
        App::setLocale($locale);
        Session::put('locale', $locale);

        return $next($request);
    }
}
