<?php

namespace App\Services\admin;

use App\Models\Page;
use App\Models\MenuMain;
use App\Models\ContentImages;
use App\Models\MenuMainImages;
use App\Models\MenuMainSetting;
use App\Models\PageSectionImage;
use PhpParser\Node\Stmt\TryCatch;
use App\Models\MenuMainTranslation;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class MenuMainService
{
    public function deleteImage($image, $id)
    {
        try {
            if ($image->image && Storage::disk('public')->exists($image->image)) {

                Storage::disk('public')->delete($image->image);
            }
            $image->delete();
            return true;
        } catch (\Throwable $th) {
            Log::error($th->getMessage());
            return false;
        }
    }
    public function create(array $data)
    {
        try {
            $itemIds = [];

            foreach ($data['fields'] as $item) {
                $menuSetting = MenuMainSetting::updateOrCreate(
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
                $itemIds[] = $menuSetting->id;
            }
            MenuMainSetting::whereNotIn('id', $itemIds)->delete();
            return back()->with('success', 'Updated');
        } catch (\Exception $exception) {
            return $exception->getMessage();
        }
    }

    public function mainMenuStore(array $data)
    {
        try {

            $dataToSave = [
                'type' => $data['type'] ?? 'category',
                'icon' => $data['icon'] ?? null,
                'parent_id' => $data['parent_id'] ?? null,
                'status' => isset($data['status']) && $data['status'] == 'on' ? true : false,
                'slug' => $data['slug'] ?? null,
                'url' => $data['url'] ?? null,


                'test' => isset($data['test']) && $data['test'] == 'on' ? true : false,
                'show_admin' => isset($data['show_admin']) && $data['show_admin'] == 'on' ? true : false,
            ];
            $menu = MenuMain::create($dataToSave);

            $nonTranslatableFields = [];
            foreach ($data['fields'] as $lang => $fieldsData) {
                if (is_array($fieldsData)) {
                    MenuMainTranslation::create(['menu_main_id' => $menu->id, 'locale' => $lang, 'data' => json_encode($fieldsData),]);
                } else {
                    $nonTranslatableFields[$lang] = $fieldsData;
                }
            }
            if (!empty($nonTranslatableFields)) {
                MenuMainTranslation::create([
                    'menu_main_id' => $menu->id,
                    'locale' => null,
                    'data' => json_encode($nonTranslatableFields),
                ]);
            }
            if (isset($data['images'])) {
                $mainImageName = isset($data['main_image_input']) ? $data['main_image_input'] : '';
                foreach ($data['images'] as $file) {
                    $fileOriginalName = $file->getClientOriginalName();
                    $filename = time() . '_' . $file->getClientOriginalName();
                    $path = $file->storeAs('menu_images', $filename, 'public');
                    $menuImage = new MenuMainImages();
                    $menuImage->menu_main_id = $menu->id;
                    $menuImage->image = $path;
                    $menuImage->type = $file->getClientMimeType();
                    $menuImage->size = $file->getSize();
                    $menuImage->main = ($fileOriginalName === $mainImageName);
                    $menuImage->status = true;
                    $menuImage->save();
                }
            }

            return redirect()->route('admin.menu_main.index')->with('success', 'Menu created successfully.');
        } catch (\Exception $exception) {
            return back()->withErrors(['error' => $exception->getMessage()]);
        }
    }
    public function mainMenuImageDelete($ids)
    {
        $deletedIds = [];
        $checkstatus = true;
        foreach ($ids['img'] as $id) {
            if ($ids['slug'] === 'section') {
                $image = PageSectionImage::find($id);
            } elseif ($ids['slug'] === 'menu') {
                $image = MenuMainImages::find($id);
            } else {
                $image = ContentImages::find($id);
            }

            $checkstatus = $this->deleteImage($image, $id);
            if ($checkstatus) {
                $deletedIds[] = $id;
            }
        }
        return response()->json([
            'status' => true,
            'message' => 'Deleted successfully',
            'deleted' => $deletedIds,
        ], 200);
    }
    public function mainMenuUpdate(array $data, $menu)
    {
        
        try {
            $dataToUpdate = [
                'type' => $data['type'] ?? 'category',
                'icon' => $data['icon'] ?? null,
                'parent_id' => $data['parent_id'] ?? null,
                'status' => isset($data['status']) && $data['status'] === 'on' ? true : false,
                'slug' => $data['slug'] ?? $menu->slug,
                'url' => $data['url'] ?? $menu->url,

                'test' => isset($data['test']) && $data['test'] === 'on' ? true : false,
                'show_admin' => isset($data['show_admin']) && $data['show_admin'] === 'on' ? true : false,
            ];

            $menu->update($dataToUpdate);
            $nonTranslatableFields = [];

            foreach ($data['fields'] as $lang => $fieldsData) {
                if (is_array($fieldsData)) {
                    $translation = $menu->translations()->firstOrNew(['locale' => $lang]);
                    $translation->data = json_encode($fieldsData);
                    $translation->save();
                } else {
                    $nonTranslatableFields[$lang] = $fieldsData;
                }
            }


            if (!empty($nonTranslatableFields)) {
                $metaTranslation = $menu->translations()->firstOrNew(['locale' => null]);
                $metaTranslation->data = json_encode($nonTranslatableFields);
                $metaTranslation->save();
            }
            if (isset($data['images'])) {
                $mainImageName = isset($data['main_image_input']) ? $data['main_image_input'] : '';
                foreach ($data['images'] as $file) {
                    $fileOriginalName = $file->getClientOriginalName();
                    $filename = time() . '_' . $file->getClientOriginalName();
                    $path = $file->storeAs('menu_images', $filename, 'public');
                    $menuImage = new MenuMainImages();
                    $menuImage->menu_main_id = $menu->id;
                    $menuImage->image = $path;
                    $menuImage->type = $file->getClientMimeType();
                    $menuImage->size = $file->getSize();
                    $menuImage->main = ($fileOriginalName === $mainImageName);
                    $menuImage->status = true;
                    $menuImage->save();
                }
            } else {
                $mainImageId = isset($data['main_image_input']) ? (int) $data['main_image_input'] : false;

                if ($mainImageId) {

                    MenuMainImages::where('menu_main_id', $menu->id)
                        ->where('main', true)
                        ->update(['main' => false]);
                    $menuImage = MenuMainImages::find($mainImageId);
                    if ($menuImage) {
                        $menuImage->update(['main' => true]);
                    }
                }

            }
            return redirect()->route('admin.menu_main.index')->with('success','Обновление прошло успешно!');
        } catch (\Exception $exception) {
            return back()->withErrors(['error' => $exception->getMessage()]);
        }
    }
    public function destroy($id)
    {
        $menus = MenuMain::with('translations')->find($id);
        try {
            $menus->delete();
            MenuMain::where('parent_id', $id)->update(['status' => false, 'parent_id' => null]);
            $images = MenuMainImages::where('menu_main_id', $id)->get();
            foreach ($images as $image) {
                Storage::disk('public')->delete($image->image);
                $image->delete();
            }

            return back()->with('success', 'Menu delete successfully.');
        } catch (\Throwable $th) {
            Log::error($th->getMessage());
            return back()->withErrors(['error' => $th->getMessage()]);
        }
    }
}

