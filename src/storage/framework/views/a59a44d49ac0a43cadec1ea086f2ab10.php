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
                                            <i class="feather icon-user mr-25"></i><span class="d-none d-sm-block">Настройки сайта</span>
                                        </a>
                                    </li>

                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="account" aria-labelledby="account-tab"
                                         role="tabpanel">
                                        <?php echo $__env->make('admin.components.error', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

                                        <form

                                            action="<?php echo e(route('admin.settings.create')); ?>"
                                            method="POST"
                                        >
                                            <?php echo csrf_field(); ?>

                                            <div class="row">

                                                <div class="col-md-12">
                                                    <ul class="nav nav-tabs mb-2" role="tablist">
                                                        <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                            <li class="nav-item">
                                                                <a class="nav-link <?php echo e($k === 0 ? 'active' : ''); ?>"
                                                                   data-toggle="tab"
                                                                   href="#lang<?php echo e($language->code); ?>">
                                                                    <img
                                                                        src="<?php echo e(asset('assets/'.$language->flag_icon)); ?>"
                                                                        class="size_small">
                                                                    <?php echo e($language->name); ?>

                                                                </a>
                                                            </li>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    </ul>
                                                </div>
                                                <div class="tab-content w-100">
                                                    <?php $__currentLoopData = $languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <div class="tab-pane fade <?php echo e($k === 0 ? 'show active' : ''); ?>"
                                                             id="lang<?php echo e($language->code); ?>">


                                                            <div class="col-md-12 mb-2">
                                                                <label>Заголовок сайта (<?php echo e($language->code); ?>)</label>
                                                                <input
                                                                    type="text"
                                                                    class="form-control"
                                                                    name="title[<?php echo e($language->code); ?>]"

                                                                    value="<?php echo e(old(
                                                                            'title.'.$language->code,
                                                                            $settings->title[$language->code] ?? ''
                                                                        )); ?>"
                                                                >
                                                            </div>

                                                            <div class="col-md-12 mb-2">
                                                                <label>Описание (<?php echo e($language->code); ?>)</label>
                                                                <textarea
                                                                    class="form-control"
                                                                    name="meta_description[<?php echo e($language->code); ?>]"
                                                                    rows="3"

                                                                ><?php echo e(old(
                                                                    'meta_description.'.$language->code,
                                                                    $settings->meta_description[$language->code] ?? ''
                                                                )); ?></textarea>
                                                            </div>


                                                            <div class="col-md-12 mb-2">
                                                                <label>Meta keywords (<?php echo e($language->code); ?>)</label>
                                                                <input
                                                                    type="text"
                                                                    class="form-control"
                                                                    name="meta_keywords[<?php echo e($language->code); ?>]"
                                                                    value="<?php echo e(old(
                                                                        'meta_keywords.'.$language->code,
                                                                        $settings->meta_keywords[$language->code] ?? ''
                                                                    )); ?>"
                                                                >
                                                            </div>

                                                        </div>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </div>
                                                <div class="col-md-12 mb-2">

                                                    <label class="form-label">E-mail</label>
                                                    <input
                                                        type="email"
                                                        name="email"
                                                        value="<?php echo e(old(
                                                                        'email',
                                                                        $settings->email ?? ''
                                                                    )); ?>"
                                                        class="form-control"
                                                        placeholder="admin@example.com">

                                                </div>


                                                <!-- Disable Site -->
                                                <div class="col-md-12 mb-2">
                                                    <label class="form-label d-block">Выключить сайт</label>
                                                    <div class="custom-control custom-switch custom-control-inline">
                                                        <input
                                                            type="checkbox"
                                                            name="status"
                                                            class="custom-control-input lang-status-switch"
                                                            id="customSwitch" <?php if($settings?->status): ?> checked <?php endif; ?>
                                                        >
                                                        <label class="custom-control-label" for="customSwitch"></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-1">
                                                    <div class="form-group">
                                                        <label>Главная страница</label>
                                                        <select name="main_page_id" required class="form-control">
                                                            <option >Выбрать</option>
                                                            <?php $__empty_1 = true; $__currentLoopData = $pages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $page): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                                                <option value="<?php echo e($page->id); ?>"
                                                                    <?php echo e($page->id == $settings?->main_page_id ? 'selected' : ''); ?>

                                                                >
                                                                    <?php echo e($page->getTitle($page->translations, app()->getLocale())); ?>

                                                                </option>
                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>

                                                            <?php endif; ?>

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-1">
                                                    <div class="form-group">
                                                        <label>Поиск по</label>
                                                        <select name="search_ids[]"  id="search_ids" multiple="multiple"  class="form-control select2">
                                                            <option >Выбрать</option>

                                                            <?php $__currentLoopData = $pages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                <option value="<?php echo e($menu->id); ?>"
                                                                    <?php echo e(in_array($menu->id, $settings->search_ids ?? []) ? 'selected' : ''); ?>>
                                                                    <?php echo e($menu->getTitle($menu->translations, app()->getLocale())); ?>

                                                                </option>
                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>


                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-1">
                                                    <div class="form-group">
                                                        <label>Вкл сортировок</label>
                                                        <select name="sorting_ids[]"  id="sorting_ids" multiple="multiple"  class="form-control select2">
                                                            <option >Выбрать</option>

                                                            <?php $__currentLoopData = $pages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                <option value="<?php echo e($menu->id); ?>"
                                                                    <?php echo e(in_array($menu->id, $settings->sorting_ids ?? []) ? 'selected' : ''); ?>>
                                                                    <?php echo e($menu->getTitle($menu->translations, app()->getLocale())); ?>

                                                                </option>
                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>


                                                        </select>
                                                    </div>
                                                </div>

                                                <!-- Admin Panel IP Binding -->
                                                <div class="col-md-12 mb-2">
                                                    <label class="form-label">
                                                        Привязка админ панели к IP адресу
                                                    </label>
                                                    <input
                                                        type="text"
                                                        name="admin_ips"
                                                        class="form-control"
                                                        value="<?php echo e(old(
                                                                        'admin_ips',
                                                                        $settings->admin_ips ?? ''
                                                                    )); ?>"
                                                        placeholder="192.168.40.118, 192.168.40.119"
                                                    >
                                                    <small class="text-muted">
                                                        Если IP-адресов несколько, разделите их запятыми.
                                                    </small>
                                                </div>


                                            </div>


                                            <div class="row">
                                                <div class="col-12">
                                                    <div
                                                        class="col-12 d-flex flex-sm-row flex-column justify-content-end mt-1">
                                                        <button type="submit"
                                                                class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">
                                                            <?php echo e('Обновить'); ?>

                                                        </button>

                                                    </div>
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

<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/admin/pages/settings/index.blade.php ENDPATH**/ ?>