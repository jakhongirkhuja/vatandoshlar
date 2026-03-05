<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Http\Requests\ApplicationFormRequest;
use App\Http\Requests\ParticipationRequest;
use App\Http\Requests\ReportTextErrorRequest;
use App\Http\Requests\SupportStoreRequest;
use App\Models\Content;
use App\Models\FormImage;
use App\Models\Setting;
use App\Models\Support;
use App\Services\admin\TelegramService;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use App\Exports\UsersExport;
//use Maatwebsite\Excel\Facades\Excel;
class SupportController extends Controller
{
    public function supportexport()
    {
        $type = request()->type;
        if(!$type) return;
        $query = Support::orderBy('created_at', 'asc');
        $query->where('type', $type);
        $supports = $query->get();
        $filename = $type.'_export.csv';
        $headers = [
            "Content-Type" => "text/csv; charset=UTF-8",
            "Content-Disposition" => "attachment; filename={$filename}",
        ];
        $callback = function () use ($supports) {
            $file = fopen('php://output', 'w');
            fwrite($file, "\xEF\xBB\xBF"); // Russian Excel fix
            $allKeys = [];
            foreach ($supports as $support) {
                $json = is_array($support->data)
                    ? $support->data
                    : json_decode($support->data, true);

                if (is_array($json)) {
                    $allKeys = array_unique(array_merge($allKeys, array_keys($json)));
                }
            }
            $header = array_merge(['created_at'], $allKeys);
            fputcsv($file, $header, ';');
            foreach ($supports as $support) {
                $json = is_array($support->data)
                    ? $support->data
                    : json_decode($support->data, true);
                $row = [
                    $support->created_at,
                ];
                foreach ($allKeys as $key) {
                    $value = $json[$key] ?? '';
                    $value = str_replace(["\r", "\n"], ' ', $value);
                    $value = preg_replace('/\s+/', ' ', $value);
                    $value = trim($value);

                    $row[] = $value;
                }
                fputcsv($file, $row, ';');
            }
            fclose($file);
        };
        return response()->stream($callback, 200, $headers);
    }
    public function index($type = null)
    {
        $query = Support::orderBy('created_at', 'desc');
        if ($type == 'form') {
            $query->where('type', $type);
        } elseif ($type == 'application') {

            $query->where('type', $type);
        } elseif ($type == 'participation') {

            $query->where('type', $type);
        } elseif($type == 'textError') {
            $query->where('type', $type);
        }
        $supports = $query->paginate(10);
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
        try {

            Support::create($applicationFormRequest->validated());
            return redirect()->back()->with('success', 'Ваша заявка принята.');
        } catch (\Exception $e) {
            Log::error('Error:' . $e->getMessage());
            return redirect()->back()->with('error', 'Ваша заявка не принята.');
        }
    }

    public function show($id)
    {
        $support = Support::find($id);

        if (!$support) {
            return redirect()->route('admin.supports');
        }

        try {
            $support->update(['user_id' => auth()->id()]);
        } catch (\Exception $exception) {
            Log::error('Error:' . $exception->getMessage());
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
    public function reportTextError(ReportTextErrorRequest $request)
    {

        $data = $request->validated();

        $data['type'] = 'textError';
        $support = Support::create($data);
        $settings = Setting::first();
        if ($settings) {
            $chat_id = $settings->chat_id;
            if ($support->chat_id) {
                $chat_id = $support->chat_id;
            }
            try {
//                TelegramService::sendMessage(
//                    $chat_id,
//                    $settings->bot_token,
//                    TelegramService::formatSupportMessage($support)
//                );
            } catch (\Exception $e) {
                Log::error('Error Text Fetch:' . $e->getMessage());
                return redirect()->back()->withError('error', 'Text not got');
            }
        }
        return response()->json(['success' => true],200);
    }
    public function participate(ParticipationRequest $participation)
    {
        $data = $participation->validated();

        return DB::transaction(function () use ($data, $participation) {
            try {
                $uploadImages = null;
                $support = Support::create($data);
                if ($participation->hasFile('image')) {

                    foreach ($participation->file('image') as $file) {
                        $path = $file->storeAs('supports', Str::uuid() . '.' . $file->getClientOriginalExtension(), 'public');
                        $newImage = FormImage::create([
                            'type' => $support->type,
                            'support_id' => $support->id,
                            'image' => $path,
                            'name' => $file->getClientOriginalName(),
                            'size' => $file->getSize(),
                        ]);
                        $uploadImages[] = $newImage;
                    }
                }
                $settings = Setting::first();
                if ($settings) {
                    $chat_id = $settings->chat_id;
                    if ($support->chat_id) {
                        $chat_id = $support->chat_id;
                    }

                    TelegramService::sendMessage(
                        $chat_id,
                        $settings->bot_token,
                        TelegramService::formatSupportMessage($support, $uploadImages)
                    );
                }

                return redirect()->back()->with('success', 'Ваша заявка принята.');
            } catch (\Exception $e) {
                Log::error('Error:' . $e->getMessage());
                return redirect()->back()->withError('error', 'Ваша заявка  не принята.');
            }
        });

    }
}
