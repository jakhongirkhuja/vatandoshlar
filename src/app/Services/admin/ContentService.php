<?php

namespace App\Services\admin;

use App\Models\Content;
use App\Models\ContentImages;
use App\Models\ContentSetting;
use App\Models\MenuMainImages;
use App\Models\PageSectionImage;
use App\Models\ContentTranslation;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class ContentService
{

    public function create(array $data)
    {
        try {
            $itemIds = [];

            foreach ($data['fields'] as $item) {
                $contentSetting = ContentSetting::updateOrCreate(
                    ['id' => $item['id'] ?? null],
                    [
                        'key' => $item['key'],
                        'label' => $item['label'],
                        'type' => $item['type'],
                        'required' => isset($item['required']) && $item['required'] == 'on' ? true : false,
                        'is_translatable' => isset($item['is_translatable']) && $item['is_translatable'] == 'on' ? true : false,
                        'options' => !empty($item['options']) ? json_encode(explode(',', $item['options'])) : null,
                        'sort_order' => $item['sort'] == 0 ? 1 : $item['sort'],
                        'relation' => $item['relation'] ?? null,
                    ]
                );
                $itemIds[] = $contentSetting->id;
            }
            ContentSetting::whereNotIn('id', $itemIds)->delete();
            return back()->with('success', 'Updated');
        } catch (\Exception $exception) {
            return $exception->getMessage();
        }
    }

    public function ContentStore(array $data)
    {
        try {

            $dataToSave = [
                'type' => $data['type'] ?? 'category',
                'icon' => $data['icon'] ?? null,
                'parent_id' => $data['parent_id'] ?? null,
                'category' => $data['category'],
                'status' => isset($data['status']) && $data['status'] == 'on' ? true : false,
                'slug' => $data['slug'] ?? null,
                'url' => $data['url'] ?? null,


                'test' => isset($data['test']) && $data['test'] == 'on' ? true : false,
                'show_admin' => isset($data['show_admin']) && $data['show_admin'] == 'on' ? true : false,
            ];
            $content = Content::create($dataToSave);

            $nonTranslatableFields = [];
            foreach ($data['fields'] as $lang => $fieldsData) {
                if (is_array($fieldsData)) {
                    ContentTranslation::create(['content_id' => $content->id, 'locale' => $lang, 'data' => json_encode($fieldsData),]);
                } else {
                    $nonTranslatableFields[$lang] = $fieldsData;
                }
            }
            if (!empty($nonTranslatableFields)) {
                ContentTranslation::create([
                    'content_id' => $content->id,
                    'locale' => null,
                    'data' => json_encode($nonTranslatableFields),
                ]);
            }
            if (isset($data['images'])) {
                $contentImageName = isset($data['main_image_input']) ? $data['main_image_input'] : '';
                foreach ($data['images'] as $file) {
                    $fileOriginalName = $file->getClientOriginalName();
                    $filename = time() . '_' . $file->getClientOriginalName();
                    $path = $file->storeAs('contents', $filename, 'public');
                    $conten = new ContentImages();
                    $conten->content_id = $content->id;
                    $conten->image = $path;
                    $conten->type = $file->getClientMimeType();
                    $conten->size = $file->getSize();
                    $conten->main = ($fileOriginalName === $contentImageName);
                    $conten->status = true;
                    $conten->save();
                }
            }

            return redirect()->route('admin.content.index', [
                'category' => $data['category']
            ])->with('success', 'Content created successfully.');
        } catch (\Exception $exception) {
            return back()->withErrors(['error' => $exception->getMessage()]);
        }
    }
    public function ContentUpdate($category, array $data, $content)
    {
        try {
            $dataToUpdate = [
                'type' => $data['type'] ?? 'category',
                'icon' => $data['icon'] ?? null,
                'parent_id' => $data['parent_id'] ?? null,
                'category' => (isset($data['category']) && $data['category'] === 'list') ? 'list' : null,
                'status' => isset($data['status']) && $data['status'] === 'on' ? true : false,
                'slug' => $data['slug'] ?? $content->slug,
                'url' => $data['url'] ?? $content->url,

                'test' => isset($data['test']) && $data['test'] === 'on' ? true : false,
                'show_admin' => isset($data['show_admin']) && $data['show_admin'] === 'on' ? true : false,
            ];

            $content->update($dataToUpdate);
            $nonTranslatableFields = [];

            foreach ($data['fields'] as $lang => $fieldsData) {
                if (is_array($fieldsData)) {
                    $translation = $content->translations()->firstOrNew(['locale' => $lang]);
                    $translation->data = json_encode($fieldsData);
                    $translation->save();
                } else {
                    $nonTranslatableFields[$lang] = $fieldsData;
                }
            }


            if (!empty($nonTranslatableFields)) {
                $metaTranslation = $content->translations()->firstOrNew(['locale' => null]);
                $metaTranslation->data = json_encode($nonTranslatableFields);
                $metaTranslation->save();
            }
            $mainImageId = isset($data['main_image_input']) ? (int) $data['main_image_input'] : false;

            if ($mainImageId) {

                ContentImages::where('content_id', $content->id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $contentImage = ContentImages::find($mainImageId);
                if ($contentImage) {

                    $contentImage->update(['main' => true]);
                }
            }
//            if (isset($data['images'])) {
//                $mainImageName = isset($data['main_image_input']) ? $data['main_image_input'] : '';
//                foreach ($data['images'] as $file) {
//                    $fileOriginalName = $file->getClientOriginalName();
//                    $filename = time() . '_' . $file->getClientOriginalName();
//                    $path = $file->storeAs('menu_images', $filename, 'public');
//                    $contentImage = new ContentImages();
//                    $contentImage->content_id = $content->id;
//                    $contentImage->image = $path;
//                    $contentImage->type = $file->getClientMimeType();
//                    $contentImage->size = $file->getSize();
//                    $contentImage->main = ($fileOriginalName === $mainImageName);
//                    $contentImage->status = true;
//                    $contentImage->save();
//                }
//            } else {
//                $mainImageId = isset($data['main_image_input']) ? (int) $data['main_image_input'] : false;
//
//                if ($mainImageId) {
//
//                    ContentImages::where('content_id', $content->id)
//                        ->where('main', true)
//                        ->update(['main' => false]);
//                    $contentImage = ContentImages::find($mainImageId);
//                    if ($contentImage) {
//
//                        $contentImage->update(['main' => true]);
//                    }
//                }
//
//            }
            return redirect()->route('admin.content.index', [
                'category' => $data['category']
            ])->with('success', 'Content created successfully.');
        } catch (\Exception $exception) {
            return back()->withErrors(['error' => $exception->getMessage()]);
        }
    }
    public function destroy($category, $id)
    {
        $contents = Content::with('translations')->find($id);
        try {

            Content::where('parent_id', $id)->update(['status' => false, 'parent_id' => null]);
            $images = ContentImages::where('content_id', $id)->get();
            foreach ($images as $image) {
                Storage::disk('public')->delete($image->image);
                $image->delete();
            }
            $contents->delete();
            return back()->with('success', 'Content delete successfully.');
        } catch (\Throwable $th) {
            Log::error($th->getMessage());
            return back()->withErrors(['error' => $th->getMessage()]);
        }
    }
}
