<?php $__env->startSection('body'); ?>
    <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <section class="newspaper">
                    <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="newspapers">
                                <strong class="newspaper-title">
                                    <?php echo e(sectionValue($item, 'title')); ?>

                                </strong>

                                <p>
                                    <?php echo e(sectionValue($item, 'description')); ?>

                                </p>

                                <?php
                                    $image = sectionImages($item, true);
                                ?>
                                    <img src="<?php echo e($image); ?>" alt="">
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </section>
            </div>

            <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/newspaper/inside/index.blade.php ENDPATH**/ ?>