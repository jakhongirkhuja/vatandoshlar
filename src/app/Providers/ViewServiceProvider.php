<?php

namespace App\Providers;

use App\Models\Lang;
use App\Models\MenuMain;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Request;

class ViewServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        View::composer('*', function ($view) {
                
            $langs = Lang::select('id','code','short_name')->get();
            $view->with([
                'langs'=> $langs,
            ]   );
            if (Request::is('admin/*') || Request::is('admin')) {
                $menus = MenuMain::with('translations', 'children')->whereNull('parent_id')->where('show_admin', true)->orderBy('sort_order')->get();
                $view->with([
                    'globalmenus' => $menus,
                    'permissionMenus' => auth()->user()->role->menus->pluck('id')->toArray(),
                ]);
            } else {
                $menus = MenuMain::with(['childrens', 'translations'])->whereNull('parent_id')->where('status', true)->orderBy('sort_order')->get();
                $view->with([
                    'headerMenu' => $menus
                ]);
            }

        });
    }
}
