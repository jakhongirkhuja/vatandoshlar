<?php $__env->startSection('body'); ?>
    <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="content">
                   <h3> <?php echo e(sectionValue($items,'title')); ?></h3>
                    <h3> <?php echo e(sectionValue($items,'description')); ?></h3>
                </div>
                <div class="content">
                    <h3> <?php echo sectionValue($items,'info'); ?></h3>
                </div>
            </div>
            <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/static/index.blade.php ENDPATH**/ ?>