<?php $__env->startSection('body'); ?>

    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">Добавить / Изменить</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<?php echo e(route('admin.index')); ?>">Главная</a></li>
                                    <li class="breadcrumb-item"><a href="<?php echo e(route('admin.menu_main.index')); ?>">Меню</a>
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

                <?php $isEdit = isset($menu); ?>
                <input type="hidden" id="deleteRoute" value="<?php echo e(request()->root()); ?>">
                <section class="langs-edit">
                    <form
                        action="<?php echo e($isEdit ? route('admin.menu_main.update', ['id' => $menu->id]) : route('admin.menu_main.store')); ?>"
                        method="POST" enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>
                        <?php if($isEdit): ?>
                            <?php echo method_field('PUT'); ?>
                        <?php endif; ?>

                        <div class="row">
                            <div class="col-12 mt-3">
                                <ul class="nav nav-tabs mb-2" role="tablist">
                                    <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <li class="nav-item fx align-items-center">
                                            <a class="nav-link <?php echo e($k == 0 ? 'active' : ''); ?>" data-toggle="tab"
                                                href="#lang<?php echo e($language->code); ?>">
                                                <img src="<?php echo e(sectionImages($language, true)); ?>" class="size_small" alt="flag">
                                                <?php echo e($language->name); ?>

                                            </a>
                                        </li>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </ul>

                                <div class="tab-content">
                                    <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="tab-pane <?php echo e($k == 0 ? 'active' : ''); ?>" id="lang<?php echo e($language->code); ?>">
                                            <?php $__currentLoopData = $settings; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $setting): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php if($setting->is_translatable): ?>
                                                    <?php
                                                        $translation = $isEdit ? $menu->translations->firstWhere('locale', $language->code)
                                                            : null;
                                                        $data = $translation ? json_decode($translation->data, true) : [];
                                                        $value = old('fields.' . $language->code . '.' . $setting->key, $data[$setting->key]
                                                            ?? '');
                                                    ?>
                                                    <div class="form-group">

                                                        <label><?php echo e($setting->label); ?> (<?php echo e($language->code); ?>)</label>
                                                        <?php if($setting->type == 'textarea' || $setting->type == 'textarea-editor'): ?>
                                                            <textarea
                                                                class="form-control <?php echo e($setting->type == 'textarea-editor' ? 'summernote' : ''); ?>"
                                                                name="fields[<?php echo e($language->code); ?>][<?php echo e($setting->key); ?>]"><?php echo e($value); ?></textarea>
                                                        <?php elseif($setting->type == 'datetime-local'): ?>
                                                            <input type="datetime-local" class="form-control"
                                                                name="fields[<?php echo e($language->code); ?>][<?php echo e($setting->key); ?>]" value=<?php echo e($value); ?>>
                                                        <?php else: ?>
                                                            <?php $type = $setting->type == 'text' ? 'text' : 'number' ?>
                                                            <input type="<?php echo e($type); ?>" class="form-control"
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
                                <?php $__currentLoopData = $settings; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $setting): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php if(!$setting->is_translatable): ?>
                                        <?php
                                            $value2 = old('fields.' . $setting->key, $isEdit ? ($nonTranslatableData[$setting->key] ??
                                                '') : '');

                                        ?>
                                        <div class="form-group">
                                            <label><?php echo e($setting->label); ?></label>
                                            <?php if($setting->type == 'textarea' || $setting->type == 'textarea-editor'): ?>
                                                <textarea
                                                    class="form-control <?php echo e($setting->type == 'textarea-editor' ? 'summernote' : ''); ?>"
                                                    name="fields[<?php echo e($setting->key); ?>]"><?php echo e($value2); ?></textarea>
                                            <?php elseif($setting->type == 'datetime-local'): ?>
                                                <input type="datetime-local" class="form-control" name="fields[<?php echo e($setting->key); ?>]"
                                                    value=<?php echo e($value); ?>>
                                            <?php else: ?>

                                                <?php $type = $setting->type == 'text' ? 'text' : 'number' ?>
                                                <input type="<?php echo e($type); ?>" class="form-control" name="fields[<?php echo e($setting->key); ?>]"
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
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Kategoriya</label>
                                            <select name="parent_id" class="form-control">
                                                <option value="">Asosiy menu</option>

                                                <?php $__currentLoopData = $menus; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $parent): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                                        <option value="<?php echo e($parent->id); ?>" <?php echo e(old('parent_id', $menu->parent_id ??
                                                    '') == $parent->id ? 'selected' : ''); ?>>
                                                                                            <?php echo e(sectionValue($parent, 'title')); ?>

                                                                                        </option>

                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Type</label>
                                            <select name="type" class="form-control" id="menu-type" required>
                                                <?php $__currentLoopData = ['page', 'category', 'section', 'url']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $type): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                                        <option value="<?php echo e($type); ?>" <?php echo e(old('type', $menu->type ?? '') == $type ?
                                                    'selected' : ''); ?>><?php echo e(ucfirst($type)); ?></option>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-12" id="menu-slug">
                                        <div class="form-group">
                                            <label>Slug</label>
                                            <input type="text" name="slug" class="form-control slug"
                                                value="<?php echo e(old('slug', $menu->slug ?? '')); ?>">
                                        </div>
                                    </div>
                                    <div class="col-12" id="menu-url">
                                        <div class="form-group">
                                            <label>URL</label>
                                            <input type="text" name="url" class="form-control"
                                                value="<?php echo e(old('url', $menu->url ?? '')); ?>">
                                        </div>
                                    </div>



                                    <div class="col-12 mb-1">
                                        <div class="form-group">
                                            <label>Icon</label>
                                            <input type="text" name="icon" class="form-control"
                                                value="<?php echo e(old('icon', $menu->icon ?? '')); ?>">
                                        </div>

                                    </div>
                                    <div class="col-12 mb-1">

                                        <a href="#myModal" role="button" class="btn btn-info waves-effect waves-light"
                                            data-toggle="modal"><i class="feather icon-image"></i> Rasm</a>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-check">
                                            <div class="custom-control custom-switch  mb-1">
                                                <p class="mb-0">Test</p>
                                                <input type="checkbox" class="custom-control-input" name="test" <?php echo e(old('test', isset($menu) ? $menu->test : false) ? 'checked' : ''); ?>

                                                    id="customSwitchTest">
                                                <label class="custom-control-label" for="customSwitchTest"></label>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-check">
                                            <div class="custom-control custom-switch  mb-1">
                                                <p class="mb-0">Show Admin</p>
                                                <input type="checkbox" class="custom-control-input" name="show_admin" <?php echo e(old('show_admin', $menu->show_admin ?? true) ? 'checked' : ''); ?>

                                                    id="customSwitchShowAdmin">
                                                <label class="custom-control-label" for="customSwitchShowAdmin"></label>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-check">
                                            <div class="custom-control custom-switch custom-switch-success mb-1">
                                                <p class="mb-0">Status</p>
                                                <input type="checkbox" class="custom-control-input" name="status" <?php echo e(old('status', $menu->status ?? true) ? 'checked' : ''); ?>

                                                    id="customSwitchStatus">
                                                <label class="custom-control-label" for="customSwitchStatus"></label>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row mt-3">
                            <div class="col-12 d-flex justify-content-between">
                                <button type="button" class="btn btn-outline-secondary"
                                    onclick="history.back()">Назад</button>
                                <button type="submit"
                                    class="btn btn-primary px-3"><?php echo e($isEdit ? 'Обновить' : 'Сохранить'); ?></button>
                            </div>
                        </div>

                        <input type="file" style="display: none" multiple name="images[]">
                        <input type="hidden" multiple name="main_image">
                        <input type="hidden" id="delete-route" value="<?php echo e(route('admin.menu_main.imageDelete')); ?>">
                        <input type="hidden" id="slug" value="menu">
                        <?php echo $__env->make('admin.components.modal', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                    </form>
                </section>
            </div>
        </div>
    </div>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const firstInput = document.querySelector('.tab-content input');

            const slugInput = document.querySelector('#menu-slug input');
            if (firstInput && slugInput) {

                firstInput.addEventListener('input', function () {
                    let value = firstInput.value;
                    value = value.replace(/\s+/g, '-');
                    value = value.replace(/[^a-zA-Z0-9_?#]/g, '-').toLowerCase();

                    const typeSelect = document.getElementById('menu-type');

                    if (typeSelect.value === 'page') {
                        slugInput.value = value;
                    } else {
                        slugInput.value = '';
                    }
                });
            }
        });
        document.addEventListener('input', function (e) {
            if (e.target.classList.contains('slug')) {
                e.target.value = e.target.value
                    .replace(/\s+/g, '_')
                    .replace(/[^a-zA-Z0-9_?#]/g, '_');

            }


        });
        document.addEventListener('DOMContentLoaded', function () {
            const typeSelect = document.getElementById('menu-type');
            const slugInput = document.getElementById('menu-slug');
            const urlInput = document.getElementById('menu-url');

            function toggleFields() {
                const type = typeSelect.value;

                if (type === 'category' || type === 'section') {
                    slugInput.style.display = 'none';
                    urlInput.style.display = 'none';
                } else if (type === 'page') {
                    slugInput.style.display = 'block';
                    urlInput.style.display = 'none';
                } else if (type === 'url') {
                    slugInput.style.display = 'none';
                    urlInput.style.display = 'block';
                }
            }

            typeSelect.addEventListener('change', toggleFields);

            // Call on page load
            toggleFields();
        });
    </script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/admin/pages/menus/main/create.blade.php ENDPATH**/ ?>