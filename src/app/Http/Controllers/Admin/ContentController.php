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
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use App\Models\ContentTranslation;
class ContentController extends Controller
{
     public function __construct(protected ContentService $service) {}

    public function index($category = null)
    {

        $query = Content::with('translations')->where('category', $category);
        $search = request()->get('s');

        $query->whereHas('translations', function ($query) use ($search) {
            $query->where(function ($q) use ($search) {
                $q->whereRaw("data->>'title' ILIKE ?", ["%{$search}%"])
                    ->orWhereRaw("data->>'key' ILIKE ?", ["%{$search}%"]);
            });
        });
        $content = $query->latest()->get();
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
    public function updateStatus(Request $request, $id)
    {
       Content::where('id', $id)->update(['status'=> $request->status]);
        return back()->with('success', 'Updated');
        Cache:flush();
    }
    public function store(ContentStoreRequest $request, $category)
    {

        $data = $request->validated();
        if($category=='list'){
            if(!isset($data['fields']['key'])){
                return back()->withInput()->withErrors(['message'=>'Content key not exists']);
            }
            $contentTransation = ContentTranslation::whereRaw("data->>'key' = ?", [$data['fields']['key']])->exists();
            if($contentTransation){
                return back()->withInput()->withErrors(['message'=>'Content key already exists']);
            }
        }


        return $this->service->ContentStore($request->validated());
    }
    public function update(ContentUpdateRequest $request, $category, $id)
    {
        $data = $request->validated();
        if($category=='list'){
            if(!isset($data['fields']['key'])){
                return back()->withInput()->withErrors(['message'=>'Content key not exists']);
            }
            $contentTransation = ContentTranslation::whereRaw("data->>'key' = ?", [$data['fields']['key']])->where('content_id','!=',$id)->exists();
            if($contentTransation){
                return back()->withInput()->withErrors(['message'=>'Content key already exists']);
            }
        }
        $content = Content::findorfail($id);

        Cache::flush();
        return $this->service->ContentUpdate($category,$data, $content);
    }
    public function settings()
    {

        return view('admin.pages.content.settings');
    }
    public function delete($category,$id){

        return $this->service->destroy($category,$id);
    }
}
