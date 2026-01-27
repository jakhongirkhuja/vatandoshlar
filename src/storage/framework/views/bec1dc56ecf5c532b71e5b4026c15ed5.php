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
                            <h2 class="content-header-title float-left mb-0">Qo'shish / O'zgartirish</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<?php echo e(route('admin.index')); ?>">Uy</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="<?php echo e(route('admin.content.index',['category' => request()->route('category')])); ?>">Kontent</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#" onclick="history.go(-1)"> Orqaga</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <?php echo $__env->make('admin.components.error', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                <section class="langs-edit">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <ul class="nav nav-tabs mb-3" role="tablist">

                                    <li class="nav-item ">
                                        <a class="nav-link d-flex align-items-center active" id="account-tab"
                                           data-toggle="tab" href="#account" aria-controls="account" role="tab"
                                           aria-selected="true">
                                            <i class="feather icon-user mr-25"></i><span class="d-none d-sm-block">Menu Sozlamalari</span>
                                        </a>
                                    </li>


                                </ul>
                                <div class="container">

                                    <form action="<?php echo e(route('admin.content.settings.create',['category' => request()->route('category')])); ?>" method="post">
                                        <?php echo csrf_field(); ?>


                                        <div id="fields-wrapper">


                                            <?php $__currentLoopData = $fields; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $f): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                                                <div class="card p-3 mb-3 field-item">
                                                    <div class="d-flex justify-content-between">
                                                        <h5>Field #<?php echo e($index); ?></h5>
                                                        <button type="button"
                                                                class="btn btn-danger btn-sm remove-field">X
                                                        </button>
                                                    </div>
                                                    <input type="hidden" name="fields[<?php echo e($index); ?>][id]"
                                                           value="<?php echo e($f->id); ?>">

                                                    <div class="row">
                                                        <div class="col-md-12 mb-2">
                                                            <label>Key</label>
                                                            <input type="text" name="fields[<?php echo e($index); ?>][key]"
                                                                   class="form-control" value="<?php echo e($f->key); ?>">
                                                        </div>
                                                        <div class="col-md-12 mb-2">
                                                            <label>Label</label>
                                                            <input type="text" name="fields[<?php echo e($index); ?>][label]"
                                                                   class="form-control" value="<?php echo e($f->label); ?>">
                                                        </div>
                                                        <div class="col-md-12 mb-2">
                                                            <label>Type</label>
                                                            <select name="fields[<?php echo e($index); ?>][type]"
                                                                    class="form-control">
                                                                <option
                                                                    value="text" <?php echo e($f->type=='text'?'selected':''); ?>>
                                                                    Text
                                                                </option>
                                                                <option
                                                                    value="textarea" <?php echo e($f->type=='textarea'?'selected':''); ?>>
                                                                    Textarea
                                                                </option>
                                                                <option
                                                                    value="select" <?php echo e($f->type=='select'?'selected':''); ?>>
                                                                    Select-Option
                                                                </option>
                                                                <option
                                                                    value="relation" <?php echo e($f->type=='relation'?'selected':''); ?>>
                                                                    Select-Option
                                                                </option>

                                                            </select>
                                                        </div>
                                                    </div>


                                                    <div class="row">
                                                        <div class="col-md-3 mb-2">
                                                            <div class="custom-control custom-switch mr-2 mb-1">
                                                                <p class="mb-0">Required</p>
                                                                <input type="checkbox" class="custom-control-input"
                                                                       name="fields[<?php echo e($index); ?>][required]"
                                                                       <?php echo e($f->required?'checked':''); ?> id="customSwitch2<?php echo e($index); ?>">
                                                                <label class="custom-control-label"
                                                                       for="customSwitch2<?php echo e($index); ?>"></label>
                                                            </div>

                                                        </div>
                                                        <div class="col-md-3 mb-2">
                                                            <div class="custom-control custom-switch mr-2 mb-1">
                                                                <p class="mb-0">Translatable</p>
                                                                <input type="checkbox" class="custom-control-input"
                                                                       name="fields[<?php echo e($index); ?>][is_translatable]"
                                                                       <?php echo e($f->is_translatable?'checked':''); ?> id="customSwitch<?php echo e($index); ?>">
                                                                <label class="custom-control-label"
                                                                       for="customSwitch<?php echo e($index); ?>"></label>
                                                            </div>


                                                        </div>
                                                        <div class="col-md-12 mb-2">
                                                            <label>Sort Order</label>
                                                            <input type="number" name="fields[<?php echo e($index); ?>][sort]"
                                                                   class="form-control" value="<?php echo e($f->sort_order); ?>">
                                                        </div>
                                                        <div class="col-md-12 mb-2">
                                                            <label>Options (comma separated)</label>
                                                            <input type="text" name="fields[<?php echo e($index); ?>][options]"
                                                                   class="form-control"
                                                                   value="<?php echo e($f->options ? implode(',', json_decode($f->options, true)) : ''); ?>">
                                                        </div>
                                                        <div class="col-md-12 mb-2">
                                                            <label>Relation (DB table name)</label>
                                                            <input type="text" name="fields[<?php echo e($index); ?>][relation]" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <button type="button" class="btn btn-primary rounded mb-3"
                                                        id="add-field"><i class="feather icon-plus  icon-white"></i>
                                                </button>
                                            </div>
                                            <div class="col">
                                                <button class="btn btn-success">Save Settings</button>
                                            </div>
                                        </div>


                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>
                <!-- lang edit ends -->
            </div>

        </div>
    </div>
    <template id="setting-template">
        <?php echo $__env->make('admin.pages.menus.main.components.menu-setting-field', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    </template>

    <script>
        document.addEventListener('input', function (e) {
            if (e.target.classList.contains('keys')) {
                // Replace spaces and non-alphanumeric characters with _
                e.target.value = e.target.value.replace(/[^a-zA-Z0-9]/g, '_');
            }
        });
        let index = <?php echo e(count($fields)); ?>;

        document.getElementById('add-field').addEventListener('click', function () {
            let template = document.getElementById('setting-template').innerHTML;

            // Replace placeholders
            let html = template.replace(/__INDEX__/g, index);

            // Insert into wrapper
            document.getElementById('fields-wrapper').insertAdjacentHTML('beforeend', html);

            index++;
            document.addEventListener('input', function (e) {
                if (e.target.classList.contains('keys')) {
                    // Replace spaces and non-alphanumeric characters with _
                    e.target.value = e.target.value.replace(/[^a-zA-Z0-9]/g, '_');
                }
            });
        });

        // Remove field
        document.addEventListener('click', function (e) {
            if (e.target.classList.contains('remove-field')) {
                e.target.closest('.field-item').remove();
            }
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/admin/pages/content/settings.blade.php ENDPATH**/ ?>