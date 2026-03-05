<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\SettingStoreRequest;
use App\Models\ContentImages;
use App\Models\Lang;
use App\Models\MenuMain;
use App\Models\Setting;
use App\Models\SettingImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;

class SettingController extends Controller
{
    public function settings(){
        $pages = MenuMain::with('translations')->where('type','page')->get();
        $settings = Setting::with('images')->first();
        $languages = Lang::all();
        $globaltype = 'settings';
        return view('admin.pages.settings.index',compact('pages', 'settings','languages','globaltype'));
    }
    public function settingscreate(SettingStoreRequest $request){

        $data = $request->validated();
        try {
            Setting::updateOrCreate(
                ['id' => 1],
                $data
            );
            $mainImageId = isset($data['main_image_input']) ? (int) $data['main_image_input'] : false;

            if ($mainImageId) {

                SettingImage::where('setting_id', 1)
                    ->where('main', true)
                    ->update(['main' => false]);
                $settingImage = SettingImage::find($mainImageId);
                if ($settingImage) {
                    $settingImage->update(['main' => true]);
                }
            }
            Cache::flush();
            return redirect()->route('admin.index')->with('success', 'Настройки сохранены');
        }catch (\Exception $exception){
            Log::error($exception->getMessage());
            return back()->withErrors($exception->getMessage());
        }

    }
}
