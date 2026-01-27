<?php $__currentLoopData = $menus; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <?php
        $locale = app()->getLocale();
        $hasChildren = $menu->childrens->count();
        $id = 'submenu_' . $menu->id;
        $link = match ($menu->type) {
            'page' => url($locale . '/' . $menu->slug),
            'url' => $menu->url,
            default => '#',
        };
    ?>

    <li
        class="<?php echo e($level === 0 ? 'menu-item' : 'submenu-item'); ?> <?php echo e($hasChildren ? ($level === 0 ? 'menu-item--dropdown' : 'submenu-item--dropdown') : ''); ?>">
        <?php if($hasChildren): ?>
            <span class="<?php echo e($level === 0 ? 'menu-link' : 'submenu-link'); ?>" data-bs-toggle="collapse"
                data-bs-target="#<?php echo e($id); ?>" aria-expanded="false" aria-controls="<?php echo e($id); ?>">
                <?php echo e(sectionValue($menu, 'title')); ?>

                <i class="<?php echo e($level === 0 ? 'i-dropdown' : 'i-next'); ?>"></i>
            </span>

            <ul class="submenu collapse" id="<?php echo e($id); ?>">
                <?php echo $__env->make('front.components.menu-item', ['menus' => $menu->childrens, 'level' => $level + 1], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
            </ul>
        <?php else: ?>
            <a href="<?php echo e($link); ?>" class="<?php echo e($level === 0 ? 'menu-link' : 'submenu-link'); ?>">
                <?php echo e(sectionValue($menu, 'title')); ?>

            </a>
        <?php endif; ?>
    </li>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH /var/www/html/resources/views/front/components/menu-item.blade.php ENDPATH**/ ?>