<?php $__env->startSection('body'); ?>
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">Qo'shish / O'zgartirish</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<?php echo e(route('admin.index')); ?>">Uy</a></li>
                                    <li class="breadcrumb-item">
                                        <a href="<?php echo e(route('admin.content.index',['category' => request()->route('category')])); ?>">Kontent</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-body">
                <?php echo $__env->make('admin.components.error', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                <?php $isEdit = isset($content); ?>

                <section class="langs-edit">
                    <form action="<?php echo e($isEdit ? route('admin.content.update', ['id'=>$content->id,'category' => request()->route('category') ]) : route('admin.content.store', ['category' => request()->route('category')])); ?>"
                          method="POST" enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>
                        <?php if($isEdit): ?> <?php echo method_field('PUT'); ?> <?php endif; ?>

                        <div class="card">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <ul class="nav nav-tabs mb-2" role="tablist">
                                                <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <li class="nav-item">
                                                        <a class="nav-link <?php echo e($k == 0 ? 'active' : ''); ?>" data-toggle="tab" href="#lang<?php echo e($language->code); ?>">
                                                            <img src="<?php echo e(sectionImages($language, true)); ?>" class="mr-50" style="width:20px" alt="flag">
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
                                                                    $translation = $isEdit ? $content->translations->firstWhere('locale', $language->code) : null;
                                                                    $data = $translation ? json_decode($translation->data, true) : [];
                                                                    $value = old('fields.' . $language->code . '.' . $setting->key, $data[$setting->key] ?? '');
                                                                ?>
                                                                <div class="form-group">
                                                                    <label><?php echo e($setting->label); ?> (<?php echo e($language->code); ?>)</label>
                                                                    <?php if($setting->type=='textarea'): ?>
                                                                        <textarea class="form-control moxiecut" name="fields[<?php echo e($language->code); ?>][<?php echo e($setting->key); ?>]"><?php echo e($value); ?></textarea>
                                                                    <?php else: ?>
                                                                        <input type="<?php echo e($setting->type == 'number' ? 'number' : 'text'); ?>"
                                                                               class="form-control <?php echo e($setting->key == 'slug' ? 'slug' : ''); ?>"
                                                                               name="fields[<?php echo e($language->code); ?>][<?php echo e($setting->key); ?>]" value="<?php echo e($value); ?>">
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
                                                $nonTranslatableData = [];
                                                if($isEdit) {
                                                    $nonTransData = $content->translations->where('locale', null)->first();
                                                    $nonTranslatableData = $nonTransData ? json_decode($nonTransData->data, true) : [];
                                                }
                                            ?>

                                            <?php $__currentLoopData = $settings; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $setting): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php if(!$setting->is_translatable): ?>
                                                    <div class="form-group">
                                                        <label><?php echo e($setting->label); ?></label>
                                                        <?php $value2 = old('fields.'.$setting->key, $nonTranslatableData[$setting->key] ?? ''); ?>

                                                        <?php if($setting->type=='textarea'): ?>
                                                            <textarea class="form-control moxiecut" name="fields[<?php echo e($setting->key); ?>]"><?php echo e($value2); ?></textarea>
                                                        <?php else: ?>
                                                            <input type="<?php echo e($setting->type == 'number' ? 'number' : 'text'); ?>" class="form-control" name="fields[<?php echo e($setting->key); ?>]" value="<?php echo e($value2); ?>">
                                                        <?php endif; ?>
                                                    </div>
                                                <?php endif; ?>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </div>
                                    </div>

                                    <div class="row mt-2">
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-outline-primary mb-1" data-toggle="modal" data-target="#myModal">
                                                <i class="feather icon-image"></i> Rasm tanlash
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-switch custom-switch-info">
                                                <p class="mb-0">Admin ko'rinishi</p>
                                                <input type="checkbox" class="custom-control-input" name="show_admin" id="show_admin" <?php echo e(old('show_admin', $content->show_admin ?? true) ? 'checked' : ''); ?>>
                                                <label class="custom-control-label" for="show_admin"></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-switch custom-switch-success">
                                                <p class="mb-0">Status (Aktiv)</p>
                                                <input type="checkbox" class="custom-control-input" name="status" id="status" <?php echo e(old('status', $content->status ?? true) ? 'checked' : ''); ?>>
                                                <label class="custom-control-label" for="status"></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-12 d-flex justify-content-between">
                                            <button type="button" class="btn btn-outline-secondary" onclick="history.back()">Orqaga</button>
                                            <button type="submit" class="btn btn-primary px-3"><?php echo e($isEdit ? 'Yangilash' : 'Saqlash'); ?></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <input type="file" style="display: none" multiple name="images[]">
                        <input type="hidden" name="main_image">
                        <?php echo $__env->make('admin.components.modal', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                    </form>
                </section>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('script'); ?>
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
<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/admin/pages/content/create.blade.php ENDPATH**/ ?>