<?php $__env->startSection('body'); ?>

    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <?php echo $__env->make('admin.components.error', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                <section class="langs-edit">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <ul class="nav nav-tabs mb-3" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link d-flex align-items-center active" id="account-tab"
                                           data-toggle="tab" href="#account" aria-controls="account" role="tab"
                                           aria-selected="true">
                                            <i class="feather icon-user mr-25"></i><span class="d-none d-sm-block">Language</span>
                                        </a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="account" aria-labelledby="account-tab"
                                         role="tabpanel">

                                        <?php
                                            $isEdit = isset($lang);
                                        ?>

                                        <form
                                            novalidate enctype="multipart/form-data"
                                            action="<?php echo e($isEdit ? route('langs.update', $lang) : route('langs.store')); ?>"
                                            method="POST"
                                        >
                                            <?php echo csrf_field(); ?>
                                            <?php if($isEdit): ?>
                                                <?php echo method_field('PUT'); ?>
                                            <?php endif; ?>

                                            <div class="row">

                                                <!-- LEFT SIDE -->
                                                <div class="col-12">

                                                    <div class="form-group">
                                                        <label>Code</label>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            name="code"
                                                            placeholder="e.g., en"
                                                            value="<?php echo e(old('code', $isEdit ? $lang->code : '')); ?>"
                                                            required
                                                        >
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Admin Name</label>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            name="name"
                                                            placeholder="Language Name"
                                                            value="<?php echo e(old('name', $isEdit ? $lang->name : '')); ?>"
                                                            required
                                                        >
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Locale (optional)</label>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            name="locale"
                                                            placeholder="e.g., en_US"
                                                            value="<?php echo e(old('locale', $isEdit ? $lang->locale : '')); ?>"
                                                        >
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Front name</label>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            name="short_name"
                                                            placeholder="e.g., en_US"
                                                            value="<?php echo e(old('short_name', $isEdit ? $lang->short_name : '')); ?>"
                                                        >
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Status</label>
                                                        <select name="status" class="form-control">
                                                            <option
                                                                value="1" <?php echo e(old('status', $isEdit ? $lang->status : 1) == 1 ? 'selected' : ''); ?>>
                                                                Active
                                                            </option>
                                                            <option
                                                                value="0" <?php echo e(old('status', $isEdit ? $lang->status : 1) == 0 ? 'selected' : ''); ?>>
                                                                Inactive
                                                            </option>
                                                        </select>
                                                    </div>

                                                    <div class="col-12 mb-1">

                                                        <a href="#myModal" role="button"
                                                           class="btn btn-info waves-effect waves-light"
                                                           data-toggle="modal"><i class="feather icon-image"></i>
                                                            Фото</a>
                                                    </div>


                                                </div>

                                                <!-- BUTTONS -->
                                                <div
                                                    class="col-12 d-flex flex-sm-row flex-column justify-content-end mt-1">
                                                    <button type="submit"
                                                            class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">
                                                        <?php echo e($isEdit ? 'Update' : 'Save'); ?>

                                                    </button>
                                                </div>

                                            </div>
                                            <input type="file" style="display: none" multiple name="images[]">
                                            <input type="hidden" multiple name="main_image">
                                            <?php $menu = $isEdit ? $lang : null ?>
                                            <input type="hidden" id="delete-route"
                                                   value="<?php echo e(route('admin.menu_main.imageDelete')); ?>">
                                            <input type="hidden" id="slug" value="langs">
                                            <?php echo $__env->make('admin.components.modal', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                                        </form>
                                        <!-- lang edit form ends -->

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>
                <!-- lang edit ends -->
            </div>

        </div>
    </div>
    <!-- END: Content-->

<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/admin/pages/langs/save.blade.php ENDPATH**/ ?>