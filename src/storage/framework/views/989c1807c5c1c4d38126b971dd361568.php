
<tr data-parent_id="<?php echo e($menu->parent_id); ?>" data-id="<?php echo e($menu->id); ?>" class="menu-row <?php if($level > 0): ?> child-row <?php endif; ?>" <?php if($level > 0): ?> style="display: none;" <?php endif; ?>>
    <td width="100">
        <?php echo $__env->make('admin.components.sort-form', [
            'menu' => $menu,
            'route' => route('admin.menu_main.update-sort', ['id' => $menu->id])
        ], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    </td>
    <td style="padding-left: <?php echo e($level * 20); ?>px">
        <?php

        ?>
        <?php if($menus->where('parent_id', $menu->id)->count() > 0): ?>
            <span class="toggle-children" style="cursor: pointer; font-weight: bold;">▶</span>
        <?php endif; ?>
        <?php echo e($menu->title); ?>

    </td>
    <td><?php echo e(ucfirst($menu->type)); ?></td>
    <td class="fx align-items-center">
        <a href="<?php echo e(route('admin.menu_main.edit', $menu->id)); ?>" class="btn btn-small btn-info mr-1">
            <i class="feather icon-edit icon-white"></i>
        </a>
        <div class="custom-control custom-switch custom-control-inline">
            <input
                type="checkbox"
                name="status"
                class="custom-control-input lang-status-switch"
                id="customSwitch<?php echo e($menu->id); ?>"
                data-id="<?php echo e($menu->id); ?>"
                <?php if($menu->status): ?> checked <?php endif; ?>
            >
            <label class="custom-control-label" for="customSwitch<?php echo e($menu->id); ?>"></label>

        </div>
        <a href="#"
           class="btn btn-danger ml-2 delete-btn"
           data-id="<?php echo e($menu->id); ?>"
           data-url="<?php echo e(route('admin.menu_main.delete',  $menu->id)); ?>">
            <i class="feather icon-trash icon-white"></i>
        </a>
    </td>
</tr>


<?php $__currentLoopData = $menus; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $child): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <?php if($child->parent_id == $menu->id): ?>
        <?php echo $__env->make('admin.components.menu-row', ['menu' => $child, 'menus' => $menus, 'level' => $level + 1], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <?php endif; ?>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php /**PATH /var/www/html/resources/views/admin/components/menu-row.blade.php ENDPATH**/ ?>