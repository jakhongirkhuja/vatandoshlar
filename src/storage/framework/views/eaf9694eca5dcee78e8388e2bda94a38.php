<div class="custom-control custom-checkbox d-flex align-items-center mb-1"
     style="margin-left: <?php echo e($level * 35); ?>px;">

    <?php
        $switchId = 'accountSwitch' . $item->id;
        $isChecked = isset($role) && $role->menus->contains('id', $item->id);
    ?>

    <input type="checkbox"
           name="menus[]"
           value="<?php echo e($item->id); ?>"
           class="custom-control-input"
           id="<?php echo e($switchId); ?>"
           <?php echo e($isChecked ? 'checked' : ''); ?>>

    <label class="custom-control-label mr-1" for="<?php echo e($switchId); ?>">
  <span class="switch-label w-100">
        <?php if($level == 0): ?><strong><?php endif; ?>
            <?php echo e($item->getTitle($item->translations, app()->getLocale())); ?>

        <?php if($level == 0): ?></strong><?php endif; ?>
    </span>
    </label>

  

</div>

<?php if($item->childrens->count()): ?>
    <?php $__currentLoopData = $item->childrens; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $child): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <?php echo $__env->make('admin.components.menu-item-role', [
            'item' => $child,
            'level' => $level + 1,
            'role' => $role ?? null
        ], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php endif; ?>
<?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/admin/components/menu-item-role.blade.php ENDPATH**/ ?>