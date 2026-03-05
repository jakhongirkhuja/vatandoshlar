<?php

namespace App\Services\admin;

use App\Models\Content;
use App\Models\ContentImages;
use App\Models\Lang;
use App\Models\LangImage;
use App\Models\MenuMain;
use App\Models\MenuMainImages;
use App\Models\MenuMainTranslation;
use App\Models\PageSectionBlock;
use App\Models\Page;
use App\Models\PageSection;
use App\Models\PageSectionImage;
use App\Models\PageSectionSetting;
use App\Models\PageSectionTranslation;
use App\Models\Setting;

use App\Models\SettingImage;
use FFMpeg\FFProbe;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;
use FFMpeg\FFMpeg;
use FFMpeg\Coordinate\TimeCode;
use Illuminate\Support\Facades\File;
use Nette\Schema\ValidationException;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\Encoders\WebpEncoder;


class PageSectionService
{
    public function getPoster($file, $folderName)
    {
//        return null;

        $fileExtension = $file->getClientOriginalExtension();
        $arr = ['mp4', 'webm', 'ogg', 'mov', 'avi'];
        if (!in_array($fileExtension, $arr)) {
            return null;
        }
        $ffmpeg = FFMpeg::create();
        $ffprobe = FFProbe::create();
        $duration = $ffprobe
            ->format($file->getRealPath())
            ->get('duration');

        if ($duration < 3) {
            throw new \Exception("Video must be  minimum 3 seconds");
        }
        // 2. Open the video file
        $video = $ffmpeg->open($file->getRealPath());
        $frame = $video->frame(TimeCode::fromSeconds(3));
        $filename = Str::orderedUuid() . rand(1, 500) . '.jpg';
        $relativePath = $folderName . '/' . $filename;
       
        $posterPath = storage_path('app/public/' . $folderName . '/' . $filename);
        $frame->save($posterPath);
        return  $relativePath;
    }
    public function storeSection($slug, $id, $parent_id, $category_slug, array $data)
    {

//                dd($slug, $id, $parent_id, $category_slug, $data);
        try {
            $status = false;
            if(isset($data['modal_status']) && $data['modal_status'] == 'on'){
                $status = true;
                PageSection::where('menu_main_id',$id)->update(['modal_status' => false]);
            }
            $category = isset($data['category_name']) ? $data['category_name'] : null;
            $dataToSave = [
                'slug' => isset($data['slug']) ? $data['slug'] : '',
                'menu_main_id' => $id,
                'parent_id' => $parent_id ?? null,
                'publish_at' => $data['publish_at'],
                'status' => isset($data['status']) && $data['status'] == 'on' ? true : false,
                'modal_status' => $status,
                'category_slug' => $category_slug,
                'category' => $category,
                'relation_data' => isset($data['relations']) ? $data['relations'] : null,

            ];

            $pagesection = PageSection::create($dataToSave);

            $nonTranslatableFields = [];
            foreach ($data['fields'] as $lang => $fieldsData) {
                if (is_array($fieldsData)) {
                    if ($parent_id) {
                        PageSectionTranslation::create([
                            'page_section_id' => $pagesection->id,
                            'page_section_parent_id' => $parent_id,
                            'locale' => $lang,
                            'data' => json_encode($fieldsData),
                            'category_slug' => $category_slug,
                            'category' => $category,
                        ]);
                    } else {
                        PageSectionTranslation::create(['page_section_id' => $pagesection->id, 'locale' => $lang, 'data' => json_encode($fieldsData),]);
                    }
                } else {
                    $nonTranslatableFields[$lang] = $fieldsData;
                }
            }

            if (!empty($nonTranslatableFields)) {
                if ($parent_id) {
                    PageSectionTranslation::create([
                        'page_section_id' => $pagesection->id,
                        'locale' => null,
                        'page_section_parent_id' => $parent_id,
                        'data' => json_encode($nonTranslatableFields),
                        'category_slug' => $category_slug,
                        'category' => $category,
                    ]);
                } else {
                    PageSectionTranslation::create([
                        'page_section_id' => $pagesection->id,
                        'locale' => null,
                        'data' => json_encode($nonTranslatableFields),
                    ]);
                }
            }
            if (isset($data['images'])) {
                $mainImageName = isset($data['main_image_input']) ? $data['main_image_input'] : '';
                foreach (array_reverse($data['images'])  as $index=>$file) {
                    $fileOriginalName = $file->getClientOriginalName();
                    $filename = Str::orderedUuid() . rand(1, 500) . '.' . $file->getClientOriginalExtension();
                    $path = $file->storeAs('page_section_images', $filename, 'public');
                    $menuImage = new PageSectionImage();
                    $menuImage->page_section_id = $pagesection->id;
                    if ($parent_id) {
                        $menuImage->page_section_parent_id = $parent_id;
                        $menuImage->category_slug = $category_slug;
                        $menuImage->category = $category;
                    }

                    $menuImage->image = $path;
                    $menuImage->type = $file->getClientMimeType();
                    $menuImage->size = $file->getSize();
                    $menuImage->main = ($fileOriginalName === $mainImageName);
                    $menuImage->status = true;
                    $menuImage->compressed = $this->resizeImage($file,'page_section_images');
                    $menuImage->converted = $this->convertImageToWebp($file,'page_section_images');

                    $menuImage->poster = $this->getPoster($file, $slug);
                    $menuImage->sort_order = $index+1;
                    $menuImage->save();
                }
            }
            if ($slug == 'projects' && $parent_id==null) {
                $menu = MenuMain::where("status", 1)->find(64);

                if ($menu) {
                    $formSections = PageSection::with(['translations'])
                        ->where('status', 1)
                        ->where('menu_main_id', $menu->id)
                        ->get();

                    foreach ($formSections as $formSection) {
                        $newSection = $formSection->replicate();
                        $newSection->menu_main_id = $id;
                        $newSection->parent_id = $pagesection->id;
                        $newSection->category = 'Form';
                        $newSection->category_slug = 'form';
                        $newSection->save();
                        foreach ($formSection->translations as $translation) {
                            $newTranslation = $translation->replicate();
                            $newTranslation->page_section_id = $newSection->id;
                            $newTranslation->page_section_parent_id = $pagesection->id;
                            $newTranslation->category_slug = 'form';
                            $newTranslation->category = 'Form';
                            $newTranslation->save();
                        }
                    }
                }
            }
            if ($parent_id) {
                return redirect()->route('admin.pages.section.index', ['slug' => $slug, 'id' => $id, 'parent_id' => $parent_id, 'category_slug' => $category_slug])->with('success', 'Page Section created successfully.');
            }
            return redirect()->route('admin.pages.section.index', ['slug' => $slug, 'id' => $id])->with('success', 'Page Section created successfully.');
        } catch (\Exception $exception) {
            return back()->withErrors(['error' => $exception->getMessage()]);
        }
    }

