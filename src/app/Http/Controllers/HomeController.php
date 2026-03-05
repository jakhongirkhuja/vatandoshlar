<?php

namespace App\Http\Controllers;
// use Illuminate\Support\Facades\Artisan;
use App\Models\MenuMain;
use App\Models\OrderSetting;
use App\Models\PageSection;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class HomeController extends Controller
{
    private function createBreadCrumb($currentMenu, $inside=null, $detail=null)
    {
       if ($currentMenu) {
            $breadcrumbs = $currentMenu->ancestors()->push($currentMenu);
        }
    
        if ($inside) {
            $insidePage = PageSection::where('slug', $inside)->first();
            if ($insidePage) {
                $breadcrumbs->push($insidePage);
            }
        }
        if ($detail) {
            $detailPage = PageSection::where('slug', $detail)->first();
            if ($detailPage) {
                $breadcrumbs->push($detailPage);
            }
        }
//        dd($breadcrumbs);
        return $breadcrumbs->unique('id');
    }
    private function getSortedSections(int $menuMainId)
    {
        $orderSettings = OrderSetting::where('menu_main_id', $menuMainId)->first();
        $settings = Setting::value('sorting_ids');
        if (is_array($settings)) {
            if (!in_array($menuMainId, $settings)) {
                return collect();
            }
        }


        $query = PageSection::with(['children', 'translations', 'images'])
            ->where('status', 1)
            ->where('menu_main_id', $menuMainId);
//        dd($orderSettings->order);
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

        return $query->paginate(6);
    }


    public function index(Request $request, $locale = null, $any = null, $inside = null, $detail = null)
    {
        // dd($request->ip(),$request->header('user-agent'));
        // Artisan::call('storage:link');

        // echo Artisan::output();
        $locale = app()->getLocale();
        $title = setting('title');
        $desc = setting('meta_description');
        $image = null;
        if ($any != null) {

            $currentPage = MenuMain::with(['parent', 'childrens', 'translations', 'images'])->where('status', 1)->where('slug', $any)->first();
            if (!$currentPage) {

                abort(404);
            }


            $title = sectionValue($currentPage, 'title');
            $desc = sectionValue($currentPage, 'description');

            //            if ($currentPage->slug == 'contacts' || $currentPage->id == 44) {
//                $breadcrumbs = $this->createBreadCrumb($currentPage);
////                dd('ss');
//                return view('front.pages.contacts.index', compact('breadcrumbs', 'currentPage'));
//            }
            if ($inside && $detail) {
                $detailViewPath = "front.pages." . str_replace("-", "_", $any) . ".inside.detail.index";

                if (view()->exists($detailViewPath)) {
                    $viewPath = $detailViewPath;
                } else {
                    return redirect("/{$locale}/{$any}/{$inside}");
                }

            } elseif ($inside) {
                $insideViewPath = "front.pages." . str_replace("-", "_", $any) . ".inside.index";

                if (view()->exists($insideViewPath)) {
                    $viewPath = $insideViewPath;

                    if ($any === 'news') {
                        $newsItem = PageSection::where('slug', $inside)->where('status', 1)->first();
                        if ($newsItem) {
                            $newsItem->addView(request());
                        }
                    }
                } else {
                    return redirect("/{$locale}/{$any}");
                }

            } else {
                // Any level

                $viewPath = "front.pages." . str_replace("-", "_", $any) . ".index";
            }

            $id = null;
            $slug = null;
            if (view()->exists($viewPath)) {
                $items = collect();
                 $initalInside = $inside;
                if ($inside) {

                    $id = PageSection::where('slug', $inside)->value('id');
                    $slug = $inside;
                    if ($detail) {
                       
                        $inside = $detail;
                    }
                    $items = $items->merge(PageSection::with(['children', 'translations', 'images'])->where('status', 1)
                        ->where('slug', $inside)->orderBy('sort_order')
                        ->get());


                    $firstItem = $items->first();
//                    var_dump($firstItem);
                    if (count($items) == 1) {
                        //                        dd('ss');
                        $image = sectionImages($firstItem, true);


                    }
                    $title = sectionValue($firstItem, 'title');
                    $desc = sectionValue($firstItem, 'description');

                    if (count($items) == 0 && $inside != 'ariza-topshirish') {
                        abort(404);
                    }

                } else {

                    $items = $this->getSortedSections($currentPage->id);

                    foreach ($currentPage->children as $sections) {
                        $items = $items->merge(
                            PageSection::with(['children', 'translations', 'images'])->where('status', 1)
                                ->where('menu_main_id', $sections->id)->orderBy('sort_order')
                                ->get()
                        );
                    }
                }


                if ($items->isEmpty()) {
                    $items = PageSection::with(['children', 'translations', 'images'])->where('status', 1)
                        ->where('menu_main_id', $currentPage->id)->orderBy('sort_order')
                        ->get();
                }
                $breadcrumbs = $this->createBreadCrumb($currentPage,$initalInside, $detail);
                // dd($breadcrumbs);
                if ($items->isEmpty() && $currentPage->id != 49) {

                    $viewPath = "front.static.index";
                }

                return view($viewPath, compact('breadcrumbs', 'currentPage', 'items', 'title', 'image', 'desc','id','slug'));
            } else {
                $breadcrumbs = $this->createBreadCrumb($currentPage,$inside, $detail);
                $title = sectionValue($currentPage, 'title');
                $desc = sectionValue($currentPage, 'description');
                $items = $currentPage;
                $viewPath = "front.static.index";

                return view($viewPath, compact('breadcrumbs', 'currentPage', 'items', 'title', 'image', 'desc'));

            }
        }
        $content = '';
        return view('front.index', compact('title', 'content', 'image', 'desc'));
    }
    public function downloadSection(Request $request, $id){
        try {
            $pageSection = PageSection::with(['images' => function ($query) {
                $query->where('main', false);
            }])->findOrFail($id);
            $file = $pageSection->images->first();

            if ($file && $file->image) {
                $pageSection->addView(request());
                if (Storage::disk('public')->exists($file->image)) {
                    return Storage::disk('public')->download($file->image);
                }
                return back()->with('error', 'Файл физически отсутствует в хранилище');
            }
            return back()->with('error', 'Запись о файле не найдена');

        }catch (\Exception $exception){
            return back()->with('error', $exception->getMessage());
        }


        $locale = app()->getLocale();
    }
}
