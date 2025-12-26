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

    public function index()
    {

        return view('admin.pages.content.index', [
            'contents' => Content::with('translations')->orderby('sort_order')->get()
        ]);
    }
    public function create()
    {
        $languages = Lang::all();
        $contents = Content::where('type', '!=', 'section')->get();
        $settings = ContentSetting::orderby('sort_order')->where('type', '!=', 'section')->get();

        return view('admin.pages.content.create', compact('languages', 'settings', 'contents'));
    }
    public function edit($id)
    {
        $languages = Lang::all();
        $contents = Content::where('id', '!=', $id)->where('type', '!=', 'section')->get();
        $content = Content::with('translations', 'images')->findOrFail($id);

        $settings = ContentSetting::orderby('sort_order')->get();
        return view('admin.pages.content.create', compact('languages', 'settings', 'contents', 'content'));
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
    public function update(ContentUpdateRequest $request, $id)
    {

        $content = Content::findorfail($id);
        //        dd($request->validated());
        return $this->service->ContentUpdate($request->validated(), $content);
    }
    public function settings()
    {

        return view('admin.pages.content.settings');
    }
    public function delete($id){

        return $this->service->destroy($id);
    }
}
