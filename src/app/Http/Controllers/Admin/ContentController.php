<?php

namespace App\Http\Controllers\Admin;

use App\Models\Lang;
use App\Models\Content;
use App\Models\ContentSetting;
use App\Http\Controllers\Controller;
use App\Services\admin\ContentService;
use App\Http\Requests\ContentStoreRequest;
use App\Http\Requests\ContentUpdateRequest;
use App\Http\Requests\SortOrderUpdateRequest;

class ContentController extends Controller
{
     public function __construct(protected ContentService $service) {}

    public function index($category = null)
    {
        $content = Content::with('translations')->where('category', $category)->orderBy('sort_order')->get();
        return view('admin.pages.content.index', [
            'contents' => $content
        ]);
    }
    public function create()
    {
        $languages = Lang::all();
        $contents = Content::where('type', '!=', 'section')->get();
        $settings = ContentSetting::orderby('sort_order')->where('type', '!=', 'section')->get();
        $globaltype= 'content';
        return view('admin.pages.content.create', compact('languages', 'settings', 'contents','globaltype'));
    }
    public function edit($category, $id)
    {
        $languages = Lang::all();

        $content = Content::with('translations', 'images')->where('category',$category)->find($id);
        if(!$content){
            return redirect()->route('admin.content.index',['category'=>$category])->withErrors(['message'=>'Content not found']);
        }
        $settings = ContentSetting::orderby('sort_order')->get();
        $globaltype= 'content';
        return view('admin.pages.content.create', compact('languages', 'settings',  'content','globaltype'));
    }
    public function updateSort(SortOrderUpdateRequest $request, $id)
    {
        $contents = Content::findOrFail($id);
        $contents->update($request->only('sort_order'));
        return back()->with('success', 'Updated');
    }
    public function store(ContentStoreRequest $request)
    {

        return $this->service->ContentStore($request->validated());
    }
    public function update($category,ContentUpdateRequest $request, $id)
    {

        $content = Content::findorfail($id);
        //        dd($request->validated());
        return $this->service->ContentUpdate($category,$request->validated(), $content);
    }
    public function settings()
    {

        return view('admin.pages.content.settings');
    }
    public function delete($category,$id){

        return $this->service->destroy($category,$id);
    }
}
