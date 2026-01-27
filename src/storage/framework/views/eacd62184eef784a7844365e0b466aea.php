<?php $__env->startSection('body'); ?>

    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <!-- users edit start -->
                <section class="users-edit">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <ul class="nav nav-tabs mb-3" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link d-flex align-items-center active" id="account-tab"
                                           data-toggle="tab" href="#account" aria-controls="account" role="tab"
                                           aria-selected="true">
                                            <i class="feather icon-user mr-25"></i><span class="d-none d-sm-block">Аккаунт</span>
                                        </a>
                                    </li>

                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="account" aria-labelledby="account-tab"
                                         role="tabpanel">

                                        <?php
                                            $isEdit = isset($role);
                                        ?>

                                        <form
                                            novalidate
                                            action="<?php echo e($isEdit ? route('admin.roles.update', $role->id) : route('admin.roles.create')); ?>"
                                            method="POST"
                                        >
                                            <?php echo csrf_field(); ?>
                                            <?php if($isEdit): ?>
                                                <?php echo method_field('PUT'); ?>
                                            <?php endif; ?>

                                            <div class="row">

                                                <!-- LEFT SIDE -->
                                                <div class="col-12 col-sm-12">

                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Name</label>
                                                            <input
                                                                type="text"
                                                                class="form-control"
                                                                name="name"
                                                                placeholder="name"
                                                                value="<?php echo e(old('name', $isEdit ? $role->name : '')); ?>"
                                                                required
                                                            >
                                                        </div>
                                                    </div>


                                                </div>

                                            </div>

                                            <?php if(count($main)>0): ?>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label class="mb-2">Permissions</label>
                                                            <?php $__currentLoopData = $main; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                <?php echo $__env->make('admin.components.menu-item-role', [
                                                                    'item' => $menu,
                                                                    'level' => 0,
                                                                    'accountswitch' => 0
                                                                ], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                        </div>
                                                    </div>
                                                </div>
                                            <?php endif; ?>
                                            <div class="row mt-3">
                                                <div class="col-12 d-flex justify-content-between">
                                                    <button type="button" class="btn btn-outline-secondary" onclick="history.back()">Orqaga</button>
                                                    <button type="submit" class="btn btn-primary px-3"><?php echo e($isEdit ? 'Yangilash' : 'Saqlash'); ?></button>
                                                </div>
                                            </div>

                                        </form>

                                        <!-- users edit account form ends -->
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- users edit ends -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/admin/pages/roles/save.blade.php ENDPATH**/ ?>