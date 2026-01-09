<?php

namespace App\Http\Controllers\Admin;

use App\Models\Content;
use App\Models\Support;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\admin\SupportService;
use App\Http\Requests\SupportStoreRequest;
use App\Http\Requests\ApplicationFormRequest;
use App\Http\Requests\ParticipationRequest;

class SupportController extends Controller
{

    public function index($type = null)
    {
        $query = Support::orderBy('created_at', 'desc');
        if ($type == 'form') {
            $query->where('type', $type);
        } elseif ($type == 'application') {

            $query->where('type', $type);
        } elseif ($type == 'participation') {

            $query->where('type', $type);
        }
        $supports = $query->get();
        return view('admin.pages.support.index', compact('supports'));
    }
    public function createForm(SupportStoreRequest $request)
    {
        Support::create($request->validated());

        return redirect()->back()->with('success', 'Ваша заявка принята.');
    }
    public function show($id)
    {
        $support = Support::find($id);
        if (!$support) {
            return redirect()->route('admin.supports');
        }
        return view('admin.pages.support.show', compact('support'));
    }
    public function delete($id)
    {
        $support = Support::find($id);
        if (!$support) {
            return redirect()->route('admin.supports');
        }
        $support->delete();
        return back()->with('sucess', 'Application successfully deleted');
    }
    public function createApp()
    {
        $jobs = Content::whereNull('category')->get();
        return view('front.pages.application.index', compact('jobs'));
    }
    public function create(ApplicationFormRequest $applicationFormRequest)
    {
        Support::create($applicationFormRequest->validated());
        return redirect()->back()->with('success', 'Ваша заявка принята.');
    }
    public function participation()
    {
        return view('front.pages.participation.index');
    }
    public function participate(ParticipationRequest $participation)
    {
        $data = $participation->validated();

        $support = Support::create($data);
 dd($data,$participation);
        if ($participation->hasFile('image')) {
            foreach ($participation->file('image') as $file) {
                $path = $file->store('supports', 'public');

                $support->images()->create([
                    'image' => $path,
                ]);
            }
        }

        return redirect()->back()->with('success', 'Ваша заявка принята.');
    }
}
