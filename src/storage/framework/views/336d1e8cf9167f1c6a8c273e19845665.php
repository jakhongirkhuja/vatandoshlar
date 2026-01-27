<?php $__env->startSection('body'); ?>
<?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

<div class="layout">
    <div class="container">
        <div class="layout-content">

            <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if($k != 2): ?>
                <div class="content">
                    <div class="<?php echo e($k == 4 ? 'content__title text-center' : 'content__text'); ?> ">
                        <?php if($k != 0 && $k != 2): ?>
                        <?php if($k == 4): ?>
                        <?php echo e(sectionValue($item, 'title')); ?>

                        <?php else: ?>
                        <strong><?php echo e(sectionValue($item, 'title')); ?></strong>
                        <?php endif; ?>

                        <?php endif; ?>

                        <?php echo sectionValue($item, 'description'); ?>


                    </div>
                    <?php
                    $image = sectionImages($item, true);
                    ?>
                    <?php if($image): ?>
                    <div class="about__page">
                        <div class="about__page--img">
                            <img src="<?php echo e($image); ?>" alt="">
                        </div>
                    </div>
                    <?php endif; ?>
                    <?php if(sectionValue($item, 'content')): ?>
                    <div class="content__text"><?php echo e(sectionValue($item, 'content')); ?></div>
                    <?php endif; ?>

                    <?php
                    $images = sectionImages($item);
                    ?>
                    <?php if($images && count($images) > 1): ?>
                        <div class="carousel carousel3center owl-carousel">
                            <?php $__currentLoopData = $images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $img): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <a class="carousel__item" href="#">
                                <div class="carousel__item--img">
                                    <img src="<?php echo e($img); ?>" alt="">
                                </div>
                            </a>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    <?php endif; ?>

                </div>
                <?php else: ?>
                <a href="<?php echo e(sectionValue($item,'url')); ?>" class="about__page--video" data-fancybox="gallery">
                    <?php
                    $image = sectionImages($item, true);
                    ?>
                    <img src="<?php echo e($image); ?>" alt="">
                    <div class="play">
                        <img src="<?php echo e(asset('front')); ?>/images/play2.svg" class="i-play about__play--button" alt="">
                    </div>
                </a>
                <?php endif; ?>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>

        <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const dropdownItems = document.querySelectorAll('.sidebar__list--item.has-dropdown');

                dropdownItems.forEach(item => {
                    const button = item.querySelector('.sidebar__button');
                    const dropdown = item.querySelector('.sidebar__dropdown');

                    if (button) {
                        button.addEventListener('click', function (e) {
                            e.preventDefault();

                            // Toggle current item
                            item.classList.toggle('open');

                            // Close other dropdowns
                            dropdownItems.forEach(otherItem => {
                                if (otherItem !== item) {
                                    otherItem.classList.remove('open');
                                }
                            });
                        });
                    }
                });
            });
        </script>
    </div>
</div>
<script>
    Fancybox.bind("[data-fancybox]", {
        thumbs: false
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/pages/about/index.blade.php ENDPATH**/ ?>