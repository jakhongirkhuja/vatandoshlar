<?php $__env->startSection('body'); ?>
<?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
<?php
$sections = menuSections(30, 2);
?>

<div class="layout">
    <div class="container">
        <div class="layout-content">
            <?php

            $projects = $items->first();
            $projectVideo = sectionImages($projects, true);

            if(!$projectVideo){
            $projectVideo = asset('front/images/news_fallback.png');
            }
            $projectModalImage = sectionImages($projects, false);
            $currentSlug = request()->route('inside');

            $categories = menuSections(38, null, true, true) // limitni olib tashlaymiz
            ->reject(function ($item) use ($currentSlug) {
            return $item->slug === $currentSlug;
            })
            ->take(3);

            ?>

            <?php if($projects): ?>
            <div class="projects-hero">
                <div class="projects-hero__bg">

                    <img src="<?php echo e($projectVideo); ?>">

                </div>

                <div class="projects-hero__content">
                    <p style=" color: white;margin-bottom: 20px;"> <?php echo e(formatLocalizedDate(sectionValue($projects,
                        'last_date'),'date')); ?></p>
                    <h1 class="projects-hero__title">
                        <?php echo e(sectionValue($projects, 'title')); ?>

                    </h1>



                    <div class="projects-hero__wrapper">
                        <a data-bs-toggle="modal" data-bs-target="#ReqModel"
                            class="button projects-hero__wrapper--btn"><?php echo e(staticValue('requirements')); ?></a>
                        <a href="<?php echo e(route('home', ['locale' => app()->getlocale(), 'any' => request()->route('any'), 'inside' => $projects->slug, 'detail' => 'ariza-topshirish'])); ?>"
                            class="button projects-hero__wrapper--btn"><?php echo e(staticValue('Participate')); ?></a>
                    </div>

                    <a href="<?php echo e(sectionValue($projects, 'video')); ?>" class="projects-hero__btn" data-fancybox=" ">

                        <i class="i-play"></i>
                        <span><?php echo e(staticValue('video-play')); ?></span>
                    </a>
                </div>


            </div>
            <?php endif; ?>

            <div class="modal fade projects-requirement" id="ReqModel" tabindex="-1" aria-labelledby="ReqModelLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl">
                    <div class="modal-content projects-requirement__wrapper">
                        <div class="projects-requirement__wrapper--inner">
                            <div class="projects-requirement__content">
                                <h5 class="projects-requirement__content--title"><?php echo e(sectionValue($projects, 'content')); ?></h5>
                                <div class="projects-requirement__content--text">
                                    <?php echo sectionValue($projects, 'description1'); ?>

                                </div>

                                <!-- 
                                         -->
                                <div class="projects-requirement__content--buttons">
                                    <a href="<?php echo e(route('home', ['locale' => app()->getlocale(), 'any' => request()->route('any'), 'inside' => $projects->slug, 'detail' => 'ariza-topshirish'])); ?>"
                                        class="button"><?php echo e(staticValue('more')); ?></a>
                                    <button class="button" data-bs-dismiss="modal"><?php echo e(staticValue('cancel')); ?></button>
                                </div>
                            </div>
                            <div class="projects-requirement__img">
                                <?php if(!empty($projectModalImage) && isset($projectModalImage[0])): ?>
                                <img src="<?php echo e($projectModalImage[0]); ?>" alt="">
                                <?php endif; ?>
                            </div>
                        </div>
                        <button class="floating-close" data-bs-dismiss="modal">
                            <i class="i-close"></i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="projects-categories">

                <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="projects-categories__item">
                    <?php
                    $image = sectionImages($category, true);
                    ?>
                    <a
                        href="<?php echo e(route('home', ['locale' => app()->getLocale(), 'any' => request()->route('any'), 'inside' => $category->slug])); ?>">
                        <p class="line-clamp-1">
                            <?php echo e(sectionValue($category, 'title')); ?>

                        </p>
                        <img src="<?php echo e($image); ?>" alt="">
                    </a>
                </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>

            <div class="projects-video mb-4">
                <div class="section-top">
                    <p><?php echo e(staticValue('forum')); ?></p>
                </div>
                <div class="carousel carousel3 owl-carousel ">
                    <?php $__currentLoopData = $sections; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $section): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php
                    $mainImage = sectionImages($section);
                    ?>
                    <?php $__currentLoopData = $mainImage; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $src): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <a class="carousel__item video-card" data-fancybox="" href="<?php echo e($src); ?>">
                        <div class="carousel__item--img">
                            <img src="<?php echo e($src); ?>" alt="">
                        </div>
                        <div class="carousel__item--content">
                            <p class="carousel__item--content-title line-clamp-2">
                                <?php echo e(sectionValue($section, 'url_title')); ?>

                            </p>
                            <p class="carousel__item--content-date"><i class="i-calendar"></i><span>
                                    <?php echo e(date('d-m-Y', strtotime($section->publish_at))); ?></span>
                        </div>
                    </a>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
            <div class="projects-seasons">
                <div class="section-top">
                    <p><?php echo e(staticValue('project')); ?></p>
                </div>
                <div class="season-carousels">

                    <?php $__currentLoopData = $projects->children; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $projectYear): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="seasons-carousel <?php echo e($k == 0 ? 'active' : ''); ?>">
                        <?php
                        $srcc = sectionImages($projectYear, false);

                        ?>
                        <?php $__currentLoopData = $srcc; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $s => $sr): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                        <div class="seasons-carousel__item <?php echo e($s == 0 ? 'active' : 'close-next'); ?>">
                            <img src="<?php echo e($sr); ?>" alt="">
                        </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                    </div>


                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>


                </div>
                <div class="seasons-navigation">
                    <div class="seasons-nav-arrows">
                        <button class="season-prev-img btn-circle"><i class="i-prev"></i></button>
                        <button class="season-next-img btn-circle"><i class="i-next"></i></button>
                    </div>

                    <div class="seasons-year-selector">
                        <button class="season-prev-year btn-circle small"><i class="i-prev"></i></button>
                        <div class="current-year-text">

                            <?php $__currentLoopData = $projects->children; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $projectYear): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <button class="year-label <?php echo e($k == 0 ? 'active' : 'next'); ?>"><?php echo e(sectionValue(
                                $projectYear,
                                'title'
                                )); ?></button>

                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                        </div>
                        <button class="season-next-year btn-circle small"><i class="i-next"></i></button>
                    </div>
                </div>
            </div>
            <script>
                Fancybox.bind("[data-fancybox]", {
                    thumbs: false
                });
            </script>
            <script>
                (function () {
                    'use strict';

                    // Projects Seasons Carousel Logic
                    const seasonsCarousels = document.querySelectorAll('.seasons-carousel');
                    const yearLabels = document.querySelectorAll('.year-label');
                    const prevYearBtn = document.querySelector('.season-prev-year');
                    const nextYearBtn = document.querySelector('.season-next-year');
                    const prevImgBtn = document.querySelector('.season-prev-img');
                    const nextImgBtn = document.querySelector('.season-next-img');

                    let currentSeasonIndex = 0; // Start with the active season (2023)
                    let currentImageIndices = new Array(seasonsCarousels.length).fill(0); // Track image index for each season

                    // Update image positions within a carousel
                    function updateImagePositions(carouselIndex) {
                        const carousel = seasonsCarousels[carouselIndex];
                        if (!carousel) return;

                        const items = carousel.querySelectorAll('.seasons-carousel__item');
                        const currentIndex = currentImageIndices[carouselIndex];
                        const totalItems = items.length;

                        items.forEach((item, index) => {
                            // Remove all position classes
                            item.classList.remove('far-prev', 'close-prev', 'active', 'close-next', 'far-next');

                            // Calculate relative position from current active item
                            const relativePosition = (index - currentIndex + totalItems) % totalItems;

                            // Assign appropriate class based on relative position
                            if (relativePosition === 0) {
                                item.classList.add('active');
                            } else if (relativePosition === 1) {
                                item.classList.add('close-next');
                            } else if (relativePosition === 2) {
                                item.classList.add('far-next');
                            } else if (relativePosition === totalItems - 1) {
                                item.classList.add('close-prev');
                            } else if (relativePosition === totalItems - 2) {
                                item.classList.add('far-prev');
                            }
                        });
                    }

                    // Initialize carousel state
                    function initCarousel() {
                        // Initialize image positions for all carousels
                        seasonsCarousels.forEach((carousel, index) => {
                            updateImagePositions(index);
                        });
                        updateSeasonDisplay();
                        updateYearLabels();
                    }

                    // Update which season carousel is visible
                    function updateSeasonDisplay() {
                        seasonsCarousels.forEach((carousel, index) => {
                            carousel.classList.remove('active');
                            if (index === currentSeasonIndex) {
                                carousel.classList.add('active');
                            }
                        });
                    }

                    // Update year labels styling with carousel positioning
                    function updateYearLabels() {
                        const totalYears = yearLabels.length;

                        yearLabels.forEach((label, index) => {
                            label.classList.remove('active', 'close-prev', 'close-next', 'far-prev', 'far-next');

                            const relativePosition = (index - currentSeasonIndex + totalYears) % totalYears;

                            if (relativePosition === 0) {
                                label.classList.add('active');
                            } else if (relativePosition === 1) {
                                label.classList.add('close-next');
                            } else if (relativePosition === 2) {
                                label.classList.add('far-next');
                            } else if (relativePosition === totalYears - 1) {
                                label.classList.add('close-prev');
                            } else if (relativePosition === totalYears - 2) {
                                label.classList.add('far-prev');
                            }
                        });
                    }

                    // Navigate to previous season/year (infinite loop)
                    function goToPrevSeason() {
                        currentSeasonIndex = (currentSeasonIndex - 1 + seasonsCarousels.length) % seasonsCarousels.length;
                        updateSeasonDisplay();
                        updateYearLabels();
                    }

                    // Navigate to next season/year (infinite loop)
                    function goToNextSeason() {
                        currentSeasonIndex = (currentSeasonIndex + 1) % seasonsCarousels.length;
                        updateSeasonDisplay();
                        updateYearLabels();
                    }

                    // Navigate to previous image in current season
                    function goToPrevImage() {
                        const carousel = seasonsCarousels[currentSeasonIndex];
                        const items = carousel.querySelectorAll('.seasons-carousel__item');
                        const totalItems = items.length;

                        currentImageIndices[currentSeasonIndex] =
                            (currentImageIndices[currentSeasonIndex] - 1 + totalItems) % totalItems;

                        updateImagePositions(currentSeasonIndex);
                    }

                    // Navigate to next image in current season
                    function goToNextImage() {
                        const carousel = seasonsCarousels[currentSeasonIndex];
                        const items = carousel.querySelectorAll('.seasons-carousel__item');
                        const totalItems = items.length;

                        currentImageIndices[currentSeasonIndex] =
                            (currentImageIndices[currentSeasonIndex] + 1) % totalItems;

                        updateImagePositions(currentSeasonIndex);
                    }

                    // Navigate to specific season by clicking year label
                    function goToSeason(index) {
                        if (index >= 0 && index < seasonsCarousels.length) {
                            currentSeasonIndex = index;
                            updateSeasonDisplay();
                            updateYearLabels();
                        }
                    }

                    // Event listeners
                    if (prevYearBtn) {
                        prevYearBtn.addEventListener('click', goToPrevSeason);
                    }

                    if (nextYearBtn) {
                        nextYearBtn.addEventListener('click', goToNextSeason);
                    }

                    if (prevImgBtn) {
                        prevImgBtn.addEventListener('click', goToPrevImage);
                    }

                    if (nextImgBtn) {
                        nextImgBtn.addEventListener('click', goToNextImage);
                    }

                    // Year label click events
                    yearLabels.forEach((label, index) => {
                        label.addEventListener('click', () => goToSeason(index));
                    });

                    // Keyboard navigation
                    document.addEventListener('keydown', (e) => {
                        if (e.key === 'ArrowLeft') {
                            goToPrevImage();
                        } else if (e.key === 'ArrowRight') {
                            goToNextImage();
                        } else if (e.key === 'ArrowUp') {
                            goToPrevSeason();
                        } else if (e.key === 'ArrowDown') {
                            goToNextSeason();
                        }
                    });

                    // Touch/swipe and mouse drag support
                    let touchStartX = 0;
                    let touchEndX = 0;
                    let touchStartY = 0;
                    let touchEndY = 0;
                    let isDragging = false;

                    const seasonCarouselsContainer = document.querySelector('.season-carousels');

                    if (seasonCarouselsContainer) {
                        // Touch events for mobile
                        seasonCarouselsContainer.addEventListener('touchstart', (e) => {
                            touchStartX = e.changedTouches[0].clientX;
                            touchStartY = e.changedTouches[0].clientY;
                        }, { passive: true });

                        seasonCarouselsContainer.addEventListener('touchmove', (e) => {
                            touchEndX = e.changedTouches[0].clientX;
                            touchEndY = e.changedTouches[0].clientY;
                        }, { passive: true });

                        seasonCarouselsContainer.addEventListener('touchend', (e) => {
                            handleSwipe();
                        }, { passive: true });

                        // Mouse events for desktop drag
                        seasonCarouselsContainer.addEventListener('mousedown', (e) => {
                            isDragging = true;
                            touchStartX = e.clientX;
                            touchStartY = e.clientY;
                            seasonCarouselsContainer.style.cursor = 'grabbing';
                        });

                        seasonCarouselsContainer.addEventListener('mousemove', (e) => {
                            if (isDragging) {
                                touchEndX = e.clientX;
                                touchEndY = e.clientY;
                            }
                        });

                        seasonCarouselsContainer.addEventListener('mouseup', (e) => {
                            if (isDragging) {
                                handleSwipe();
                                isDragging = false;
                                seasonCarouselsContainer.style.cursor = 'grab';
                            }
                        });

                        seasonCarouselsContainer.addEventListener('mouseleave', (e) => {
                            if (isDragging) {
                                handleSwipe();
                                isDragging = false;
                                seasonCarouselsContainer.style.cursor = 'grab';
                            }
                        });

                        // Set initial cursor
                        seasonCarouselsContainer.style.cursor = 'grab';
                    }

                    function handleSwipe() {
                        const swipeThreshold = 50;
                        const diffX = touchStartX - touchEndX;
                        const diffY = touchStartY - touchEndY;

                        // Only trigger swipe if horizontal movement is greater than vertical
                        if (Math.abs(diffX) > Math.abs(diffY) && Math.abs(diffX) > swipeThreshold) {
                            if (diffX > 0) {
                                // Swipe left - next image
                                goToNextImage();
                            } else {
                                // Swipe right - previous image
                                goToPrevImage();
                            }
                        }

                        // Reset values
                        touchStartX = 0;
                        touchEndX = 0;
                        touchStartY = 0;
                        touchEndY = 0;
                    }

                    // Initialize on load
                    initCarousel();

                    // Optional: Auto-play functionality (uncomment if needed)
                    /*
                    let autoPlayInterval;
                    function startAutoPlay(interval = 3000) {
                        autoPlayInterval = setInterval(() => {
                            goToNextImage();
                        }, interval);
                    }

                    function stopAutoPlay() {
                        if (autoPlayInterval) {
                            clearInterval(autoPlayInterval);
                        }
                    }

                    // Start auto-play
                    startAutoPlay();

                    // Pause on hover
                    seasonCarouselsContainer.addEventListener('mouseenter', stopAutoPlay);
                    seasonCarouselsContainer.addEventListener('mouseleave', () => startAutoPlay());
                    */

                })();
            </script>
        </div> 
        <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    </div> 
</div> 
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/projects/inside/index.blade.php ENDPATH**/ ?>