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
                                            novalidate
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
                                                        <label>Name</label>
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
                                                        <label>Direction</label>
                                                        <select name="direction" class="form-control" required>
                                                            <option
                                                                value="ltr" <?php echo e(old('direction', $isEdit ? $lang->direction : '') == 'ltr' ? 'selected' : ''); ?>>
                                                                LTR
                                                            </option>
                                                            <option
                                                                value="rtl" <?php echo e(old('direction', $isEdit ? $lang->direction : '') == 'rtl' ? 'selected' : ''); ?>>
                                                                RTL
                                                            </option>
                                                        </select>
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

                                                    <div class="form-group">
                                                        <label>Default Language</label>
                                                        <select name="is_default" class="form-control">
                                                            <option
                                                                value="1" <?php echo e(old('is_default', $isEdit ? $lang->is_default : 0) == 1 ? 'selected' : ''); ?>>
                                                                Yes
                                                            </option>
                                                            <option
                                                                value="0" <?php echo e(old('is_default', $isEdit ? $lang->is_default : 0) == 0 ? 'selected' : ''); ?>>
                                                                No
                                                            </option>
                                                        </select>
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
                                                        <label>Flag Icon (optional)</label>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            name="flag_icon"
                                                            placeholder="Path to flag icon"
                                                            value="<?php echo e(old('flag_icon', $isEdit ? $lang->flag_icon : '')); ?>"
                                                        >
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