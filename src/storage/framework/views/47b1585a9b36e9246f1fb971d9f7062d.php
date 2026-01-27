<?php $__env->startSection('body'); ?>

    <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

    <div class="layout">
        <div class="container">
            <div class="layout-content">

                
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css" />

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

                            <h4 class="text-2">
                                <?php echo sectionValue($item, 'description'); ?>

                            </h4>

                            <div class="text-wrapper">
                                <?php echo sectionValue($item, 'content'); ?>

                            </div>

                            <?php if(sectionValue($item, 'url')): ?>
                                <div class="iframe-text">

                                    <iframe width="560" height="315"
                                        src="<?php echo e(sectionValue($item, 'url')); ?>"
                                        title="<?php echo e(sectionValue($item, 'title')); ?>" frameborder="0"
                                        allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                        referrerpolicy="strict-origin-when-cross-origin"  height="550" allowfullscreen style="border-radius:12px;margin-bottom:20px; width: 100%;"></iframe>
                                    

                                    <div class="iframe-text--link">
                                        <a href="#">
                                            <i class="i-calendar"></i>
                                            <?php echo e($item->created_at->toDateString()); ?>

                                        </a>
                                        <a href="#">
                                            <i class="i-eye"></i><?php echo e($item->views()->count()); ?>

                                        </a>
                                    </div>

                                    <div class="iframe-text--line"></div>

                                    <div class="iframe-text--copy">
                                        <p>Bo’lishish</p>
                                        <div class="copy-flex">
                                            <button class="btn-copy">
                                                <i class="i-copy"></i>Copy link
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
                            <?php endif; ?>

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
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/pages/yangiliklar/inside/index.blade.php ENDPATH**/ ?>