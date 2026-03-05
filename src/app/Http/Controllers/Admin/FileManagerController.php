<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Str;

class FileManagerController extends Controller
{
    protected $uploadDir = 'app/public';
    protected $previewTypes = ['jpg', 'png', 'gif', 'bmp', 'pdf', 'doc', 'docx', 'xls', 'xlsx'];
    protected $forbiddenTypes = ['php', 'js', 'htm', 'cgi', 'xml', 'wml', 'pl', 'perl', 'asp', 'php3', 'php4', 'html'];
    protected $maxUploadedSize = 1024 * 1024 * 100; // 100MB

    public function handleRequest(Request $request)
    {


        $action = $request->input('action');
        $method = $request->input('json');


        // Actions
        if ($action) {
            switch ($action) {
                case 'upload':
                    return $this->uploadFile($request);
                case 'streamfile':
                    return $this->streamFile($request);
                case 'language':
                case 'PluginJs':
                    return response()->json([]);
            }
        }
        $json = json_decode($method, true);
        // JSON-RPC methods
        if ($json) {
            switch ($json['method']) {
                case 'listRoots':
                    return $this->listRoots();
                case 'listFiles':
                    return $this->listFiles($request,$json);
                case 'getFileContents':
                    return $this->getFileContents($request);
                case 'putFileContents':
                    return $this->putFileContents($request);
                case 'FileInfo':
                    return $this->fileInfo($request);
                case 'getConfig':
                    return $this->getConfig($request);
                case 'delete':
                    return $this->deleteFiles($request);
                case 'createDirectory':
                    return $this->createDirectory($request);
                case 'moveTo':
                    return $this->moveTo($request);
                case 'copyTo':
                    return $this->copyTo($request);
                default:
                    return response()->json(['error' => 'Method not supported'], 400);
            }
        }

        return response()->json(['error' => 'No action or method specified'], 400);
    }

    protected function listRoots()
    {
        $roots = ['pages', 'gallery', 'news'];
        $result = [];
        foreach ($roots as $root) {
            $result[] = [
                'name' => $root,
                'path' => '/' . $root,
                'meta' => ['standalone' => false],
                'config' => $this->sendParamsDir($root),
            ];
        }

        return response()->json(['jsonrpc' => '2.0', 'result' => $result]);
    }

    protected function listFiles(Request $request, $json)
    {
        $path = isset($json['params']['path'])? $json['params']['path']: '';
        // $path = $request->input('params.path', '/');
        $onlyFiles = isset($json['params']['only_files'])? $json['params']['only_files'] : '';
        // $onlyFiles = $request->input('params.only_files', false);
        $filter = isset($json['params']['filter'])? $json['params']['filter'] : '';
        // $filter = $request->input('params.filter', null);
        $extensions = isset($json['params']['extensions']) ? $json['params']['extensions'] : '';
        // $extensions = $request->input('params.extensions', null);
        $folderPath = $this->uploadDir . $path;
        // dd($fullPath);
        $fullPath = storage_path($folderPath);


        if (!is_dir($fullPath)) {
            return response()->json(['error' => 'Path not found'], 404);
        }

        $files = collect(Storage::files($fullPath))
            ->merge(Storage::directories($fullPath))
            ->filter(function ($file) use ($onlyFiles) {
                return $onlyFiles ? is_file(Storage::path($file)) : true;
            })
            ->map(function ($file) {
                $type = strtolower(pathinfo($file, PATHINFO_EXTENSION));
                return [
                    'name' => basename($file),
                    'size' => Storage::size($file),
                    'modified' => Storage::lastModified($file),
                    'attrs' => '-rwr-ve', // simplified
                    'info' => ['url' => Storage::url($file)],
                ];
            })
            ->values();

        return response()->json([
            'jsonrpc' => '2.0',
            'result' => [
                'columns' => ['name', 'size', 'modified', 'attrs', 'info'],
                'data' => $files,
            ]
        ]);
    }

