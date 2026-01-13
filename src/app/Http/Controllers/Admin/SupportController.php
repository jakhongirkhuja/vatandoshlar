<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\ApplicationFormRequest;
use App\Http\Requests\ParticipationRequest;
use App\Http\Requests\SupportStoreRequest;
use App\Models\Content;
use App\Models\FormImage;
use App\Models\Setting;
use App\Models\Support;
use App\Services\admin\SupportService;
use App\Services\admin\TelegramService;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

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
        try {
            Support::create($request->validated());
            return redirect()->back()->with('success', 'Ваша заявка принята.');
        } catch (\Exception $e) {
            Log::error('Error:' . $e->getMessage());
            return redirect()->back()->with('error', 'Ваша заявка не принята.');
        }

    }

    public function create(ApplicationFormRequest $applicationFormRequest)
    {
        Support::create($applicationFormRequest->validated());
        return redirect()->back()->with('success', 'Ваша заявка принята');
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

    public function participation()
    {
        return view('front.pages.participation.index');
    }

    public function participate(ParticipationRequest $participation)
    {
        $data = $participation->validated();

        return DB::transaction(function () use ($data, $participation) {
            try {
                $support = Support::create($data);
                if ($participation->hasFile('image')) {

                    foreach ($participation->file('image') as $file) {
                        $path = $file->storeAs('supports', Str::uuid() . '.' . $file->getClientOriginalExtension(), 'public');
                        FormImage::create([
                            'type' => $support->type,
                            'support_id' => $support->id,
                            'image' => $path,
                            'name' => $file->getClientOriginalName(),
                            'size' => $file->getSize(),
                        ]);
                    }
                }
                return redirect()->back()->with('success', 'Ваша заявка принята.');
            } catch (\Exception $e) {
                Log::error('Error:' . $e->getMessage());
                return redirect()->back()->with('Error', 'Ваша заявка  не принята.');
            }
        });

    }
}
