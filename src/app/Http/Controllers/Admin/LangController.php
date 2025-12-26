<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\LangRequest;
use App\Models\Lang;
use Illuminate\Http\Request;

class LangController extends Controller
{
    public function lang_status($id)
    {
        $lang = Lang::findOrFail($id);
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
        return view('admin.pages.langs.save');
    }

    public function store(LangRequest $request)
    {

        Lang::create($request->validated());
        return redirect()->route('langs.index')->with('success', 'Language created successfully.');
    }

    public function show(Lang $lang)
    {
        return view('admin.pages.langs.save', compact('lang'));
    }

    public function update(LangRequest $request, Lang $lang)
    {

        $lang->update($request->validated());
        return redirect()->route('langs.index')->with('success', 'Language updated successfully.');
    }

    public function destroy(Lang $lang)
    {
        $lang->delete();
        return redirect()->route('langs.inde')->with('success', 'Language deleted successfully.');
    }
}
