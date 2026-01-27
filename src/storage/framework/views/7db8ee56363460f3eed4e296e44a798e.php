<form action="<?php echo e($route); ?>" class="fx align-items-center sort_submit mx-1" method="post">
    <?php echo csrf_field(); ?>
    <input class="form-control" value="<?php echo e($menu->sort_order); ?>" name="sort_order">
</form><?php /**PATH /var/www/html/resources/views/admin/components/sort-form.blade.php ENDPATH**/ ?>