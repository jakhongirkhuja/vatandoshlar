<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\MenuMainSettinsRequest;
use App\Services\admin\MenuMainService;
use Illuminate\Http\Request;
use App\Models\MenuMainSetting;
use App\Models\MenuMain;
class MenuMainSettingsController extends Controller
{
    public function __construct(protected  MenuMainService $service)
    {

    }
    public function index()
    {
        $fields = MenuMainSetting::orderBy('sort_order')->get();
        return view('admin.pages.menus.main.settings', compact('fields'));
    }


    public function create(MenuMainSettinsRequest $request)
    {
        return $this->service->create($request->validated());
    }


    public function edit(MenuMainSetting $menu_main_setting)
    {
        $menus = MenuMain::all();
        return view('menu_main_settings.edit', [
            'setting' => $menu_main_setting,
            'menus' => $menus,
        ]);
    }


//    public function update(Request $request, MenuMainSetting $menu_main_setting)
//    {
//        $data = $request->validate([
//            'menu_main_id' => 'required|exists:menu_mains,id',
//            'key' => 'required|string',
//            'label' => 'required|string',
//            'type' => 'required|string',
//            'required' => 'nullable|boolean',
//            'is_translatable' => 'nullable|boolean',
//            'options' => 'nullable|array',
//            'sort_order' => 'nullable|integer'
//        ]);
//
//
//        $data['options'] = $request->options ? json_encode($request->options) : null;
//
//
//        $menu_main_setting->update($data);
//        return redirect()->route('menu-main-settings.index')->with('success', 'Updated');
//    }


    public
    function destroy(MenuMainSetting $menu_main_setting)
    {
        $menu_main_setting->delete();
        return redirect()->route('menu-main-settings.index')->with('success', 'Deleted');
    }
}
