<?php $__currentLoopData = $menus; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <?php
        $locale = app()->getLocale();
        $link = match ($menu->type) {
            'page' => url($locale . '/' . $menu->slug),
            'url' => $menu->url,
            'category', 'section' => '#',
            default => '#',
        };
    ?>

    <li class="header__submenu-item <?php echo e($menu->childrens->count() ? 'header__menu-item--dropdown' : ''); ?>">

        <?php if($menu->childrens->count()): ?>
            <a href="<?php echo e($link); ?>" class="header__menu-link">
               <?php echo e(sectionValue($menu, 'title')); ?> 
                <?php if($menu->childrens->count()): ?>
                    <i class="i-dropdown bi bi-chevron-down toggle-dropdown"></i>
                <?php endif; ?>
            </a>
        <?php else: ?>
        <a href="<?php echo e($link); ?>">
            <span class="header__submenu-link"><?php echo e(sectionValue($menu, 'title')); ?></span>
            </a>
        <?php endif; ?>

        </a>

        <?php if($menu->childrens->count()): ?>
            <ul class="header__submenu">
                <?php echo $__env->make('front.components.menu-items', ['menus' => $menu->childrens], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

            </ul>
        <?php endif; ?>

    </li>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/components/menu-items.blade.php ENDPATH**/ ?>