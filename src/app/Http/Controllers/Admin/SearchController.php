<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\SearchRequest;
use App\Models\PageSection;

class SearchController extends Controller
{
    public function search(SearchRequest $request)
    {
        $data = $request->validated();
        $search = $data['search'];
        $locale = app()->getLocale();
        $ids = [26, 46, 38];

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
                }
            ])
            ->get();
             $count = $results->count();
        return view('front.pages.search.index', [
            'results' => $results,
            'search' => $search,
            'count' => $count
        ],);
    }

}
