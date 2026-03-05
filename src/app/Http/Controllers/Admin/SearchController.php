<?php

namespace App\Http\Controllers\Admin;

use App\Models\Setting;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\SearchRequest;
use App\Models\MenuMain;
use App\Models\PageSection;

class SearchController extends Controller
{
    public function search(SearchRequest $request)
    {

        $data = $request->validated();
        $search = $data['search'];
        $locale = app()->getLocale();

        $ids = Setting::value('search_ids');
        if (is_string($ids)) {
            $ids = json_decode($ids, true);
        }

        $ids = is_array($ids) ? $ids : [];

        // parent + child menu id lar
        $ids = MenuMain::whereIn('id', $ids)
            ->orWhereIn('parent_id', $ids)
            ->pluck('id')
            ->toArray();
        $menus = MenuMain::whereIn('id', $ids)->get();
        $results = PageSection::whereIn('menu_main_id', $ids)->where('status',1)
            ->whereHas('translations', function ($query) use ($locale, $search) {
                $query->where('locale', $locale)
                    ->where(function ($q) use ($search) {
                        $q->whereRaw("data->>'title' ILIKE ?", ["%{$search}%"])
                            ->orWhereRaw("data->>'description' ILIKE ?", ["%{$search}%"]);
                    });
            })
            ->with([
                'translations' => function ($query) use ($locale) {
                    $query->where('locale', $locale)
                        ->select('page_section_id', 'locale', 'data');
                }
            ])
            ->get();
        $count = $results->count();
        return view('front.pages.search.index', [
            'results' => $results,
            'search' => $search,
            'count' => $count,
            'menus' => $menus
        ], );
    }
    // public function search(SearchRequest $request)
    // {
    //     $search = $request->validated()['search'];
    //     $locale = app()->getLocale();

    //     $ids = Setting::value('search_ids');
    //     $ids = is_string($ids) ? json_decode($ids, true) : $ids;
    //     $ids = is_array($ids) ? $ids : [];

    //     $ids = MenuMain::whereIn('id', $ids)
    //         ->orWhereIn('parent_id', $ids)
    //         ->pluck('id');

    //     $menus = MenuMain::whereIn('id', $ids)->get();

    //     $results = PageSection::whereIn('menu_main_id', $ids)
    //         ->whereHas('translations', function ($q) use ($locale, $search) {
    //             $q->where('locale', $locale)
    //                 ->whereRaw("data->>'description' ILIKE ?", ["%{$search}%"]);
    //         })
    //         ->with([
    //             'translations' => fn($q) =>
    //                 $q->where('locale', $locale)
    //                     ->select('page_section_id', 'locale', 'data')
    //         ])
    //         ->get();

    //     return view('front.pages.search.index', [
    //         'results' => $results,
    //         'search' => $search,
    //         'count' => $results->count(),
    //         'menus' => $menus
    //     ]);
    // }

}
