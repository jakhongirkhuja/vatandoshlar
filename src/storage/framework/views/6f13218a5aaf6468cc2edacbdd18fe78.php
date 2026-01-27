<?php $__env->startSection('body'); ?>

<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper ">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 ">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Добавить / Изменить</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<?php echo e(route('admin.index')); ?>">Главная</a></li>
                                <li class="breadcrumb-item"><a href="<?php echo e(route('admin.pages.section.index',['slug'=>$slug,'id'=>$id])); ?>">Раздел</a>
                                </li>
                                <li class="breadcrumb-item"><a href="#" onclick="history.go(-1)">Назад</a></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content-body">
            <?php echo $__env->make('admin.components.error', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

            <?php $isEdit = isset($section); ?>
            <input type="hidden" id="deleteRoute" value="<?php echo e(request()->root()); ?>">
            <section class="langs-edit">
                <?php
                $params1 = $isEdit ? ['slug'=>$slug, 'id'=>$id,'section_id'=>$section->id] : null;
                $params2 = ['slug'=>$slug, 'id'=>$id];
                if ($parent_id && $category_slug) {
                $params1['parent_id'] = $parent_id;
                $params2['parent_id'] = $parent_id;
                $params1['category_slug'] = $category_slug;
                $params2['category_slug'] = $category_slug;
                }

                ?>
                <form
                    action="<?php echo e($isEdit ? route('admin.pages.section.update', $params1) : route('admin.pages.section.store',$params2)); ?>"
                    method="POST" enctype="multipart/form-data">
                    <?php echo csrf_field(); ?>
                    <?php if($isEdit): ?>
                    <?php echo method_field('PUT'); ?>
                    <?php endif; ?>

                    <?php if($parent_id && count($settings)>0): ?>
                    <input type="hidden" name="category_name" value="<?php echo e($settings[0]->category); ?>">
                    <?php endif; ?>
                    <div class="row">
                        <div class="col-12 mt-1">
                            <ul class="nav nav-tabs " role="tablist">
                                <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li class="nav-item fx align-items-center">
                                    <a class="nav-link <?php echo e($k == 0 ? 'active' : ''); ?>" data-toggle="tab"
                                        href="#lang<?php echo e($language->code); ?>">
                                        <img src="<?php echo e(sectionImages($language, true)); ?>"
                                            class="size_small" alt="flag">
                                        <?php echo e($language->name); ?>

                                    </a>
                                </li>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </ul>

                            <div class="tab-content">
                                <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="tab-pane <?php echo e($k == 0 ? 'active' : ''); ?>"
                                    id="lang<?php echo e($language->code); ?>">
                                    <?php $__currentLoopData = $settings; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $setting): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php if($setting->is_translatable): ?>
                                    <?php
                                    $translation = $isEdit ? $section->translations->firstWhere('locale', $language->code) : null;
                                    $data = $translation ? json_decode($translation->data, true) : [];
                                    $value = old('fields.' . $language->code . '.' . $setting->key, $data[$setting->key] ?? '');
                                    ?>
                                    <div class="form-group">

                                        <label><?php echo e($setting->label); ?> (<?php echo e($language->code); ?>)</label>
                                         <?php if($setting->type=='textarea' || $setting->type=='textarea-editor'): ?>
                                        <textarea class="form-control <?php echo e($setting->type=='textarea-editor'? 'summernote' : ''); ?>"
                                        name="fields[<?php echo e($language->code); ?>][<?php echo e($setting->key); ?>]"><?php echo e($value); ?></textarea>
                                          <?php elseif($setting->type == 'datetime-local'): ?>
                                              <input type="datetime-local"
           class="form-control"
           name="fields[<?php echo e($language->code); ?>][<?php echo e($setting->key); ?>]"  value="2025-06-01T13:30">
                                        <?php else: ?>
                                        <?php $type = $setting->type=='text'? 'text' : 'number' ?>
                                        <input
                                            type="<?php echo e($type); ?>"
                                            class="form-control <?php echo e($setting->key=='title'? 'title' : ''); ?>"
                                            name="fields[<?php echo e($language->code); ?>][<?php echo e($setting->key); ?>]"
                                            value="<?php echo e($value); ?>">
                                        <?php endif; ?>
                                    </div>
                                    <?php endif; ?>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </div>
                        <div class="col-12">
                            <hr>
                            <?php
                            $nonTranslatableTranslations = $isEdit ? $section->translations->where('locale', null) : collect();
                            $nonTranslatableData = [];
                            foreach($nonTranslatableTranslations as $trans) {
                            if(!empty($trans->data)) {
                            $decoded = json_decode($trans->data, true) ?? [];
                            $nonTranslatableData = array_merge($nonTranslatableData, $decoded);
                            }
                            }
                            ?>

                            <?php $__currentLoopData = $settings; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $setting): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php if(!$setting->is_translatable): ?>
                            <?php
                            $value2 = old('fields.' . $setting->key, $isEdit ? ($nonTranslatableData[$setting->key] ?? '') : '');

                            ?>
                            <div class="form-group">
                                <label><?php echo e($setting->label); ?></label>
                                 <?php if($setting->type=='textarea' || $setting->type=='textarea-editor'): ?>
                                <textarea class="form-control <?php echo e($setting->type=='textarea-editor'? 'summernote' : ''); ?>"
                                    name="fields[<?php echo e($setting->key); ?>]"><?php echo e($value2); ?></textarea>
                                     <?php elseif($setting->type == 'datetime-local'): ?>
                                              <input type="datetime-local"
           class="form-control"
           name="fields[<?php echo e($setting->key); ?>]"  value="2025-06-01T13:30" >
                                   <?php else: ?>
                                <?php $type = $setting->type=='text'? 'text' : 'number' ?>
                                <input
                                    type="<?php echo e($type); ?>"
                                    class="form-control <?php echo e($setting->key=='title'? 'title' : ''); ?>"
                                    name="fields[<?php echo e($setting->key); ?>]"
                                    value="<?php echo e($value2); ?>">
                                <?php endif; ?>

                            </div>
                            <?php endif; ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>


                        </div>

                        <!-- Submit button -->


                    </div>

                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                
                                
                                
                                
                                

                                
                                
                                
                                
                                

                                

                                
                                
                                






                                <div class="col-12 mb-1">

                                    <a href="#myModal" role="button" class="btn btn-info waves-effect waves-light" data-toggle="modal"><i class="feather icon-image"></i> Rasm</a>
                                </div>

                                <?php
                                    date_default_timezone_set('Asia/Tashkent');
                                ?>


                                <div class="col-12 mb-1 <?php echo e(!in_array($id, $settingValues)? 'd-none' : ''); ?>">
                                    <label for="">Дата</label>
                                    <input
                                        type="datetime-local"
                                        class="form-control "
                                        name="publish_at"
                                        placeholder="Yaratilgan vaqti"
                                        value="<?php echo e(old('publish_at', $section->publish_at ?? date('Y-m-d H:i:s'))); ?>">
                                </div>
                                <div class="col-12 mb-1">
                                    <label for="">Alias</label>
                                    <input
                                        type="text"
                                        class="form-control slug"
                                        name="slug"
                                        placeholder="slug"
                                        value="<?php echo e(old('slug', $section->slug ?? '')); ?>">
                                </div>

                                <div class="col-12">
                                    <div class="form-check">
                                        <div class="custom-control custom-switch custom-switch-success mr-2 mb-1">
                                            <p class="mb-0">Статус</p>
                                            <input type="checkbox" class="custom-control-input"
                                                name="status"
                                                <?php echo e(old('status', $section->status ?? true) ? 'checked' : ''); ?>

                                                id="customSwitchStatus">
                                            <label class="custom-control-label"
                                                for="customSwitchStatus"></label>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-6 d-flex justify-content-start align-items-center gap-2">


                            <button type="button"
                                    class="btn btn-secondary px-4"
                                    onclick="history.back()">
                                Назад
                            </button>

                        </div>
                        <div class="col-6 d-flex justify-content-end align-items-center gap-2">

                            <button type="submit"
                                    class="btn btn-primary px-4 mr-1">
                                Сохранить
                            </button>



                        </div>
                    </div>

                    <input type="file" style="display: none" multiple name="images[]">
                    <input type="hidden" multiple name="main_image">
                    <?php $menu = $isEdit ? $section : null ?>
                    <input type="hidden" id="delete-route" value="<?php echo e(route('admin.menu_main.imageDelete')); ?>">
                    <input type="hidden" id="slug" value="section">
                    <?php echo $__env->make('admin.components.modal', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                </form>
            </section>
        </div>
    </div>
</div>


<script>
    document.addEventListener('DOMContentLoaded', () => {
        const titleInput = document.querySelector('input.title');
        const slugInput = document.querySelector('input.slug');

        if (!titleInput || !slugInput) return;

        titleInput.addEventListener('input', e => {
            let slug = e.target.value
                .toLowerCase()
                .trim()
                .replace(/[\s\W-]+/g, '-') // spaces & non-words → -
                .replace(/^-+|-+$/g, ''); // trim - from start/end

            slugInput.value = slug;
        });
    });
    document.addEventListener('input', function(e) {
        if (e.target.classList.contains('slug')) {
            e.target.value = e.target.value
                .replace(/\s+/g, '-')
                .replace(/[^a-zA-Z0-9_?#]/g, '-');

        }


    });
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/admin/pages/global/section/create.blade.php ENDPATH**/ ?>