    public function updateSection($slug, $id, $section_id, $parent_id, array $data)
    {
        $pagesection = PageSection::find($section_id);
        if (!$pagesection)
            abort(404);

        try {
            $status = false;
            if(isset($data['modal_status']) && $data['modal_status'] == 'on'){
                $status = true;
                PageSection::where('menu_main_id',$id)->update(['modal_status' => false]);
            }
            $dataToSave = [
                'slug' => isset($data['slug']) ? $data['slug'] : '',
                //                'menu_main_id' => $id,
                //                'parent_id' => $data['parent_id'] ?? null,
                'publish_at' => $data['publish_at'] ?? $pagesection->publish_at,
                'status' =>isset($data['status']) && $data['status'] == 'on' ? true : false,
                'modal_status' => $status,
                'relation_data' => isset($data['relations']) ? $data['relations'] : null,

            ];
            $pagesection->update($dataToSave);

            $nonTranslatableFields = [];
            foreach ($data['fields'] as $lang => $fieldsData) {
                if (is_array($fieldsData)) {
                    $translation = $pagesection->translations()->firstOrNew(['locale' => $lang]);
                    $translation->data = json_encode($fieldsData);
                    $translation->save();
                } else {
                    $nonTranslatableFields[$lang] = $fieldsData;
                }
            }

            if (!empty($nonTranslatableFields)) {
                $metaTranslation = $pagesection->translations()->firstOrNew(['locale' => null]);
                $metaTranslation->data = json_encode($nonTranslatableFields);
                $metaTranslation->save();
            }
            $mainImageName = isset($data['main_image_input']) ? $data['main_image_input'] : '';

            if ($mainImageName) {
                PageSectionImage::where('page_section_id', $section_id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $image = PageSectionImage::find((int)$mainImageName);

                if ($image) {
                    $image->update(['main' => true]);
                }
            }


            if ($pagesection->parent_id) {
                return redirect()->route('admin.pages.section.index', ['slug' => $slug, 'id' => $id, 'parent_id' => $pagesection->parent_id, 'category_slug' => $pagesection->category_slug])->with('success', 'Page Section Updated successfully.');
            }
            return redirect()->route('admin.pages.section.index', ['slug' => $slug, 'id' => $id])->with('success', 'Обновление прошло успешно.');
        } catch (\Exception $exception) {
            return back()->withErrors(['error' => $exception->getMessage()]);
        }
    }
    private function addToMenu($id, $data)
    {
        $responseImageId = [];
        $menumain = MenuMain::find($id);
        if (!$menumain) {
            return response()->json([
                'success' => false,
                'message' => 'Page section not found'
            ], 404);
        }

        if (isset($data['files'])) {
            $mainImageName = isset($data['main_image_input']) ? $data['main_image_input'] : '';

            $imageId = false;
            $slug = 'menu_main';
            if ($menumain->type == 'page') {
                $slug = str_replace("-", "_", $menumain->slug);
            }

            foreach ($data['files'] as $file) {
                $fileOriginalName = $file->getClientOriginalName();
                $filename = Str::orderedUuid() . rand(1, 500) . '.' . $file->getClientOriginalExtension();
                $path = $file->storeAs($slug, $filename, 'public');
                $menuImage = new MenuMainImages();
                $menuImage->menu_main_id = $menumain->id;
                $menuImage->image = $path;
                $menuImage->type = $file->getClientMimeType();
                $menuImage->size = $file->getSize();
                $menuImage->main = ($fileOriginalName === $mainImageName);
                $menuImage->compressed = $this->resizeImage($file,$slug);
                $menuImage->converted = $this->convertImageToWebp($file,$slug);
                $menuImage->status = true;
                $menuImage->save();
                if ($fileOriginalName === $mainImageName) {
                    $imageId = $menuImage->id;
                }
                $responseImageId[] = $menuImage->id;
            }
            if ($imageId) {
                MenuMainImages::where('menu_main_id', $menumain->id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $menuImage = MenuMainImages::find($imageId);
                if ($menuImage) {
                    $menuImage->update(['main' => true]);
                }
            }
        } else {
            $mainImageId = isset($data['main_image_input']) ? (int) $data['main_image_input'] : false;

            if ($mainImageId) {

                MenuMainImages::where('menu_main_id', $menumain->id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $menuImage = MenuMainImages::find($mainImageId);
                if ($menuImage) {
                    $menuImage->update(['main' => true]);
                }
            }
        }
        return $responseImageId;
    }
    private function addToLang($id, $data)
    {
        $responseImageId = [];
        $lang = Lang::withoutGlobalScope('active')->find($id);
        if (!$lang) {
            return response()->json([
                'success' => false,
                'message' => 'Lang not found'
            ], 404);
        }

        if (isset($data['files'])) {

            $imageId = false;
            $settingImageName = isset($data['main_image_input']) ? $data['main_image_input'] : '';
            foreach ($data['files'] as $file) {

                $fileOriginalName = $file->getClientOriginalName();
                $filename = Str::orderedUuid() . rand(1, 500) . '.' . $file->getClientOriginalExtension();
                $path = $file->storeAs('langs', $filename, 'public');
                $conten = new LangImage();
                $conten->lang_id = $lang->id;
                $conten->image = $path;
                $conten->type = $file->getClientMimeType();
                $conten->size = $file->getSize();
                $conten->main = ($fileOriginalName === $settingImageName);
                $conten->compressed = $this->resizeImage($file,'langs');
                $conten->converted = $this->convertImageToWebp($file,'langs');
                $conten->status = true;
                $conten->save();
                $responseImageId[] = $conten->id;
            }
        }
        return $responseImageId;
    }
    private function addToSection($id, $data)
    {
        $responseImageId = [];
        $pagesection = PageSection::with('menuMain')->find($id);
        $slug = 'page_section_images';
        if ($pagesection->menuMain) {
            $slug = str_replace("-", "_", $pagesection->menuMain->slug);
        }
        if (!$pagesection) {
            return response()->json([
                'success' => false,
                'message' => 'Page section not found'
            ], 404);
        }

        if (isset($data['files'])) {
            $mainImageName = isset($data['main_image_input']) ? $data['main_image_input'] : '';

            $imageId = false;

            foreach ($data['files'] as $file) {
                $fileOriginalName = $file->getClientOriginalName();
                $filename = Str::orderedUuid() . rand(1, 500) . '.' . $file->getClientOriginalExtension();

                $path = $file->storeAs($slug, $filename, 'public');
                $menuImage = new PageSectionImage();
                $menuImage->page_section_id = $pagesection->id;
                $menuImage->image = $path;

                $menuImage->type = $file->getClientMimeType();
                $menuImage->size = $file->getSize();
                $menuImage->main = ($fileOriginalName === $mainImageName);
                $menuImage->status = true;
                $menuImage->poster = $this->getPoster($file, $slug);
                $menuImage->compressed = $this->resizeImage($file,$slug);
                $menuImage->converted = $this->convertImageToWebp($file,$slug);
                $menuImage->save();
                $responseImageId[] = $menuImage->id;
                if ($fileOriginalName === $mainImageName) {
                    $imageId = $menuImage->id;
                }
            }
            if ($imageId) {
                PageSectionImage::where('page_section_id', $pagesection->id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $menuImage = PageSectionImage::find($imageId);
                if ($menuImage) {
                    $menuImage->update(['main' => true]);
                }
            }
        } else {
            $mainImageId = isset($data['main_image_input']) ? (int) $data['main_image_input'] : false;

            if ($mainImageId) {

                PageSectionImage::where('page_section_id', $pagesection->id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $menuImage = PageSectionImage::find($mainImageId);
                if ($menuImage) {
                    $menuImage->update(['main' => true]);
                }
            }
        }
        return $responseImageId;
    }
    private function addToContent($id, $data)
    {

        $responseImageId = [];
        $content = Content::find($id);
        if (!$content) {
            return response()->json([
                'success' => false,
                'message' => 'Page section not found'
            ], 404);
        }

        if (isset($data['files'])) {


            $imageId = false;
            $contentImageName = isset($data['main_image_input']) ? $data['main_image_input'] : '';
            foreach ($data['files'] as $file) {
                $fileOriginalName = $file->getClientOriginalName();
                $filename = Str::orderedUuid() . rand(1, 500) . '.' . $file->getClientOriginalExtension();
                $path = $file->storeAs('contents', $filename, 'public');
                $conten = new ContentImages();
                $conten->content_id = $content->id;
                $conten->image = $path;
                $conten->type = $file->getClientMimeType();
                $conten->size = $file->getSize();
                $conten->main = ($fileOriginalName === $contentImageName);
                $conten->compressed = $this->resizeImage($file,'contents');
                $conten->converted = $this->convertImageToWebp($file,'contents');
                $conten->status = true;
                $conten->save();

                $responseImageId[] = $conten->id;
            }
        } else {
            $mainImageId = isset($data['main_image_input']) ? (int) $data['main_image_input'] : false;

            if ($mainImageId) {

                ContentImages::where('menu_main_id', $content->id)
                    ->where('main', true)
                    ->update(['main' => false]);
                $menuImage = ContentImages::find($mainImageId);
                if ($menuImage) {
                    $menuImage->update(['main' => true]);
                }
            }
        }
        return $responseImageId;
    }
    private function addToSettings($data)
    {

        $responseImageId = [];
        $setting = Setting::first();
        if (!$setting) {
            return response()->json([
                'success' => false,
                'message' => 'Page section not found'
            ], 404);
        }

        if (isset($data['files'])) {


            $imageId = false;
            $settingImageName = isset($data['main_image_input']) ? $data['main_image_input'] : '';
            foreach ($data['files'] as $file) {

                $fileOriginalName = $file->getClientOriginalName();
                $filename = Str::orderedUuid() . rand(1, 500) . '.' . $file->getClientOriginalExtension();
                $path = $file->storeAs('settings', $filename, 'public');
                $conten = new SettingImage();
                $conten->setting_id = $setting->id;
                $conten->image = $path;
                $conten->type = $file->getClientMimeType();
                $conten->size = $file->getSize();
                $conten->main = ($fileOriginalName === $settingImageName);
                $conten->compressed = $this->resizeImage($file,'settings');
                $conten->converted = $this->convertImageToWebp($file,'settings');
                $conten->status = true;
                $conten->save();

                $responseImageId[] = $conten->id;
            }
        }
        return $responseImageId;
    }
    public function addImage($id, array $data)
    {
        $responseImageId = [];
        $slug =  $data['slug'];
        switch ($slug) {
            case 'menu':
                $responseImageId = $this->addToMenu($id, $data);
                break;
            case 'section':
                $responseImageId = $this->addToSection($id, $data);
                break;
            case 'content':
                $responseImageId =  $this->addToContent($id, $data);
                break;
            case 'settings':
                $responseImageId =  $this->addToSettings($data);
                break;
            case 'langs':
                $responseImageId =  $this->addToLang($id, $data);
                break;
        }

        return response()->json([
            'success' => true,
            'message' => 'Images added successfully',
            'data' => $responseImageId,
        ]);
    }
    public function storeSettings($id, $slug, $parent_id, $category_slug, array $data)
    {

        $menumain = MenuMain::find($id);
        if (!$menumain) {
            abort(404);
        }
        try {

            //                        dd($id, $parent_id, $category_slug, $data);
            $itemIds = [];
            $uniqueSlug = null;
            if (isset($data['category'])) {
                $uniqueSlug = $this->makeSlugUnique($data['category'], $parent_id);
            }


            $fieldIds = [];
            $exists = false;

            foreach ($data['fields'] as $item) {
                if (!empty($item['id'])) {
                    $exists = true;
                    $pagesectionSettings = PageSectionSetting::find($item['id']);
                    if ($pagesectionSettings) {
                        $uniqueSlug = $pagesectionSettings->category_slug;
                    }
                    break;
                }
            }
            //            dd($exists);
            // dd($id, $slug, $parent_id, $category_slug, $data);
            foreach ($data['fields'] as $item) {
                if (isset($item['id'])) {
                    $fieldIds[] = $item['id'];
                    $pagesectionSettings = PageSectionSetting::find($item['id']);
                    if ($pagesectionSettings) {
                       
                        $pagesectionSettings->update([
                            'key' => $item['key'],
                            'label' => $item['label'],
                            'type' => $item['type'],
                            'required' => ($item['required'] ?? '') === 'on',

                            'is_translatable' => !empty($item['relation']) ? false : (($item['is_translatable'] ?? '') === 'on'),
                            'options' => !empty($item['options']) ? json_encode(explode(',', $item['options'])) : null,
                            'sort_order' => $item['sort'] == 0 ? 1 : $item['sort'],
                            'relation' => $item['relation'] ?? null,
                            'menu_main_id' => $id,
                            'page_section_parent_id' => $parent_id,
                            'category' => $data['category'] ?? null,
                            'relation_table_name' => $item['relation_table_name'] ?? null,
                            'selection_type' => $item['selection_type'] ?? null,

                        ]);
                    }
                } else {
                    $menuSetting = PageSectionSetting::create(
                        [
                            'key' => $item['key'],
                            'label' => $item['label'],
                            'type' => $item['type'],
                            'required' => ($item['required'] ?? '') === 'on',
                            'is_translatable' => !empty($item['relation']) ? false : (($item['is_translatable'] ?? '') === 'on'),
                            'options' => !empty($item['options']) ? json_encode(explode(',', $item['options'])) : null,
                            'sort_order' => $item['sort'] == 0 ? 1 : $item['sort'],
                            'relation' => $item['relation'] ?? null,
                            'menu_main_id' => $id,
                            'page_section_parent_id' => $parent_id,
                            'category' => $data['category'] ?? null,
                            'relation_table_name' => $item['relation_table_name'] ?? null,
                            'selection_type' => $item['selection_type'] ?? null,

                        ]
                    );
                    if ($exists) {
//                        $menuSetting->update([
//                            'category_slug' => $uniqueSlug,
//                        ]);
                    } elseif ($menuSetting->wasRecentlyCreated && isset($data['category']) && $data['category']) {
                        $menuSetting->update([
                            'category_slug' => $uniqueSlug,
                        ]);
                    }
                    $fieldIds[] = $menuSetting->id;
                }
            }
            //            dd(PageSectionSetting::where('menu_main_id', $id)->where('category_slug', $category_slug)->whereNotIn('id', $fieldIds)->get());
            //            if (!empty($fieldIds)) {
            //
            //                if ($parent_id) {
            //
            //                    PageSectionSetting::where('menu_main_id', $id)->where('category_slug', $category_slug)->whereNotIn('id', $fieldIds)->delete();
            //                } else {
            //                    PageSectionSetting::where('menu_main_id', $id)->whereNull('page_section_parent_id')->whereNotIn('id', $fieldIds)->delete();
            //                }
            //            }

            if ($parent_id) {
                return redirect()->route('admin.pages.section.settings.create', ['slug' => $slug, 'id' => $id, 'parent_id' => $parent_id, 'category_slug' => $uniqueSlug])->with('success', 'Updated');
            }
            return back()->with('success', 'Updated');
        } catch (\Exception $exception) {
            return $exception->getMessage();
        }
    }

    protected function makeSlugUnique($value, $parent_id)
    {
        $slug = Str::slug($value);
        $originalSlug = $slug;
        $count = 1;

        // Check if the slug already exists in the database
        while (PageSectionSetting::where('category_slug', $slug)->where('page_section_parent_id', '!=', $parent_id)->exists()) {
            $slug = "{$originalSlug}-" . $count++;
        }

        return $slug;
    }

    public function destroy($id)
    {
        $pageSection = PageSection::with('children', 'images', 'menuMain')->find($id);
        try {
            $menuMainId   = $pageSection->menu_main_id;
            $slug         = $pageSection->menuMain->slug;
            $parentId     = $pageSection->parent_id;
            $categorySlug = $pageSection->category_slug;

            // avval childlarni o‘chirish
            $this->childSection($id);

            // translations delete
            PageSectionTranslation::where('page_section_id', $id)->delete();

            // images delete
            foreach ($pageSection->images as $image) {
                if (Storage::disk('public')->exists($image->image)) {
                    Storage::disk('public')->delete($image->image);
                }
                if ($image->poster && Storage::disk('public')->exists($image->poster)) {
                    Storage::disk('public')->delete($image->poster);
                }
                if (!empty($image->compressed) && Storage::disk('public')->exists($image->compressed)) {
                    Storage::disk('public')->delete($image->compressed);
                }
                if (!empty($image->converted) && Storage::disk('public')->exists($image->converted)) {
                    Storage::disk('public')->delete($image->converted);
                }
                $image->delete();
            }
            $this->handleSettingAfterDelete($id,$parentId,$menuMainId,$categorySlug);


            // section delete
            $pageSection->delete();

            if ($parentId) {

                $hasChildren = PageSection::where('parent_id', $parentId)
                    ->where('category_slug', $categorySlug)
                    ->exists();

                if ($hasChildren) {
                    return redirect()->route('admin.pages.section.index', [
                        'slug' => $slug,
                        'id' => $menuMainId,
                        'parent_id' => $parentId,
                        'category_slug' => $categorySlug,
                    ])->with('success', 'Deleted successfully.');
                }


                $parent = PageSection::find($parentId);

                if ($parent && $parent->parent_id) {
                    return redirect()->route('admin.pages.section.index', [
                        'slug' => $slug,
                        'id' => $menuMainId,
                        'parent_id' => $parent->parent_id,
                        'category_slug' => $parent->category_slug,
                    ])->with('success', 'Deleted successfully1');
                }

                return redirect()->route('admin.pages.section.index', [
                    'slug' => $slug,
                    'id' => $menuMainId,
                ]);
            }

            return redirect()->route('admin.pages.section.index', [
                'slug' => $slug,
                'id' => $menuMainId,
            ])->with('success', 'Deleted successfully.');
        } catch (\Throwable $th) {
            Log::error($th->getMessage());
            return back()->withErrors(['error' => $th->getMessage()]);
        }
    }
    protected function childSection($parentId)
    {
        $childSections = PageSection::with('children')->where('parent_id', $parentId)->get();
        foreach ($childSections as $child) {
            $this->childSection($child->id);
            PageSectionTranslation::where('page_section_id', $child->id)->delete();
            $childImages = PageSectionImage::where('page_section_id', $child->id)->get();
            foreach ($childImages as $image) {
                if (Storage::disk('public')->exists($image->image)) {
                    Storage::disk('public')->delete($image->image);
                }
                if (!empty($image->compressed) && Storage::disk('public')->exists($image->compressed)) {
                    Storage::disk('public')->delete($image->compressed);
                }
                $image->delete();
            }
            PageSectionSetting::where('page_section_parent_id', $child->id)->delete();
            $child->delete();
        }
    }
    public function duplicateSectionCategory($current_section_id, $target_section_id)
    {
        // Load the target section (the one whose children we want to duplicate)
        $targetSection = PageSection::findOrFail($target_section_id);

        // Duplicate each child of the target into the current section
        $children = PageSection::where('parent_id', $targetSection->id)->get();

        foreach ($children as $child) {
            $this->duplicateSectionRecursive($child, $current_section_id);
        }

        return back()->with('success', 'Duplicated section category from target to current.');
    }

    private function duplicateSectionRecursive($sourceSection, $newParentId)
    {
        // Duplicate the section
        $newSection = $sourceSection->replicate();
        $newSection->parent_id = $newParentId;
        $newSection->slug = $this->generateUniquePageSectionSlug($sourceSection->slug);
        $newSection->created_at = now();
        $newSection->updated_at = now();
        $newSection->status = false;
        $newSection->save();

        // Duplicate translations
        $translations = PageSectionTranslation::where('page_section_id', $sourceSection->id)->get();
        foreach ($translations as $translation) {
            $newTranslation = $translation->replicate();
            $newTranslation->page_section_id = $newSection->id;
            $newTranslation->page_section_parent_id = $newParentId;
            $newTranslation->save();
        }

        // Duplicate settings belonging to this section
        $settings = PageSectionSetting::where('page_section_parent_id', $sourceSection->id)->get();

        foreach ($settings as $setting) {

            $newSetting = $setting->replicate();
            $newSetting->page_section_parent_id = $newSection->id;

            $exists = PageSectionSetting::where('page_section_parent_id', $newSection->id)
                ->where('category_slug', $setting->category_slug)
                ->exists();

            if ($exists) {

                $newSetting->category_slug = $this->generateUniqueSettingCategorySlug(
                    $setting->category_slug,
                    $newSection->id
                );
            } else {

                $newSetting->category_slug = $setting->category_slug;
            }

            $newSetting->created_at = now();
            $newSetting->updated_at = now();
            $newSetting->save();
        }

        // Recursively duplicate children
        $children = PageSection::where('parent_id', $sourceSection->id)->get();
        foreach ($children as $child) {
            $this->duplicateSectionRecursive($child, $newSection->id);
        }

        return $newSection;
    }
    private function generateUniquePageSectionSlug($slug)
    {
        $original = $slug;
        $newSlug = $slug;
        $i = 1;

        while (PageSection::where('slug', $newSlug)->exists()) {
            $newSlug = $original . '-copy-' . $i;
            $i++;
        }

        return $newSlug;
    }


    private function generateUniqueSettingCategorySlug($slug, $parentId)
    {
        $original = $slug;
        $newSlug = $slug;
        $i = 1;

        while (
            PageSectionSetting::where('page_section_parent_id', $parentId)
            ->where('category_slug', $newSlug)
            ->exists()
        ) {
            $newSlug = $original . '-copy-' . $i;
            $i++;
        }

        return $newSlug;
    }
    protected function handleSettingAfterDelete(
        $id,
        $parentId,
        $menuMainId,
        $categorySlug
    ): void {

        if (!$parentId) {

            $sibling = PageSection::where('menu_main_id', $menuMainId)
                ->whereNull('parent_id')
                ->where('id', '!=', $id)
                ->first();

        } else {

            $sibling = PageSection::where('menu_main_id', $menuMainId)
                ->whereNotNull('parent_id')
                ->where('category_slug', $categorySlug)
                ->where('id', '!=', $id)
                ->first();
        }

        if ($sibling) {

            PageSectionSetting::where('page_section_parent_id', $id)
                ->update([
                    'page_section_parent_id' => $sibling->id,
                ]);

        } else {

            PageSectionSetting::where('page_section_parent_id', $id)
                ->delete();
        }
    }
    public function resizeImage($file,$folderName)
    {
        if (str_starts_with($file->getClientMimeType(), 'video/')) {
            return null;
        }

        $videoExtensions = ['mp4', 'webm', 'ogg', 'mov', 'avi', 'mkv','pdf'];
        $extension = strtolower($file->getClientOriginalExtension());

        if (in_array($extension, $videoExtensions)) {
            return null;
        }
        $manager = new ImageManager(new Driver());

        $image = $manager->read($file)
            ->scale(width: 500);
        $sourceImage = $manager->read($file);
        $filename = Str::orderedUuid() . rand(1, 500) . '.' . $file->getClientOriginalExtension();
        $path = $folderName.'/compressed/'. $filename;
        Storage::disk('public')->put($path, (string) $image->encode());

        return $path;

    }
    public function convertImageToWebp($file,$folderName)
    {
        if (str_starts_with($file->getClientMimeType(), 'video/')) {
            return null;
        }

        $videoExtensions = ['mp4', 'webm', 'ogg', 'mov', 'avi', 'mkv','pdf'];
        $extension = strtolower($file->getClientOriginalExtension());

        if (in_array($extension, $videoExtensions)) {
            return null;
        }
        $manager = new ImageManager(new Driver());
        $sourceImage = $manager->read($file);
        $webpName = Str::orderedUuid() . rand(1, 500) . '.webp';
        $webpPath = $folderName.'/webp/'. $webpName;
        Storage::disk('public')->put($webpPath, (string) $sourceImage->encode(new WebpEncoder(quality: 85)));
        return $webpPath;
    }
    public function toggle($menuId,$categorySlug = null)
    {
        $exists = PageSectionBlock::where('menu_main_id', $menuId)
            ->where('category_slug', $categorySlug)
            ->exists();

        if ($exists) {

            PageSectionBlock::where('menu_main_id', $menuId)
                ->where('category_slug', $categorySlug)
                ->delete();

            return response()->json('unblocked');

        } else {

            PageSectionBlock::create([
                'menu_main_id' => $menuId,
                'category_slug' => $categorySlug,
            ]);

            return response()->json('blocked');
        }

    }
    public function getPosterFromStorage($videoPath, $folderName)
    {
        $fullPath = storage_path('app/public/' . $videoPath);

        if (!file_exists($fullPath)) {
            return null;
        }

        $ext = strtolower(pathinfo($fullPath, PATHINFO_EXTENSION));
        $arr = ['mp4','webm','ogg','mov','avi'];

        if (!in_array($ext, $arr)) {
            return null;
        }

        $ffmpeg = \FFMpeg\FFMpeg::create();
        $ffprobe = \FFMpeg\FFProbe::create();

        $duration = $ffprobe->format($fullPath)->get('duration');

        if ($duration < 3) {
            return null;
        }

        $video = $ffmpeg->open($fullPath);

        $filename = pathinfo($videoPath, PATHINFO_FILENAME) . '.jpg';

        $relativePath = $folderName . '/' . $filename;
        $posterPath = storage_path('app/public/' . $relativePath);

        // agar poster bor bo‘lsa qaytarib yuboramiz
        if (file_exists($posterPath)) {
            return $relativePath;
        }

        $frame = $video->frame(\FFMpeg\Coordinate\TimeCode::fromSeconds(3));
        $frame->save($posterPath);

        return $relativePath;
    }
}
