<?php

namespace App\Services\admin;

use App\Models\MenuMain;
use App\Models\MenuMainImages;
use App\Models\MenuMainTranslation;
use App\Models\Page;
use App\Models\PageSection;
use App\Models\PageSectionImage;
use App\Models\PageSectionSetting;
use App\Models\PageSectionTranslation;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;

class PageSectionService
{
    public function storeSection($slug, $id, $parent_id, $category_slug, array $data)
    {
        //        dd($slug, $id, $parent_id, $category_slug, $data);
        try {
            $category = isset($data['category_name']) ? $data['category_name'] : null;
            $dataToSave = [
                'slug' => isset($data['slug']) ? $data['slug'] : '',
                'menu_main_id' => $id,
                'parent_id' => $parent_id ?? null,
                'status' => isset($data['status']) && $data['status'] == 'on' ? true : false,
                'category_slug' => $category_slug,
                'category' => $category,
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
                foreach ($data['images'] as $file) {
                    $fileOriginalName = $file->getClientOriginalName();
                    $filename = time() . '_' . $file->getClientOriginalName();
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
                    $menuImage->save();
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
            $dataToSave = [
                'slug' => isset($data['slug']) ? $data['slug'] : '',
                //                'menu_main_id' => $id,
                //                'parent_id' => $data['parent_id'] ?? null,
                'status' => isset($data['status']) && $data['status'] == 'on' ? true : false,
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
            return redirect()->route('admin.pages.section.index', [
                'slug' => $slug,
                'id' => $id,
                'parent_id' => $parent_id
            ])->with('success', 'Обновление прошло успешно!');

        } catch (\Exception $exception) {
            return back()->withErrors(['error' => $exception->getMessage()]);
        }
    }
    public function addImage($id, array $data)
    {
        $pagesection = PageSection::find($id);
        if (!$pagesection) {
            return response()->json([
                'success' => false,
                'message' => 'Page section not found'
            ], 404);
        }
        if (isset($data['images'])) {
            $mainImageName = isset($data['main_image_input']) ? $data['main_image_input'] : '';

            $imageId = false;

            foreach ($data['files'] as $file) {
                // dd($file);
                $fileOriginalName = $file->getClientOriginalName();

                $filename = time() . '_' . $file->getClientOriginalName();
                $path = $file->storeAs('page_section_images', $filename, 'public');
                $menuImage = new PageSectionImage();
                $menuImage->page_section_id = $pagesection->id;
                $menuImage->image = $path;
                $menuImage->type = $file->getClientMimeType();
                $menuImage->size = $file->getSize();
                $menuImage->main = ($fileOriginalName === $mainImageName);
                $menuImage->status = true;
                $menuImage->save();
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
        return response()->json([
            'success' => true,
            'message' => 'Images added successfully',
            'data' => $menuImage ?? null,
        ]);
    }
    public function storeSettings($id, $slug, $parent_id, $category_slug, array $data)
    {

        $menumain = MenuMain::find($id);
        if (!$menumain) {
            abort(404);
        }
        try {

            //            dd($id, $parent_id, $category_slug);
            $itemIds = [];
            $uniqueSlug = null;
            if (isset($data['category'])) {
                $uniqueSlug = $this->makeSlugUnique($data['category'], $parent_id);
            }
            // dd($id, $slug, $parent_id, $category_slug, $data);
            foreach ($data['fields'] as $item) {
                if (isset($item['id'])) {
                    $pagesectionSettings = PageSectionSetting::find($item['id']);
                    if ($pagesectionSettings) {
                        $pagesectionSettings->update([
                            'key' => $item['key'],
                            'label' => $item['label'],
                            'type' => $item['type'],
                            'required' => ($item['required'] ?? '') === 'on',
                            'is_translatable' => ($item['is_translatable'] ?? '') === 'on',
                            'options' => !empty($item['options']) ? json_encode(explode(',', $item['options'])) : null,
                            'sort_order' => $item['sort'] == 0 ? 1 : $item['sort'],
                            'relation' => $item['relation'] ?? null,
                            'menu_main_id' => $id,
                            'page_section_parent_id' => $parent_id,
                            'category' => $data['category'] ?? null,

                        ]);
                    }
                } else {
                    $menuSetting = PageSectionSetting::create(
                        [
                            'key' => $item['key'],
                            'label' => $item['label'],
                            'type' => $item['type'],
                            'required' => ($item['required'] ?? '') === 'on',
                            'is_translatable' => ($item['is_translatable'] ?? '') === 'on',
                            'options' => !empty($item['options']) ? json_encode(explode(',', $item['options'])) : null,
                            'sort_order' => $item['sort'] == 0 ? 1 : $item['sort'],
                            'relation' => $item['relation'] ?? null,
                            'menu_main_id' => $id,
                            'page_section_parent_id' => $parent_id,
                            'category' => $data['category'] ?? null,

                        ]
                    );
                    if ($menuSetting->wasRecentlyCreated && isset($data['category']) && $data['category']) {
                        $menuSetting->update([
                            'category_slug' => $uniqueSlug,
                        ]);
                    }
                }

                // $where = [
                //     'menu_main_id' => $id,
                // ];
                // if (!empty($item['id'])) {
                //     $where['id'] = $item['id'];
                // }

                // if (!empty($parent_id)) {
                //     $where['page_section_parent_id'] = $parent_id;
                // }
                // $menuSetting = PageSectionSetting::updateOrCreate(
                //     $where,
                //     [
                //         'key' => $item['key'],
                //         'label' => $item['label'],
                //         'type' => $item['type'],
                //         'required' => ($item['required'] ?? '') === 'on',
                //         'is_translatable' => ($item['is_translatable'] ?? '') === 'on',
                //         'options' => !empty($item['options']) ? json_encode(explode(',', $item['options'])) : null,
                //         'sort_order' => $item['sort'] == 0 ? 1 : $item['sort'],
                //         'relation' => $item['relation'] ?? null,
                //         'menu_main_id' => $id,
                //         'page_section_parent_id' => $parent_id,
                //         'category' => $data['category'] ?? null,

                //     ]
                // );



                // if ($parent_id) {
                //     if ($category_slug) {

                //         //                        return redirect()->route('admin.pages.section.settings.create',['slug'=>$slug,'id'=>$menuSetting->id,'parent_id'=>$parent_id, 'category_slug'=>$category_slug])->with('success', 'Page Section Settings updated successfully.');

                //     }
                //     //                    return redirect()->route('admin.pages.section.settings.create',['slug'=>$slug,'id'=>$menuSetting->id,'parent_id'=>$parent_id])->with('success', 'Page Section Settings updated successfully.');

                // }
                // $itemIds[] = $menuSetting->id;
            }
            if ($parent_id && $category_slug) {

                //                PageSectionSetting::where('menu_main_id', $id)->where('page_section_parent_id', $parent_id)->where('category_slug',$category_slug)->whereNotIn('id', $itemIds)->delete();
            } else {
                //                PageSectionSetting::where('menu_main_id', $id)->whereNull('page_section_parent_id')->whereNotIn('id', $itemIds)->delete();
            }
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
        $pageSection = PageSection::with('children', 'images')->find($id);
        try {
            $pageSection->delete();
            PageSectionTranslation::where('page_section_id', $id)->delete();
            $images = $pageSection->images;
            foreach ($images as $image) {
                if (Storage::disk('public')->exists($image->image)) {
                    Storage::disk('public')->delete($image->image);
                }
                $image->delete();
                $this->childSection($id);
            }

            return back()->with('success', 'Menu delete successfully.');
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
            PageSectionSetting::where('page_section_parent_id', $child->id)->delete();
            $childImages = PageSectionImage::where('page_section_id', $child->id)->get();
            foreach ($childImages as $image) {
                if (Storage::disk('public')->exists($image->image)) {
                    Storage::disk('public')->delete($image->image);
                }
                $image->delete();
            }
            $child->delete();
        }
    }
}
