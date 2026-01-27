<?php

namespace App\Http\Controllers\Admin;

use App\Models\Lang;
use App\Models\MenuMain;
use Illuminate\Http\Request;
use App\Models\MenuMainSetting;
use App\Http\Controllers\Controller;
use App\Http\Requests\SortMenuRequest;
use App\Services\admin\MenuMainService;
use App\Http\Requests\MenuMainStoreRequest;
use App\Http\Requests\MenuMainUpdateRequest;
use App\Http\Requests\SortOrderUpdateRequest;
use App\Http\Requests\MainMenuImageUpdateRequest;
use Illuminate\Support\Facades\Cache;
class MenuMainController extends Controller
{
    public function __construct(protected MenuMainService $service)
    {
    }

    public function index()
    {

        return view('admin.pages.menus.main.index', [
            'menus' => MenuMain::with('translations')->orderby('sort_order')->get()
        ]);
    }
    public function create()
    {
        $languages = Lang::all();
        $menus = MenuMain::where('type', '!=', 'section')->get();
        $settings = MenuMainSetting::orderby('sort_order')->where('type', '!=', 'section')->get();
        $globaltype = 'menu';
        return view('admin.pages.menus.main.create', compact('languages', 'settings', 'menus', 'globaltype'));
    }
    public function edit($id)
    {
        $languages = Lang::all();
        $menus = MenuMain::where('id', '!=', $id)->where('type', '!=', 'section')->get();
        $menu = MenuMain::with('translations', 'images')->findOrFail($id);
        $globaltype = 'menu';
        $settings = MenuMainSetting::orderby('sort_order')->get();
        return view('admin.pages.menus.main.create', compact('languages', 'settings', 'menus', 'menu', 'globaltype'));
    }
    public function updateSort(SortOrderUpdateRequest $request, $id)
    {
        $menus = MenuMain::findOrFail($id);
        $menus->update($request->only('sort_order'));
        return back()->with('success', 'Updated');
    }
    public function updateStatus(Request $request, $id)
    {

        MenuMain::where('id', $id)->update(['status' => $request->status]);
Cache::flush();
        return back()->with('success', 'Updated');
    }
    public function updateSortMenu(SortMenuRequest $request)
    {
        $data = $request->validated();
        foreach ($data['order'] as $item) {
            MenuMain::where('id', $item['id'])->update([
                'sort_order' => $item['sort_order'],
            ]);
        }
        return response()->json($data);
    }
    public function imageDelete(MainMenuImageUpdateRequest $request)
    {
        return $this->service->mainMenuImageDelete($request->validated());
    }
    public function store(MenuMainStoreRequest $request)
    {
        return $this->service->mainMenuStore($request->validated());
    }
    public function update(MenuMainUpdateRequest $request, $id)
    {

        $menu = MenuMain::findorfail($id);
        //        dd($request->validated());
        return $this->service->mainMenuUpdate($request->validated(), $menu);
    }
    public function settings()
    {

        return view('admin.pages.menus.main.settings');
    }
    public function delete($id)
    {

        return $this->service->destroy($id);
    }
}
