<?php $__env->startSection('body'); ?>

    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row"></div>
            <div class="content-body">

                <section class="users-edit">
                    <div class="card">

                        <div class="card-content">
                            <div class="card-body">
                                <ul class="nav nav-tabs mb-3" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link d-flex align-items-center active" id="account-tab"
                                            data-toggle="tab" href="#account" aria-controls="account" role="tab"
                                            aria-selected="true">
                                            <i class="feather icon-user mr-25"></i><span class="d-none d-sm-block">Соц
                                                сеть</span>
                                        </a>
                                    </li>

                                </ul>

                                <?php if($errors->any()): ?>
                                    <div class="alert alert-danger"
                                        style="padding: 15px; margin-bottom: 20px; background: #f8d7da; color: #721c24; border-radius: 5px;">
                                        <ul style="margin: 0; padding-left: 20px;">
                                            <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <li><?php echo e($error); ?></li>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </ul>
                                    </div>
                                <?php endif; ?>
                                <?php
                                    $isEdit = isset($socialLink);
                                ?>

                                <form novalidate
                                    action="<?php echo e($isEdit ? route('social_links.update', $socialLink->id) : route('social_links.store')); ?>"
                                    method="POST">
                                    <?php echo csrf_field(); ?>
                                    <?php if($isEdit): ?>
                                        <?php echo method_field('PUT'); ?>
                                    <?php endif; ?>

                                    <div class="row">
                                        <div class="col-md-12 mb-2">
                                            <label for="name" class="form-label">Имя</label>
                                            <input type="text" class="form-control" id="name" name="name"
                                                placeholder="Social network name"
                                                value="<?php echo e(old('name', $socialLink->name ?? '')); ?>" required>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label for="icon" class="form-label">Иконка</label>
                                            <input type="text" class="form-control" id="icon" name="icon"
                                                placeholder="facebook" value="<?php echo e(old('icon', $socialLink->icon ?? '')); ?>">
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label for="url" class="form-label">URL</label>
                                            <input type="url" class="form-control" id="url" name="url"
                                                placeholder="https://example.com"
                                                value="<?php echo e(old('url', $socialLink->url ?? '')); ?>" required>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-switch custom-switch-success">
                                                <p class="mb-0">Status (Aktiv)</p>
                                                <input type="checkbox" class="custom-control-input" name="status" id="status" <?php echo e(old('status', $socialLink->status ?? true) ? 'checked' : ''); ?>>
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


                                </form>
                                <!-- Social Links form ends -->

                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </div>
    </div>
    <!-- END: Content-->

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/admin/pages/social_links/form.blade.php ENDPATH**/ ?>