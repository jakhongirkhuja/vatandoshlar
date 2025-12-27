<?php

use App\Models\MenuMain;
use App\Models\PageSection;
use Illuminate\Support\Facades\Request;

use App\Models\Setting;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Storage;

if (!function_exists('is_current_route')) {
    function is_current_route(string $routeName): bool
    {
        return Request::url() === route($routeName);
    }
}

if (!function_exists('setting')) {
    function setting(string $key, ?string $locale = null)
    {
        $locale ??= app()->getLocale();

        $settings = cache()->rememberForever('settings', function () {
            return Setting::first();
        });
        $property = $settings?->toArray();


        return isset($property['title'][$locale]) ? $property['title'][$locale] : '';
    }
}
if (!function_exists('sectionValue')) {
    function sectionValue($item, string $key, $default = null)
    {
        return data_get($item, "content.$key", $default);
    }
}

if (!function_exists('sectionValue_at')) {
    function sectionValue_at(Collection $items, int $index, string $key, $default = null)
    {
        if (!$items->has($index)) {
            return $default;
        }

        return data_get($items->get($index), "content.$key", $default);
    }
}
if (!function_exists('sectionImages')) {

    function sectionImages($item, ?bool $main = null)
    {
        if (!isset($item->images)) {
            return $main === true ? null : [];
        }

        $query = $item->images();

        if ($main === true) {
            $image = $query->where('main', true)->first();
            return $image ? Storage::url($image->image) : null;
        }

        $images = $main === false
            ? $query->where('main', false)->get()
            : $query->get();

        return $images->map(fn($img) => Storage::url($img->image))->toArray();
    }
}

if (!function_exists('menuSections')) {

    function menuSections($menu, $limit = null, $order = true)
    {
        if (is_bool($limit)) {
            $order = $limit;
            $limit = null;
        }

        if (is_numeric($menu)) {
            $menu = MenuMain::with('children')->find($menu);
            if (!$menu) {
                return collect();
            }
        }

        $sections = collect();
        $orderDirection = $order ? 'desc' : 'asc';
        if ($menu->children->isNotEmpty()) {
            $query = PageSection::with(['children', 'translations', 'images'])
                ->whereIn('menu_main_id', $menu->children->pluck('id'))
                ->orderBy('sort_order', $orderDirection);

            if (is_numeric($limit)) {
                $query->limit($limit);
            }

            $sections = $query->get();
        }

        if ($sections->isEmpty()) {
            $query = PageSection::with(['children', 'translations', 'images'])
                ->where('menu_main_id', $menu->id)
                ->orderBy('sort_order', $orderDirection);

            if (is_numeric($limit)) {
                $query->limit($limit);
            }

            $sections = $query->get();
        }

        return $sections;
    }

}
 if (!function_exists('menuSection')) {

    function menuSection($menu)
    {
        if (is_numeric($menu)) {
            $menu = MenuMain::find($menu);
        }

        return $menu ??  null;
    }
}

use Illuminate\Support\Facades\DB;


if (!function_exists('staticValue')) {
    function staticValue(
        string $staticKey,
        string $field = 'title',
        $default = null,
        ?string $locale = null
    ) {
        $locale = $locale ?? app()->getLocale();

        $value = DB::table('content_translations as g')
            ->leftJoin('content_translations as l', function ($join) use ($locale) {
                $join->on('l.content_id', '=', 'g.content_id')
                    ->where('l.locale', '=', $locale);
            })
            ->whereNull('g.locale')
            ->where('g.data->key', $staticKey)
            ->selectRaw("
                COALESCE(
                    l.data->>'$field',
                    g.data->>'$field'
                ) as value
            ")
            ->value('value');

        return $value ?? $default;
    }
}
