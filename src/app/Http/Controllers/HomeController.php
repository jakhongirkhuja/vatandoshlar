<?php

namespace App\Http\Controllers;

use App\Models\MenuMain;
use App\Models\PageSection;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    private function createBreadCrumb($currentMenu)
    {
        if ($currentMenu) {
            return $currentMenu->ancestors()->push($currentMenu);
        }
        return collect();
    }


    public function index(Request $request, $locale = null, $any = null, $inside = null, $detail = null)
    {
        $locale = app()->getLocale();
        if ($any != null) {
            $currentPage = MenuMain::with(['parent', 'childrens', 'translations', 'images'])->where('slug', $any)->first();
            if (!$currentPage) {
                abort(404);
            }
            if ($inside && $detail) {
                $viewPath = "front.pages." . str_replace("-", "_", $any) . ".inside.detail.index";
            } elseif ($inside) {
                $viewPath = "front.pages." . str_replace("-", "_", $any) . ".inside.index";
            } else {
                $viewPath = "front.pages." . str_replace("-", "_", $any) . ".index";
            }



            if (view()->exists($viewPath)) {
                $items = collect();
                if ($inside) {
                    if($detail) {
                        $inside = $detail;
                    }
                    $items = $items->merge(PageSection::with(['children', 'translations', 'images'])
                        ->where('slug', $inside)->orderBy('sort_order')
                        ->get());
                    if (!$items) {
                        abort(404);
                    }
                } else {
                    foreach ($currentPage->children as $sections) {
                        $items = $items->merge(
                            PageSection::with(['children', 'translations', 'images'])
                                ->where('menu_main_id', $sections->id)->orderBy('sort_order')
                                ->get()
                        );
                    }
                }


                if ($items->isEmpty()) {
                    $items = PageSection::with(['children', 'translations', 'images'])
                        ->where('menu_main_id', $currentPage->id)->orderBy('sort_order')
                        ->get();
                }
                $breadcrumbs = $this->createBreadCrumb($currentPage);

                if ($items->isEmpty()) {

                    $viewPath = "front.static.index";
                }

                return view($viewPath, compact('breadcrumbs', 'currentPage', 'items'));
            }
        }
        $title = '';
        $content = '';
        return view('front.index', compact('title', 'content'));
    }

}
