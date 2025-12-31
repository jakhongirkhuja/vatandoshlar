<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\SupportStoreRequest;
use App\Models\Support;
use App\Services\admin\SupportService;
use Illuminate\Http\Request;

class SupportController extends Controller
{

    public function index()
    {
        $supports = Support::orderBy('created_at','desc')->get();

        return view('admin.pages.support.index', compact('supports'));
    }
    public function create()
    {
        return view('admin.pages.support.save');
    }
    public function createForm(SupportStoreRequest $request)
    {
        Support::create($request->validated());
       
        return back()
            ->with('success', 'Successfully created');
    }
    public function show($id){
        $support = Support::find($id);
        return view('admin.pages.support.show',compact('support'));
    }
    public function delete($id){
        $support = Support::find($id);
        $support->delete();
        return back()->with('sucess','Application successfully deleted');
    }
}
