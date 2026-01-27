<?php
$children = $menus->where('parent_id', $menu->id);
?>

<li class="menu__item" data-id="<?php echo e($menu->id); ?>">
    <div class="menu__top">
        <div class="menu__left">
            <?php if($children->count()): ?>
            <span class="menu__toggle m-0" aria-label="toggle">+</span>
            <?php endif; ?>
            <?php echo $__env->make('admin.components.sort-form', [
            'menu' => $menu,
            'route' => route('admin.menu_main.update-sort', ['id' => $menu->id])
            ], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
            <span class="menu__title">
                <?php echo e($menu->title); ?> (<?php echo e($menu->type); ?>)
            </span>
        </div>


        <div class="menu__actions">
            <a href="<?php echo e(route('admin.menu_main.edit', $menu->id)); ?>" class="btn  btn-info">
                <i class="feather icon-edit"></i>
            </a>

            <div class="custom-control custom-switch custom-control-inline">
                <input type="checkbox" class="custom-control-input lang-status-switch" id="customSwitch<?php echo e($menu->id); ?>"
                    data-id="<?php echo e($menu->id); ?>" <?php if($menu->status): echo 'checked'; endif; ?>>
                <label class="custom-control-label" for="customSwitch<?php echo e($menu->id); ?>"></label>
            </div>


            <button type="button" class="btn btn-danger delete-btn" data-id="<?php echo e($menu->id); ?>"
                data-url="<?php echo e(route('admin.menu_main.delete', $menu->id)); ?>">
                <i class="feather icon-trash"></i>
            </button>
        </div>
    </div>
    <?php if($children->count()): ?>
    <ul class="menu__bottom">
        <?php $__currentLoopData = $children; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $child): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        
        <?php echo $__env->make('admin.pages.menus.main.components.menu-item', [
        'menu' => $child,
        'menus' => $menus
        ], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </ul>
    <?php endif; ?>
</li><?php /**PATH /var/www/html/resources/views/admin/pages/menus/main/components/menu-item.blade.php ENDPATH**/ ?>