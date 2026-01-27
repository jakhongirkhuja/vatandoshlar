<?php $__env->startSection('body'); ?>
<?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
<div class="layout">
    <div class="container">
        <div class="layout-content">
            <div class="content">
                <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="content__text">
                    <?php echo sectionValue($item, 'description'); ?>

                </div>

                <div class="carousel carousel3 owl-carousel mb-3">
                    <?php if($item->children): ?>
                    <?php $__currentLoopData = $item->children; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $child): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if($mainImages = sectionImages($child)): ?>
                    <?php $__currentLoopData = $mainImages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $mainImage): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <a class="carousel__item video-card" href="<?php echo e(sectionValue($child, 'url')); ?>">
                        <div class="carousel__item--img">
                            <img src="<?php echo e($mainImage); ?>" alt="<?php echo e(sectionValue($child, 'title')); ?>">
                        </div>
                        <div class="carousel__item--content">
                            <p class="carousel__item--content-title line-clamp-2">
                                <?php echo e(sectionValue($child, 'title')); ?>

                            </p>
                            <p class="carousel__item--content-date">
                                <i class="i-calendar"></i>
                                <span><?php echo e($child->created_at->toDateString()); ?></span>
                            </p>
                        </div>
                    </a>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endif; ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endif; ?>
                </div>
                <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if($k == 0): ?>
                <div class="content__title primary">Fotogalareya</div>
                <div class="carousel carousel3center owl-carousel">
                    <?php if($mainImages = sectionImages($item)): ?>
                    <?php $__currentLoopData = $mainImages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $mainImage): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <a class="carousel__item" href="<?php echo e($mainImage); ?>">
                        <div class="carousel__item--img">
                            <img src="<?php echo e($mainImage); ?>" alt="<?php echo e(sectionValue($item, 'title')); ?>">
                        </div>
                    </a>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endif; ?>
                </div>
                <?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
        <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/pages/locations/inside/index.blade.php ENDPATH**/ ?>