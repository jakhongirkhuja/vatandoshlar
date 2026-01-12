<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\SettingStoreRequest;
use App\Models\Lang;
use App\Models\MenuMain;
use App\Models\Setting;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    public function settings(){
        $pages = MenuMain::with('translations')->where('type','page')->get();
        $settings = Setting::first();
        $languages = Lang::all();
        return view('admin.pages.settings.index',compact('pages', 'settings','languages'));
    }
    public function settingscreate(SettingStoreRequest $request){

        Setting::updateOrCreate(
            ['id' => 1],
            $request->validated()
        );
        return back()->with('success', 'Настройки сохранены');
    }
}
