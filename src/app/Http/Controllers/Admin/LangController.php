<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\LangRequest;
use App\Models\ContentImages;
use App\Models\Lang;
use App\Models\LangImage;
use App\Models\SettingImage;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class LangController extends Controller
{
    public function lang_status($id)
    {
        $lang = Lang::withoutGlobalScope('active')->find($id);

        $lang->status = $lang->status == 0 ? 1 : 0;
        $lang->save();
        return response()->json([
            'status' => $lang->status,
            'message' => 'Language status updated successfully'
        ]);
    }
    public function index()
    {
        $langs = Lang::withoutGlobalScope('active')->get();
        return view('admin.pages.langs.index', compact('langs'));
    }

    public function create()
    {
        $globaltype = 'langs';
        return view('admin.pages.langs.save',compact('globaltype'));
    }

    public function store(LangRequest $request)
    {
        $data = $request->validated();

        $lang =Lang::create($data);

        $langImageName = isset($data['main_image_input']) ? $data['main_image_input'] : '';

        if (isset($data['images'])) {

            foreach ($data['images'] as $file) {
                $fileOriginalName = $file->getClientOriginalName();
                $filename = Str::orderedUuid() . rand(1, 500) . '.' . $file->getClientOriginalExtension();
                $path = $file->storeAs('langs', $filename, 'public');
                $langt = new LangImage();
                $langt->lang_id = $lang->id;
                $langt->image = $path;
                $langt->type = $file->getClientMimeType();
                $langt->size = $file->getSize();
                $langt->main = ($fileOriginalName === $langImageName);
                $langt->status = true;
                $langt->save();
            }
        }

        return redirect()->route('langs.index')->with('success', 'Language created successfully.');
    }

    public function show($lang)
    {

        $lang = Lang::withoutGlobalScope('active')->find($lang);
        if($lang){
            $globaltype = 'langs';
            return view('admin.pages.langs.save', compact('lang','globaltype'));
        }
        return back();
    }

    public function update(LangRequest $request, $lang)
    {
        $lang = Lang::withoutGlobalScope('active')->find($lang);
        $data = $request->validated();
        if($lang){
            $lang->update($data);
            $langImageName = isset($data['main_image_input']) ? $data['main_image_input'] : false;
            if ($langImageName) {

                LangImage::where('lang_id', $lang->id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $settingImage = LangImage::find($langImageName);
                if ($settingImage) {
                    $settingImage->update(['main' => true]);
                }
            }
            return redirect()->route('langs.index')->with('success', 'Language updated successfully.');
        }else{
            return back()->withErrors(['error' => 'Language not found.']);
        }

    }

    public function destroy($lang)
    {
        $lang  = Lang::withoutGlobalScope('active')->find($lang);
        if($lang){
            $lang->delete();
            return redirect()->route('langs.inde')->with('success', 'Language deleted successfully.');
        }
        return back()->withErrors(['error' => 'Language not found.']);
    }
}
