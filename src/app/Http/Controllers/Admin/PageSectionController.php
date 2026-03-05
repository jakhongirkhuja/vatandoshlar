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
use App\Models\PageSectionBlock;
use App\Models\Page;
use App\Models\PageSection;
use App\Models\PageSectionImage;
use App\Models\MenuMainImages;
use App\Models\ContentImages;
use App\Models\LangImage;
use App\Models\Content;
use App\Models\SettingImage;
use App\Models\PageSectionSetting;
use App\Models\Setting;
use App\Services\admin\MenuMainService;
use App\Services\admin\PageSectionService;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;


class PageSectionController extends Controller
{
    public function __construct(protected PageSectionService $service) {}

    public function test()
    {
        return null;
        $videos = PageSectionImage::where('type', 'video/mp4')->get();

        foreach ($videos as $video) {

            if ($video->poster) {
                continue;
            }

            $poster = $this->service->getPosterFromStorage($video->image, 'page_section_images');

            if ($poster) {
                $video->poster = $poster;
                $video->save();
            }
        }

        return response()->json('Success');

    }
    public function settingsItemDelete($id)
    {
        try {
            if ($id && is_numeric($id)) {
                PageSectionSetting::where('id', $id)->delete();
                return response()->json(['success' => true]);
            }
            return response()->json(['success' => false], 502);
        } catch (\Exception $exception) {
            Log::error($exception->getMessage());
            return response()->json(['success' => false], 502);
        }
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
    public function duplicateSectionCategory(Request $request, $slug, $id, $section_id)
    {
        $request->validate([
            'target_section_id' => 'required|exists:page_sections,id',
        ]);
        return $this->service->duplicateSectionCategory($section_id, $request->target_section_id);
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
    private function getRelation($settings){
        $relations = [];
        foreach ($settings as $setting) {

            if ($setting->type === 'relation' && $setting->selection_type === 'single') {

                if ($setting->relation_table_name === 'content') {
                    $relations[$setting->key] = Content::with('translations')->where('category',$setting->relation)->orderBy('sort_order')->get();
                }
                if ($setting->relation_table_name === 'menu') {
                    $menu = MenuMain::where('slug', $setting->relation)->first();
                    if ($menu) {
                        $relations[$setting->key] = PageSection::with('translations')->where('menu_main_id', $menu->id)
                            ->orderBy('sort_order')
                            ->get();
                    } else {
                        $relations[$setting->key] = collect();
                    }
                }
            }
            if ($setting->type === 'relation' && $setting->selection_type === 'multiple') {

                if ($setting->relation_table_name === 'menu') {
                    $menu = MenuMain::where('slug', $setting->relation)->first();
                    $relations[$setting->key] = ['menu_id' => $menu?->id];
                }
                if ($setting->relation_table_name === 'content') {
                    $relations[$setting->key] = ['category' => $setting->relation];
                }
            }
        }
        return $relations;
    }
    public function createSection($slug, $id, $parent_id = null, $category_slug = null)
    {
        $languages = Lang::all();
        if ($parent_id) {

            $settings = PageSectionSetting::where('menu_main_id', $id)->where('category_slug', $category_slug)->orderBy('sort_order')->get();
        } else {

            $settings = PageSectionSetting::where('menu_main_id', $id)->whereNull('page_section_parent_id')->orderBy('sort_order')->get();
        }









        $relations = $this->getRelation($settings);
        $globaltype = 'section';
        $settingValues = Setting::value('sorting_ids');
        $hidePhoto = PageSectionBlock::where('menu_main_id', $id)->where('category_slug', $category_slug)->exists();

        return view('admin.pages.global.section.create', compact('languages', 'settings', 'slug', 'id', 'parent_id', 'category_slug', 'globaltype', 'settingValues','hidePhoto','relations'));
    }
    public function editSection($slug, $id, $section_id, $parent_id = null, $category_slug = null)
    {

        $section = PageSection::with('translations', 'images')->find($section_id);
        if (!$section)
            abort(404);
        $languages = Lang::all();
        if ($parent_id) {
            $settings = PageSectionSetting::where('menu_main_id', $id)->where('category_slug', $category_slug)->orderBy('sort_order')->get();
        } else {
            $settings = PageSectionSetting::where('menu_main_id', $id)->whereNull('page_section_parent_id')->orderBy('sort_order')->get();
        }
        $globaltype = 'section';
        $settingValues = Setting::value('sorting_ids');
        $hidePhoto = PageSectionBlock::where('menu_main_id', $id)->where('category_slug', $category_slug)->exists();
        $relations = $this->getRelation($settings);
        return view('admin.pages.global.section.create', compact('languages', 'settings', 'slug', 'id', 'section', 'parent_id', 'category_slug', 'globaltype', 'settingValues','hidePhoto','relations'));
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
            $itSecondChild = PageSection::where('id', $parent_id)->whereNull('parent_id')->exists();
            $sectionWithParent = PageSection::with('children')->where('menu_main_id', $id)->where('parent_id', $parent_id)->where('category_slug', $category_slug)->orderby('sort_order');
            if ($itSecondChild) {
                $pageSectionParentisRoot = PageSection::with('singleChildren')->where('menu_main_id', $id)->get();
                $sectionsettings = collect();
                foreach ($pageSectionParentisRoot as $roots) {
                    foreach ($roots->singleChildren as $child) {
                        $sectionSettingsSelf = PageSectionSetting::where('menu_main_id', $id)->where('page_section_parent_id', $child->id)->get();
                        $sectionsettings = $sectionsettings->merge($sectionSettingsSelf);
                    }
                }
            } else {

                $sectionsettings = collect();
                $getAllQuery = $sectionWithParent->get();
                foreach ($getAllQuery as $section) {
                    $sectionSettingsSelf = PageSectionSetting::where('menu_main_id', $menu->id)
                        ->where('page_section_parent_id', $section->id)
                        ->whereNotNull('category_slug')
                        ->get();
                    $sectionsettings = $sectionsettings->merge($sectionSettingsSelf);
                }
            }

            $sections = $sectionWithParent->paginate($perPage)->withQueryString();
        } else {
            $sorting = request()->get('sorting');

            $sort_trigger = request()->get('sort_trigger');
            $search = request()->get('s');
            $query = PageSection::with('translations', 'children')->where('menu_main_id', $id)->whereNull('parent_id');
            $order = OrderSetting::where('menu_main_id', $id)->first();
            if (!$sorting) {
                if ($order) {
                    $sorting = $order->order;
                } else {
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

                $order = OrderSetting::updateOrCreate(
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
            $sectionsettings = collect();
            $getAllQuery = $query->get();
            foreach ($getAllQuery as $section) {
                $sectionSettingsSelf = PageSectionSetting::where('menu_main_id', $menu->id)
                    ->where('page_section_parent_id', $section->id)
                    ->whereNotNull('category_slug')
                    ->get();
                $sectionsettings = $sectionsettings->merge($sectionSettingsSelf);
            }


            $sections = $query->paginate($perPage)->withQueryString();
            //            $sections = PageSection::with('children')->where('menu_main_id', $id)->whereNull('parent_id')->orderby('sort_order')->paginate($perPage)->withQueryString();
        }
        $grouped = $sectionsettings->groupBy('category');
        //        dd($grouped);
        $globalActive = !PageSectionBlock::where('menu_main_id', $id)
            ->where('category_slug', $category_slug)
            ->exists();
        return view('admin.pages.global.section.index', compact('slug', 'id', 'menu', 'sections', 'parent_id', 'category_slug', 'categoryName', 'settings', 'order', 'grouped','globalActive'));
    }

    public function create($slug, $id, $parent_id = null, $category_slug = null)
    {


        $menu = MenuMain::whereIn('type', ['section', 'page'])->findorfail($id);
        if ($parent_id) {
            if ($category_slug) {
                $fields = PageSectionSetting::where('menu_main_id', $id)->where('category_slug', $category_slug)->orderBy('sort_order')->get();
            } else {
                $fields = PageSectionSetting::where('menu_main_id', $id)->where('page_section_parent_id', $parent_id)->whereNull('category_slug')->orderBy('sort_order')->get();
            }
        } else {

            $fields = PageSectionSetting::where('menu_main_id', $id)->whereNull('page_section_parent_id')->whereNull('category_slug')->orderBy('sort_order')->get();
            //            dd(PageSectionSetting::where('menu_main_id', $id)->get());
        }
        return view('admin.pages.global.section.settings', compact('slug', 'menu', 'fields', 'parent_id', 'category_slug', 'id'));
    }
    public function getRelationData($type, Request $request)
    {
        if ($type === 'content') {

            $data = DB::table('contents')
                ->select('category')->whereNotNull('category')
                ->groupBy('category')
                ->orderBy('category')
                ->get();

        } elseif ($type === 'menu') {

            $currentId = $request->current_id;
            $data =MenuMain::select('id','slug')->with('translations')->where('id', '!=', $currentId)
                ->where('type','page')
                ->get()->each
                ->append('title');;

        } else {
            $data = collect();
        }

        return response()->json($data);
    }
    public function storeSettings(PageSettingsRequest $request, $slug, $id, $parent_id = null, $category_slug = null)
    {

        $seenKeys = [];
        $duplicateKey = null;
        $data = $request->validated();
        foreach ($data['fields'] as $item) {
            $currentKey = $item['key'];

            if (isset($seenKeys[$currentKey])) {
                $duplicateKey = $currentKey;
                break;
            }

            $seenKeys[$currentKey] = true;
        }
        //        dd( $id, $slug, $parent_id = null, $category_slug = null,$request->validated());
        if ($duplicateKey) {
            return back()->withInput()->withErrors("Duplicate key name found: $duplicateKey");
        }
        return $this->service->storeSettings($id, $slug, $parent_id, $category_slug, $request->validated());
    }
    public function deleteSelection($id)
    {
        return $this->service->destroy($id);
    }
    public function bulkDelete(Request $request)
    {
        $request->validate([
            'ids' => 'required|array',
        ]);

        $ids = $request->ids;

        if (!$ids || count($ids) == 0) {
            return response()->json([
                'status' => false,
                'message' => 'Hech narsa tanlanmagan'
            ]);
        }

        foreach ($ids as $id) {
            $this->service->destroy($id);
        }

        return back();
    }
    public function addImage(PageSectionImageRequest $request, $id)
    {

        return $this->service->addImage($id, $request->validated());
    }
    public function updateMainButton(Request $request)
    {
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
            } elseif ($slug === 'settings') {
                $image = SettingImage::find($id);
                SettingImage::where('setting_id', $image->setting_id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $image->main = true;
                $image->save();
            } else {
                $image = LangImage::find($id);
                LangImage::where('lang_id', $image->lang_id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $image->main = true;
                $image->save();
            }

            return response()->json(['status' => true]);
        } catch (\Exception $exception) {
            Log::error($exception->getMessage());
            return response()->json($slug, 500);
        }
    }
    public function updateOrder(Request $request)
    {
        $request->validate([
            'slug' => 'required|string',
            'order' => 'required|array',
        ]);

        $modelMap = [
            'section' => PageSectionImage::class,
            'menu' => MenuMainImages::class,
            'content' => ContentImages::class,
            'setting' => SettingImage::class,
            'lang' => LangImage::class,
        ];

        if (!isset($modelMap[$request->slug])) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid slug'
            ],400);
        }

        $modelClass = $modelMap[$request->slug];

        foreach ($request->order as $item) {

            if (!isset($item['id'], $item['sort_order'])) {
                continue;
            }

            $modelClass::where('id', $item['id'])
                ->update(['sort_order' => $item['sort_order']]);
        }

        return response()->json(['success' => true]);
    }
    public function toggleGlobalBlock(Request $request, $menuId)
    {
        $status = $this->service->toggle(
            $menuId,
            $request->category_slug
        );
        return response()->json(['status' => $status]);
    }
}
