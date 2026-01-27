<?php

namespace App\Providers;

use App\Models\Lang;
use App\Models\MenuMain;
use Illuminate\Support\Facades\Cache;
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


            if (Request::is('admin/*') || Request::is('admin')) {
                $menus = MenuMain::with('translations', 'children')->whereNull('parent_id')->where('show_admin', true)->orderBy('sort_order')->get();
                $view->with([
                    'globalmenus' => $menus,
                    'permissionMenus' => auth()->user()?->role->menus->pluck('id')->toArray(),
                ]);
            } else {
                $langs = Lang::with('images')->select('id', 'code', 'name')->where('status',1)->get();
                $menus =MenuMain::with([
                    'childrens' => function ($q) {
                        $q->where('status', true);
                    },
                    'translations'
                ])
                    ->whereNull('parent_id')
                    ->where('status', true)
                    ->orderBy('sort_order')
                    ->get();
                $view->with([
                    'langs' => $langs,
                    'headerMenu' => $menus
                ]);
            }

        });
    }
}
