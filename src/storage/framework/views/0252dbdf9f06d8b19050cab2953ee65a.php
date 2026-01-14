<?php $__env->startSection('body'); ?>
    <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="directions content">
                    <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="directions__card">
                            <div class="directions__card--img">
                                <div class="directions__card--img-logo">
                                    <?php
                                        $mainImage = sectionImages($item, true);
                                    ?>
                                    <?php if($mainImage): ?>
                                        <img src="<?php echo e($mainImage); ?>" alt="<?php echo e(sectionValue($item, 'title')); ?>">
                                    <?php endif; ?>
                                </div>
                                <div class="directions__card--num">
                                    <?php echo e($index + 1); ?>

                                </div>
                            </div>
                            <div class="directions__card--text">
                                <?php echo e(sectionValue($item, 'title')); ?>

                            </div>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
            <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/fonds/index.blade.php ENDPATH**/ ?>