    protected function uploadFile(Request $request)
    {
        $request->validate([
            'file' => 'required|file|max:' . ($this->maxUploadedSize / 1024),
            'path' => 'required|string',
        ]);

        $file = $request->file('file');
        $extension = strtolower($file->getClientOriginalExtension());

        if (in_array($extension, $this->forbiddenTypes)) {
            return response()->json(['error' => 'This filetype is forbidden!'], 400);
        }

        $path = $request->input('path');
        $filename = $file->getClientOriginalName();

        $file->storeAs($this->uploadDir . $path, $filename);

        return $this->listRoots();
    }

    protected function streamFile(Request $request)
    {
        $path = $request->input('path');
        $fullPath = $this->uploadDir . $path;

        if (!Storage::exists($fullPath)) {
            abort(404);
        }

        return Storage::download($fullPath);
    }

    protected function getFileContents(Request $request)
    {
        $path = $request->input('params.path');

        if (!Storage::exists($this->uploadDir . $path)) {
            return response()->json(['error' => 'File not found'], 404);
        }

        $contents = Storage::get($this->uploadDir . $path);

        return response()->json(['jsonrpc' => '2.0', 'result' => ['content' => $contents]]);
    }

    protected function putFileContents(Request $request)
    {
        $path = $request->input('params.path');
        $content = $request->input('params.content', '');

        Storage::put($this->uploadDir . $path, $content);

        return $this->listRoots();
    }

    protected function fileInfo(Request $request)
    {
        $path = $request->input('params.paths')[0];

        if (!Storage::exists($this->uploadDir . $path)) {
            return response()->json(['error' => 'File not found'], 404);
        }

        $size = Storage::size($this->uploadDir . $path);
        $modified = Storage::lastModified($this->uploadDir . $path);

        return response()->json([
            'jsonrpc' => '2.0',
            'result' => [
                'path' => $path,
                'size' => $size,
                'modified' => $modified,
                'isFile' => true,
                'meta' => ['url' => Storage::url($this->uploadDir . $path)],
            ],
        ]);
    }

    protected function getConfig(Request $request)
    {
        $dir = trim(explode('/', $request->input('params.path', '/'))[1] ?? '');
        return response()->json(['jsonrpc' => '2.0', 'result' => $this->sendParamsDir($dir)]);
    }

    protected function deleteFiles(Request $request)
    {
        $paths = $request->input('params.paths', []);

        foreach ($paths as $file) {
            $fullPath = $this->uploadDir . $file;
            if (Storage::exists($fullPath)) {
                Storage::delete($fullPath);
            }
        }

        return $this->listRoots();
    }

    protected function createDirectory(Request $request)
    {
        $path = $request->input('params.path', '/');
        Storage::makeDirectory($this->uploadDir . $path);

        return $this->listRoots();
    }

    protected function moveTo(Request $request)
    {
        $fromList = $request->input('params.from', []);
        $to = $request->input('params.to');

        foreach ((array) $fromList as $from) {
            $fromPath = $this->uploadDir . $from;
            $toPath = $this->uploadDir . $to . '/' . basename($from);

            if (Storage::exists($fromPath)) {
                Storage::move($fromPath, $toPath);
            }
        }

        return $this->listRoots();
    }

    protected function copyTo(Request $request)
    {
        $fromList = $request->input('params.from', []);
        $to = $request->input('params.to');

        foreach ((array) $fromList as $from) {
            $fromPath = $this->uploadDir . $from;
            $toPath = $this->uploadDir . $to . '/' . basename($from);

            if (Storage::exists($fromPath)) {
                Storage::copy($fromPath, $toPath);
            }
        }

        return $this->listRoots();
    }

    protected function sendParamsDir($dir)
    {
        return [
            'upload.maxsize' => $this->maxUploadedSize,
            'upload.extensions' => '*',
        ];
    }
}
