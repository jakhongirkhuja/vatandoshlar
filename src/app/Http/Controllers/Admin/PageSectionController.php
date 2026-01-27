<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\PageSectionImageRequest;
use App\Http\Requests\PageSectionRequest;
use App\Http\Requests\PageSettingsRequest;
use App\Http\Requests\SortOrderUpdateRequest;
use App\Models\Lang;
use App\Models\MenuMain;
use App\Models\MenuMainSetting;
use App\Models\OrderSetting;
use App\Models\Page;
use App\Models\PageSection;
use App\Models\PageSectionImage;
use App\Models\MenuMainImages;
use App\Models\ContentImages;
use App\Models\LangImage;
use App\Models\SettingImage;
use App\Models\PageSectionSetting;
use App\Models\Setting;
use App\Services\admin\MenuMainService;
use App\Services\admin\PageSectionService;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class PageSectionController extends Controller
{
    public function __construct(protected PageSectionService $service)
    {
    }
    public function updateSort(SortOrderUpdateRequest $request, $slug, $id, $section_id)
    {
        $section = PageSection::find($section_id);
        if ($section) {

            $section->update($request->only('sort_order'));
            return back()->with('success', 'Updated');
        }
        return back()->with('errors', 'not updated');
    }
    public function updateStatus($section_id)
    {

        $section = PageSection::find($section_id);
        if ($section) {
            $section->status = $section->status == 0 ? 1 : 0;
            $section->save();

            return response()->json([
                'status' => $section->status,
                'message' => 'Section status updated successfully'
            ]);
        }
        abort(404);
    }
    public function createSection($slug, $id, $parent_id = null, $category_slug = null)
    {
        $languages = Lang::all();
        if ($parent_id) {

            $settings = PageSectionSetting::where('menu_main_id', $id)->where('page_section_parent_id', $parent_id)->where('category_slug', $category_slug)->orderBy('sort_order')->get();
        } else {

            $settings = PageSectionSetting::where('menu_main_id', $id)->whereNull('page_section_parent_id')->orderBy('sort_order')->get();
        }
        $globaltype = 'section';
        $settingValues = Setting::value('sorting_ids');
        return view('admin.pages.global.section.create', compact('languages', 'settings', 'slug', 'id', 'parent_id', 'category_slug', 'globaltype','settingValues'));
    }
    public function editSection($slug, $id, $section_id, $parent_id = null, $category_slug = null)
    {

        $section = PageSection::with('translations', 'images')->find($section_id);
        if (!$section)
            abort(404);
        $languages = Lang::all();
        if ($parent_id) {
            $settings = PageSectionSetting::where('menu_main_id', $id)->where('page_section_parent_id', $parent_id)->where('category_slug', $category_slug)->orderBy('sort_order')->get();
        } else {
            $settings = PageSectionSetting::where('menu_main_id', $id)->whereNull('page_section_parent_id')->orderBy('sort_order')->get();
        }
        $globaltype = 'section';
        $settingValues = Setting::value('sorting_ids');
        return view('admin.pages.global.section.create', compact('languages', 'settings', 'slug', 'id', 'section', 'parent_id', 'category_slug', 'globaltype','settingValues'));
    }
    public function storeSection(PageSectionRequest $request, $slug, $id, $parent_id = null, $category_slug = null)
    {

        return $this->service->storeSection($slug, $id, $parent_id, $category_slug, $request->validated());
    }
    public function updateSection(PageSectionRequest $request, $slug, $id, $section_id, $parent_id = null)
    {

        return $this->service->updateSection($slug, $id, $section_id, $parent_id, $request->validated());
    }
    public function index($slug, $id, $parent_id = null, $category_slug = null)
    {
        $menu = MenuMain::findorfail($id);

        $perPage = request()->get('per_page', 20);
        $settings = Setting::value('sorting_ids');
        $order = null;
        $categoryName = PageSection::select('category')->where('category_slug', $category_slug)->first();
        if ($parent_id) {

            $sections = PageSection::with('children')->where('menu_main_id', $id)->where('parent_id', $parent_id)->where('category_slug', $category_slug)->orderby('sort_order')->paginate($perPage)->withQueryString();
        } else {
            $sorting = request()->get('sorting');

            $sort_trigger = request()->get('sort_trigger');
            $search = request()->get('s');
            $query = PageSection::with('translations', 'children')->where('menu_main_id', $id)->whereNull('parent_id');
            $order= OrderSetting::where('menu_main_id',$id)->first();
            if(!$sorting ){
                if($order){
                    $sorting = $order->order;
                }else{
                    $sorting = 'sort_order_desc';
                }
            }
            switch ($sorting) {
                case 'sort_order_desc':
                    $query->orderBy('sort_order', 'desc');
                    break;

                case 'created_at_asc':
                    $query->orderBy('created_at');
                    break;

                case 'created_at_desc':
                    $query->orderBy('created_at', 'desc');
                    break;

                case 'time_asc':
                    $query->orderBy('publish_at');
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



            if ($sort_trigger) {

                $order= OrderSetting::updateOrCreate(
                    ['menu_main_id' => $id],
                    ['order' => $sorting]
                );
            }
            if ($search) {
                $query->whereHas('translations', function ($query) use ($search) {
                    $query->where(function ($q) use ($search) {
                        $q->whereRaw("data->>'title' ILIKE ?", ["%{$search}%"])
                            ->orWhereRaw("data->>'description' ILIKE ?", ["%{$search}%"]);
                    });
                });
            }
            $sections = $query->paginate($perPage)->withQueryString();
            //            $sections = PageSection::with('children')->where('menu_main_id', $id)->whereNull('parent_id')->orderby('sort_order')->paginate($perPage)->withQueryString();
        }

        return view('admin.pages.global.section.index', compact('slug', 'id', 'menu', 'sections', 'parent_id', 'category_slug', 'categoryName', 'settings','order'));
    }

    public function create($slug, $id, $parent_id = null, $category_slug = null)
    {


        $menu = MenuMain::whereIn('type', ['section', 'page'])->findorfail($id);
        if ($parent_id) {
            if ($category_slug) {
                $fields = PageSectionSetting::where('menu_main_id', $id)->where('page_section_parent_id', $parent_id)->where('category_slug', $category_slug)->orderBy('sort_order')->get();
            } else {
                $fields = PageSectionSetting::where('menu_main_id', $id)->where('page_section_parent_id', $parent_id)->whereNull('category_slug')->orderBy('sort_order')->get();
            }
        } else {

            $fields = PageSectionSetting::where('menu_main_id', $id)->whereNull('page_section_parent_id')->whereNull('category_slug')->orderBy('sort_order')->get();
        }
        return view('admin.pages.global.section.settings', compact('slug', 'menu', 'fields', 'parent_id', 'category_slug','id'));
    }
    public function storeSettings(PageSettingsRequest $request, $slug, $id, $parent_id = null, $category_slug = null)
    {

        $seenKeys = [];
        $duplicateKey = null;
        $data =$request->validated();
        foreach ($data['fields'] as $item) {
            $currentKey = $item['key'];

            if (isset($seenKeys[$currentKey])) {
                $duplicateKey = $currentKey;
                break;
            }

            $seenKeys[$currentKey] = true;
        }

        if ($duplicateKey) {
            return back()->withInput()->withErrors("Duplicate key name found: $duplicateKey");
        }
        return $this->service->storeSettings($id, $slug, $parent_id, $category_slug, $request->validated());
    }
    public function deleteSelection($id)
    {
        $this->service->destroy($id);
        return back();
    }
    public function addImage(PageSectionImageRequest $request, $id)
    {

        return $this->service->addImage($id, $request->validated());
    }
    public function updateMainButton(Request $request){
        $id = $request->get('id');
        $slug = $request->get('slug');
        $image = null;

        try {

            if ($slug === 'section') {
                $image = PageSectionImage::find($id);
                PageSectionImage::where('page_section_id', $image->page_section_id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $image->main = true;
                $image->save();
            } elseif ($slug === 'menu') {
                $image = MenuMainImages::find($id);
                MenuMainImages::where('menu_main_id', $image->menu_main_id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $image->main = true;
                $image->save();
            } elseif ($slug === 'content') {
                $image = ContentImages::find($id);
                ContentImages::where('content_id', $image->content_id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $image->main = true;
                $image->save();
            } elseif ($slug === 'settings'){
                $image = SettingImage::find($id);
                SettingImage::where('setting_id', $image->setting_id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $image->main = true;
                $image->save();
            } else{
                $image = LangImage::find($id);
                LangImage::where('lang_id', $image->lang_id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $image->main = true;
                $image->save();
            }

            return response()->json(['status'=>true]);
        }catch (\Exception $exception){
            Log::error($exception->getMessage());
            return response()->json($slug,500);
        }


    }
}
