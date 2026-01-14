<?php $__env->startSection('body'); ?>
    <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="container">
                    <div class="associations__view">
                        <div class="associations__view--grid">
                            <?php
                                $items = $items->first();
                            ?>
                            <?php $__currentLoopData = $items->children; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <div class="associations__view--grid-item">
                                                        <div class="associations__view--grid-item-img">
                                                            <?php
                                                                $image = sectionImages($item, true);
                                                            ?>

                                                            <?php if($image): ?>
                                                                <img src="<?php echo e($image); ?>" alt="<?php echo e(sectionValue($item, 'title')); ?>">
                                                            <?php endif; ?>
                                                        </div>

                                                        <div class="associations__view--grid-item-content">
                                                            <p>
                                                                <?php echo e(sectionValue($item, 'title')); ?>

                                                            </p>

                                                            <a href="<?php echo e(route('home', ['locale' => app()->getLocale(), 'any' => $currentPage->slug,'inside'=>request()->route('inside') ,'detail' => $item->slug])); ?>" class="btn-link">
                                                                Batafsil <i class="i-link"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>

                </div>
            </div>
            <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/associations/inside/index.blade.php ENDPATH**/ ?>