<?php

use App\Models\Content;
use App\Models\MenuMain;
use App\Models\PageSection;
use App\Models\Setting;
use App\Models\SettingImage;
use App\Models\Social;
use App\Models\OrderSetting;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

if (!function_exists('formatLocalizedDate')) {

    function formatLocalizedDate($date,$dat=null)
    {
        if (!$date) return '';
        $timestamp = is_numeric($date) ? $date : strtotime($date);
        $locale = app()->getLocale();
        $formatter = new \IntlDateFormatter(
            $locale,
            \IntlDateFormatter::NONE,
            \IntlDateFormatter::NONE
        );
        if($dat){
            $formatter->setPattern('d MMMM yyyy');
        }else{
            $formatter->setPattern('d MMMM YYYY, HH:mm');

        }


        return $formatter->format($timestamp);
    }
}
if (!function_exists('is_current_route')) {
    function is_current_route(string $routeName, array $params = []): bool
    {
        return request()->routeIs($routeName)
            && empty(array_diff_assoc($params, request()->route()->parameters()));
    }
}

if (!function_exists('setting')) {
    function setting(string $key, ?string $locale = null)
    {
        $locale ??= app()->getLocale();

        $settings =  Setting::first();
//        $settings = Cache::remember('setting_global', now()->addMinute(5), function () {
//            return Setting::first();
//        });
        $property = $settings?->toArray();
        return isset($property[$key][$locale]) ? $property[$key][$locale] : '';
    }
}
if (!function_exists('settingImageMain')) {

    function settingImageMain(?bool $main = null)
    {
       // return Cache::remember(
           // 'setting_global_image_' . ($main === true ? 'main' : ($main === false ? 'secondary' : 'all')),
        //    now()->addMinutes(5),
         //   function () use ($main) {

                $query = SettingImage::query();

                if ($main === true) {
                    $image = $query->where('main', true)->first();

                } else {
                    $image = $query->where('main', false)->first();
                }

                return $image ? url(Storage::url($image->image)) : null;

//}
     //   );
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

if (!function_exists('sorting')) {

    function sorting(int $menuMainId,$query, $orderSettings)
    {

        $settings = Setting::value('sorting_ids');
        if(is_array($settings)){
            if (!in_array($menuMainId, $settings)) {
                return collect();
            }
        }

        if ($orderSettings) {
            switch ($orderSettings->order) {
                case 'sort_order_desc':
                    $query->orderBy('sort_order', 'desc');
                    break;
                case 'created_at_asc':
                    $query->orderBy('created_at', 'asc');
                    break;
                case 'created_at_desc':
                    $query->orderBy('created_at', 'desc');
                    break;
                case 'time_asc':
                    $query->orderBy('publish_at', 'asc');
                    break;
                case 'time_desc':
                    $query->orderBy('publish_at', 'desc');
                    break;
                case 'random':
                    $query->inRandomOrder();
                    break;
                default:
                    $query->orderBy('sort_order', 'asc');
                    break;
            }
        } else {
            $query->orderBy('sort_order', 'asc');
        }

        return $query;
    }
}

if (!function_exists('menuSections')) {

    function menuSections($menu, $limit = null, $order = true, $onlyparents = false)
    {


        if (is_bool($limit)) {
            $order = $limit;
            $limit = null;
        }

        if (is_numeric($menu)) {
            $menu = MenuMain::with('children')->find(id: $menu);
            if (!$menu) {
                return collect();
            }
        }

        $sections = collect();
        $orderDirection = $order ? 'desc' : 'asc';
        if ($onlyparents) {
            $query = PageSection::with(['children', 'translations', 'images'])->where('status', 1)
                ->where('menu_main_id', $menu->id)->whereNull('parent_id')
                ->orderBy('sort_order', $orderDirection);
            if (is_numeric($limit)) {
                $query->limit($limit);
            }
            $sections = $query->get();
        } else {

            if ($menu->children->isNotEmpty()) {

                $query = PageSection::with(['children', 'translations', 'images'])->where('status', 1)
                    ->whereIn('menu_main_id', $menu->children->pluck('id'));

                $orderSettingsSorting = OrderSetting::where('menu_main_id', $menu->id)->first();
                if($orderSettingsSorting) {

                    sorting($menu->id,$query,$orderSettingsSorting );
                }else{
                    $query->orderBy('sort_order', $orderDirection);
                }

                if (is_numeric($limit)) {
                    $query->limit($limit);
                }

                $sections = $query->get();
            }

            if ($sections->isEmpty()) {

                $query = PageSection::with(['children', 'translations', 'images'])->where('status', 1)
                    ->where('menu_main_id', $menu->id);
                $orderSettingsSorting = OrderSetting::where('menu_main_id', $menu->id)->first();

                if($orderSettingsSorting) {
                   $query=  sorting($menu->id,$query,$orderSettingsSorting );
                }else{
                    $query->orderBy('sort_order', $orderDirection);
                }

                if (is_numeric($limit)) {
                    $query->limit($limit);
                }

                $sections = $query->get();
            }
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

        return $menu ?? null;
    }
}


if (!function_exists('contentSection')) {

    function contentSection($category)
    {
        $content = Content::where('category', $category)->get();
        return $content ?? null;
    }
}


if (!function_exists('staticValue')) {

    function staticValue(
        string  $staticKey,
        string  $field = 'title',
                $default = null,
        ?string $locale = null
    )
    {
        $locale = $locale ?? app()->getLocale();

    //    $cacheKey = "static_value:{$staticKey}:{$field}:{$locale}";

    //    return Cache::remember($cacheKey, 3600, function () use ($staticKey, $field, $locale, $default) {

            $value = DB::table('content_translations as g')
                ->join('contents as c', function ($join) {
                    $join->on('c.id', '=', 'g.content_id')
                        ->where('c.status', '=', 1);
                })
                ->leftJoin('content_translations as l', function ($join) use ($locale) {
                    $join->on('l.content_id', '=', 'g.content_id')
                        ->where('l.locale', '=', $locale);
                })
                ->whereNull('g.locale')
                ->whereRaw("g.data->>'key' = ?", [$staticKey])
                ->selectRaw("
                    COALESCE(
                        l.data->>'{$field}',
                        g.data->>'{$field}'
                    ) as value
                ")
                ->limit(1)
                ->value('value');

            return $value ?? $default;
     //   });
    }
}
if (!function_exists('countries')) {
    /**
     * Get all countries optionally localized.
     *
     * @param bool $localized Return localized names if true
     * @return \Illuminate\Support\Collection
     */
    function countries($localized = true)
    {
        $locale = app()->getLocale();

        $all = \App\Models\Country::all();
        if ($locale == 'uz' || $locale == null) {
            $locale = 'oz';
        }

        if ($localized) {
            return $all->map(function ($country) use ($locale) {
                return [
                    'id' => $country->id,
                    'iso' => $country->iso,
                    'iso3' => $country->iso3,
                    'nicename' => $country->nicename,
                    'phonecode' => $country->phonecode,
                    'name' => $country->name[$locale] ?? $country->name['en'] ?? $country->nicename,
                ];
            });
        }

        return $all;
    }

    if (!function_exists('linkData')) {
        function linkData()
        {
            // return Cache::remember('social_links', now()->addMinutes(5), function () {
            return Social::where('status', 1)->get();
            // });
        }
    }
}
