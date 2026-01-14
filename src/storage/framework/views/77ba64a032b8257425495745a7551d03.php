<?php $__env->startSection('body'); ?>
    <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="content">
                    <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="content__title"><?php echo e(sectionValue($item, 'title')); ?></div>
                    <div class="content__text">
                        <?php echo e(sectionValue($item, 'description')); ?>

                    </div>
                    <div class="content__grid gtc-3">
                            <a class="content__grid--item video-card" data-fancybox="gallery" href="<?php echo e(sectionValue($item,'url')); ?>">
                                <div class="content__grid--item-img">
                                    <?php
                                        $mainImage = sectionImages($item, true);
                                    ?>
                                    <?php if($mainImage): ?>
                                        <img src="<?php echo e($mainImage); ?>" alt="<?php echo e(sectionValue($item, 'url_title')); ?>">
                                    <?php endif; ?>
                                </div>
                                <div class="content__grid--item-content">
                                    <p class="content__grid--item-content-title line-clamp-2">
                                        <?php echo e(sectionValue($item, 'url_title')); ?>

                                    </p>
                                </div>
                            </a>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                </div>
            </div>
               <script>
        Fancybox.bind("[data-fancybox]", {
           thumbs: false
        });
    </script>
            <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/histoday/index.blade.php ENDPATH**/ ?>