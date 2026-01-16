<!-- BEGIN: Main Menu-->
<div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto">
                <a class="navbar-brand" href="<?php echo e(route('admin.index')); ?>">
                    <div class="brand-logo"></div>
                </a>
            </li>
        </ul>
    </div>
    <div class="shadow-bottom"></div>
    <div class="main-menu-content">

        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            <?php if(auth()->user()->role_id == 1): ?>
                <li class=" nav-item ">
                    <a href="#"><i class="feather icon-user"></i><span class="menu-title" data-i18n="User">Admin</span></a>
                    <ul class="menu-content">

                        <li class="<?php echo e(is_current_route('admin.users') ? 'active' : ''); ?>"><a href="<?php echo e(route('admin.users')); ?>">

                                <i class="feather icon-circle"></i><span class="menu-item" data-i18n="List">Users</span></a>
                        </li>
                        <li class="<?php echo e(is_current_route('admin.roles') ? 'active' : ''); ?>"><a
                                href="<?php echo e(route('admin.roles')); ?>"><i class="feather icon-circle"></i><span class="menu-item"
                                    data-i18n="View">Roles</span></a>
                        </li>
                        <li class="<?php echo e(is_current_route('langs.index') ? 'active' : ''); ?>"><a
                                href="<?php echo e(route('langs.index')); ?>"><i class="feather icon-circle"></i><span class="menu-item"
                                    data-i18n="View">Lang</span></a>
                        </li>

                    </ul>
                </li>
            <?php endif; ?>
                <li class=" nav-item"><a href="#"><i class="feather icon-list"></i><span class="menu-title"
                                                                                         data-i18n="Ecommerce">Меню</span></a>
                    <ul class="menu-content">
                        <li class="<?php echo e(is_current_route('admin.menu_main.index') ? 'active' : ''); ?>"><a
                                href="<?php echo e(route('admin.menu_main.index')); ?>"><i class="feather icon-circle"></i><span
                                    class="menu-item" data-i18n="Shop">Меню Главное</span></a>
                        </li>


                    </ul>
                </li>
            <li class=" nav-item "><a href="#"><i class="feather icon-settings"></i><span class="menu-title"
                        data-i18n="User">Настройки</span></a>
                <ul class="menu-content">
                    <li class="<?php echo e(is_current_route('admin.content.index', ['category' => 'list']) ? 'active' : ''); ?>">
<a
                            href="<?php echo e(route('admin.content.index', ['category' => 'list'])); ?>"><i class="feather icon-circle"></i><span
                                class="menu-item" data-i18n="List">Список</span></a>
                    </li>
                      <li class="<?php echo e(is_current_route('admin.content.index', ['category' => 'job']) ? 'active' : ''); ?>">
<a
                            href="<?php echo e(route('admin.content.index', ['category' => 'job'])); ?>"><i class="feather icon-circle"></i><span
                                class="menu-item" data-i18n="List">Приложения</span></a>
                    </li>
                    <li class="<?php echo e(is_current_route('social_links.index') ? 'active' : ''); ?>"><a
                            href="<?php echo e(route('social_links.index')); ?>"><i class="feather icon-circle"></i><span
                                class="menu-item" data-i18n="View">Соц сети</span></a>
                    </li>

                </ul>
            </li>
            <li class=" navigation-header"><span>Main</span>
            </li>

            <?php $__currentLoopData = $globalmenus; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                <?php echo $__env->make('admin.components.menu-item', [
                    'menu' => $menu,
                    'slug' => $menu->slug
                ], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    <li class=" navigation-header"><span>Формы</span>
            </li>

    <li class="nav-item <?php echo e(is_current_route('admin.supports', ['type' => 'form']) ? 'active' : ''); ?>">
                <a href="<?php echo e(route('admin.supports', ['type' => 'form'])); ?>"><i class="feather icon-mail "></i>
                        <span  class="menu-item" data-i18n="View">Enquire</span>
                    </a>
            </li>
            <li class="nav-item <?php echo e(is_current_route('admin.supports', ['type' => 'application']) ? 'active' : ''); ?>">
                <a href="<?php echo e(route('admin.supports', ['type' => 'application'])); ?>"><i class="feather icon-mail "></i>
                        <span  class="menu-item" data-i18n="View">Applications</span>
                    </a>
            </li>
             <li class="nav-item <?php echo e(is_current_route('admin.supports', ['type' => 'participation']) ? 'active' : ''); ?>">
                <a href="<?php echo e(route('admin.supports', ['type' => 'participation'])); ?>"><i class="feather icon-mail "></i>
                        <span  class="menu-item" data-i18n="View">Participations</span>
                    </a>
            </li>
        </ul>
    </div>
</div>
<?php /**PATH /var/www/html/resources/views/admin/components/sidebar.blade.php ENDPATH**/ ?>