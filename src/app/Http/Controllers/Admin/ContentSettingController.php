<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\ContentSettingRequest;
use App\Models\Content;
use App\Models\ContentSetting;
use App\Services\admin\ContentService;
use Illuminate\Http\Request;

class ContentSettingController extends Controller
{
       public function __construct(protected  ContentService $service)
    {

    }
    public function index()
    {
        $fields = ContentSetting::orderBy('sort_order')->get();
        return view('admin.pages.content.settings', compact('fields'));
    }


    public function create(ContentSettingRequest $request)
    {
        return $this->service->create($request->validated());
    }


    public function edit(ContentSetting $menu_main_setting)
    {
        $menus = Content::all();
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
    function destroy(ContentSetting $menu_main_setting)
    {
        $menu_main_setting->delete();
        return redirect()->route('menu-main-settings.index')->with('success', 'Deleted');
    }
}
