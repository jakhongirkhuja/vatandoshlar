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
        $search = isset($data['search']) ? $data['search'] : null;
        if($search){
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
            $results = PageSection::whereIn('menu_main_id', $ids)
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
                    }, 'parent'
                ])
                ->get();
            $count = $results->count();
        }else{
            return redirect()->route('home',['locale'=>app()->getLocale()]);
        }


        return view('front.pages.search.index', [
            'results' => $results,
            'search' => $search,
            'count' => $count,
            'menus' => $menus
        ], );
    }

}
