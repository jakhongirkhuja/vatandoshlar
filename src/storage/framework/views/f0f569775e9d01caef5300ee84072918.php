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
                            <h2 class="content-header-title float-left mb-0">Добавить / Редактирование</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<?php echo e(route('admin.index')); ?>">Главная</a></li>
                                    <li class="breadcrumb-item"><a href="<?php echo e(route('admin.content.index',['category' => request()->route('category')])); ?>">Контент</a>
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

                <?php $isEdit = isset($content); ?>
                <input type="hidden" id="deleteRoute"  value="<?php echo e(request()->root()); ?>">
                <section class="langs-edit">
                    <form
                        action="<?php echo e($isEdit ? route('admin.content.update', ['id'=>$content->id,'category' => request()->route('category') ]) : route('admin.content.store', ['category' => request()->route('category')])); ?>"
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
                                                        $translation = $isEdit ? $content->translations->firstWhere('locale', $language->code) : null;
                                                        $data = $translation ? json_decode($translation->data, true) : [];
                                                        $value = old('fields.' . $language->code . '.' . $setting->key, $data[$setting->key] ?? '');
                                                    ?>
                                                    <div class="form-group">

                                                        <label><?php echo e($setting->label); ?> (<?php echo e($language->code); ?>)</label>
                                                        <?php if($setting->type=='textarea'): ?>
                                                            <textarea class="form-control moxiecut"
                                                                      name="fields[<?php echo e($language->code); ?>][<?php echo e($setting->key); ?>]"><?php echo e($value); ?></textarea>
                                                        <?php else: ?>
                                                            <?php $type = $setting->type=='text'? 'text' : 'number' ?>
                                                            <input
                                                                type="<?php echo e($type); ?>"
                                                                class="form-control"
                                                                name="fields[<?php echo e($language->code); ?>][<?php echo e($setting->key); ?>]"
                                                                value="<?php echo e($value); ?>"
                                                            >
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
                                    $nonTranslatableTranslations = $isEdit ? $content->translations->where('locale', null) : collect();
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
                                            <?php if($setting->type=='textarea'): ?>
                                                <textarea class="form-control moxiecut"
                                                          name="fields[<?php echo e($setting->key); ?>]"><?php echo e($value2); ?></textarea>
                                            <?php else: ?>
                                                <?php $type = $setting->type=='text'? 'text' : 'number' ?>
                                                <input
                                                    type="<?php echo e($type); ?>"
                                                    class="form-control"
                                                    name="fields[<?php echo e($setting->key); ?>]"
                                                    value="<?php echo e($value2); ?>"
                                                >
                                            <?php endif; ?>

                                        </div>
                                    <?php endif; ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>


                            </div>

                            <!-- Submit button -->


                        </div>

                                  <div class="row">
                                      <div class="col-12 mb-1">

                                          <a href="#myModal" role="button" class="btn btn-info waves-effect waves-light" data-toggle="modal"><i class="feather icon-image"></i> Фото</a>
                                      </div>
                                      <div class="col-4">
                                          <div class="form-check">
                                              <div class="custom-control custom-switch  mb-1">
                                                  <p class="mb-0">Show Admin</p>
                                                  <input type="checkbox" class="custom-control-input"
                                                         name="show_admin"
                                                         <?php echo e(old('show_admin', $content->show_admin ?? true) ? 'checked' : ''); ?>

                                                         id="customSwitchShowAdmin">
                                                  <label class="custom-control-label"
                                                         for="customSwitchShowAdmin"></label>
                                              </div>

                                          </div>
                                      </div>
                                      <div class="col-4">
                                          <div class="form-check">
                                              <div class="custom-control custom-switch custom-switch-success mb-1">
                                                  <p class="mb-0">Status</p>
                                                  <input type="checkbox" class="custom-control-input"
                                                         name="status"
                                                         <?php echo e(old('status', $content->status ?? true) ? 'checked' : ''); ?>

                                                         id="customSwitchStatus">
                                                  <label class="custom-control-label"
                                                         for="customSwitchStatus"></label>
                                              </div>

                                          </div>
                                      </div>
                                  </div>

                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-12 d-flex flex-sm-row flex-column justify-content-end ">
                                <button type="submit" class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">
                                    <?php echo e($isEdit ? 'Update' : 'Save'); ?>

                                </button>
                            </div>
                        </div>
                         <input type="file" style="display: none" multiple name="images[]">
                        <input type="hidden" multiple name="main_image">
                        <input type="hidden" id="delete-route" value="<?php echo e(route('admin.menu_main.imageDelete')); ?>">
                         <input type="hidden" id="slug" value="content">
                        <?php if($isEdit): ?>
                           <?php $menu = $content ?>
                            <?php endif; ?>
                          <?php echo $__env->make('admin.components.modal', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

                    </form>
                </section>
            </div>
        </div>
    </div>


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

                    if(typeSelect.value==='page'){
                        slugInput.value = value;
                    }else{
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

                if(type === 'category' || type ==='section') {
                    slugInput.style.display = 'none';
                    urlInput.style.display = 'none';
                } else if(type === 'page') {
                    slugInput.style.display = 'block';
                    urlInput.style.display = 'none';
                } else if(type === 'url') {
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
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/admin/pages/content/create.blade.php ENDPATH**/ ?>