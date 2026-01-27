<?php $__env->startSection('body'); ?>

    <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

    <div class="layout">
        <div class="container">
            <div class="layout-content">

                
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css"/>

                <div class="news-view">
                    <div class="news-view--main">

                        <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                            <h2 class="text">
                                <?php echo e(sectionValue($item, 'title')); ?>

                            </h2>

                            
                            <div class="swiper mySwiper">
                                <div class="swiper-wrapper">

                                    <?php
                                        $images = sectionImages($item);
                                    ?>

                                    <?php if(!empty($images)): ?>
                                        <?php $__currentLoopData = $images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <div class="swiper-slide">
                                                <img src="<?php echo e($image); ?>" alt="<?php echo e(sectionValue($item, 'title')); ?>">
                                            </div>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    <?php else: ?>
                                        <?php

                                $mainImage = asset('front/images/news_fallback.png');

                                     ?>
                                        <div class="swiper-slide">
                                            <img src="<?php echo e($mainImage); ?>" alt="<?php echo e(sectionValue($item, 'title')); ?>">
                                        </div>
                                    <?php endif; ?>


                                </div>

                                <div class="swiper-button-next">
                                    <i class="i-next"></i>
                                </div>
                                <div class="swiper-button-prev">
                                    <i class="i-prev"></i>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>


                            <div class="text-wrapper">
                                <?php echo sectionValue($item, 'description'); ?>

                            </div>

                            <div class="iframe-text mt-3">
                                <style>
                                    .custom_style_p{
                                        display:flex;
                                        align-items: center;
                                        color: #98a2b3;
                                        font-size: 16px;
                                        font-weight: 500;
                                        gap: 4px;
                                    }
                                </style>

                                <div class="iframe-text--link">
                                    <p class="custom_style_p">
                                        <i class="i-calendar"></i>
                                        <?php echo e(date('Y-m-d', strtotime($item->publish_at))); ?>


                                    </p>
                                    <p class="custom_style_p">
                                        <i class="i-eye"></i><?php echo e($item->views()->count()); ?>

                                    </p>
                                </div>

                                <div class="iframe-text--line"></div>

                                <div class="iframe-text--copy">
                                    <p><?php echo e(staticValue('share')); ?></p>
                                    <div class="copy-flex">
                                        <button class="btn-copy">
                                            <i class="i-copy"></i><?php echo e(staticValue('copy')); ?>

                                        </button>
                                        <button class="btn-ilova">
                                            <i class="i-telegram"></i>
                                        </button>
                                        <button class="btn-ilova">
                                            <i class="i-facebook"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>

                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.js"></script>
                <script>
                    var swiper = new Swiper(".mySwiper", {
                        spaceBetween: 30,
                        centeredSlides: true,
                        autoplay: {
                            delay: 2500,
                            disableOnInteraction: false,
                        },
                        pagination: {
                            el: ".swiper-pagination",
                            clickable: true,
                        },
                        navigation: {
                            nextEl: ".swiper-button-next",
                            prevEl: ".swiper-button-prev",
                        },
                    });
                </script>

            </div>
            <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        </div>
    </div>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/pages/news/inside/index.blade.php ENDPATH**/ ?>