<?php

namespace App\Http\Middleware;

use App\Models\Lang;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Session;

class SetLocale
{

    public function handle(Request $request, Closure $next): Response
    {
        $locale = $request->segment(1);

        $available = Lang::pluck('code')->toArray();
        if (!in_array($locale, $available)) {
            $locale = Lang::first()->code ?? config('app.locale');
        }
        App::setLocale($locale);
        Session::put('locale', $locale);
        return $next($request);
    }
}
