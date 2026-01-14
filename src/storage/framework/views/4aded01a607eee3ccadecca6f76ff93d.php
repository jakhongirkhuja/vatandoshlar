<?php $__env->startSection('body'); ?>
    <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="content">


                    <?php
                        $middleItem = $items->slice(-2, 1)->first();
                    ?>

                    <?php if($middleItem): ?>
                        <div class="content__text">
                            <strong><?php echo e(sectionValue($middleItem, 'title')); ?></strong>
                            <p><?php echo e(sectionValue($middleItem, 'description')); ?></p>

                            <div class="carousel carousel3center owl-carousel">
                                <?php
                                    $mainImage = sectionImages($middleItem);
                                ?>

                                <?php if($mainImage): ?>
                                    <?php $__currentLoopData = $mainImage; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $src): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <a href="<?php echo e(sectionValue($middleItem, 'url')); ?>" class="carousel__item">
                                            <div class="carousel__item--img">
                                                <img src="<?php echo e($src); ?>" alt="">
                                            </div>
                                        </a>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php endif; ?>
                            </div>
                        </div>
                    <?php endif; ?>


                    <div class="content__title primary">
                        <?php echo e(sectionValue($items[0], 'title')); ?>

                    </div>
                    <div class="carousel carousel3 owl-carousel">

                        <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php if($k >= 1 && $k >= count($items) - 2): ?>
                                <?php continue; ?>
                            <?php endif; ?>
                            <?php
                                $mainImage = sectionImages($item);
                            ?>

                            <?php if($mainImage): ?>
                                <?php $__currentLoopData = $mainImage; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $src): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <a href="<?php echo e(sectionValue($item, 'url')); ?>" data-fancybox
                                        class="carousel__item video-card">
                                        <div class="carousel__item--img">
                                            <img src="<?php echo e($src); ?>" alt="">
                                        </div>
                                        <div class="carousel__item--content">
                                            <p class="carousel__item--content-title line-clamp-2">
                                                <?php echo e(sectionValue($item, 'url_title')); ?>

                                            </p>
                                            <p class="carousel__item--content-date">
                                                <i class="i-calendar"></i>
                                                <span><?php echo e($item->created_at->toDateString()); ?></span>
                                            </p>
                                        </div>
                                    </a>

                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>



                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                    <script>
                        Fancybox.bind("[data-fancybox]", {
                         thumbs: false
                        });
                    </script>
                    <?php
                        $lastItem = $items->last();
                    ?>

                    <?php if($lastItem): ?>
                        <div class="content__text">
                            <strong><?php echo e(sectionValue($lastItem, 'title')); ?></strong>
                            <p><?php echo e(sectionValue($lastItem, 'description')); ?></p>

                            <div class="carousel carousel3center owl-carousel">
                                <?php
                                    $mainImage = sectionImages($lastItem);
                                ?>

                                <?php if($mainImage): ?>
                                    <?php $__currentLoopData = $mainImage; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $src): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <a href="<?php echo e(sectionValue($lastItem, 'url')); ?>" class="carousel__item">
                                            <div class="carousel__item--img">
                                                <img src="<?php echo e($src); ?>" alt="">
                                            </div>
                                        </a>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php endif; ?>
                            </div>
                        </div>
                    <?php endif; ?>

                </div>
            </div>

            <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/bosh_sahifa/index.blade.php ENDPATH**/ ?>