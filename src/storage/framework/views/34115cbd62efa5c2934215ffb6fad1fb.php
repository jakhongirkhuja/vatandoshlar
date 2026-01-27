<?php $__env->startSection('body'); ?>
    <?php
        $heroSection = menuSections(35, 1)->first();
        $heroVideo = null;
        if($heroSection){
        $heroVideo = sectionImages($heroSection, true);
        }



    ?>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const header = document.querySelector('.header');
            if (!header) return;

            function onScroll() {
                header.classList.toggle('light', window.scrollY <= 30);
            }

            onScroll();
            window.addEventListener('scroll', onScroll);
        });

    </script>
    <?php if($heroSection): ?>
        <section class="hero">
            <div class="hero__bg">
                <?php if($heroVideo): ?>
                    <video class="hero__video" width="100%" height="100%" muted loop autoplay src="<?php echo e($heroVideo); ?>"
                           type="video/mp4"></video>
                <?php endif; ?>
            </div>

            <div class="hero__content container">
                <h1 class="hero__title">
                    <?php echo e(sectionValue($heroSection, 'title')); ?>

                </h1>

                <a href="<?php echo e(url(app()->getLocale().'/'.staticValue('more','url'))); ?>" class="hero__btn">
                    <i class="i-arrow"></i>
                    <span><?php echo e(staticValue('more')); ?></span>
                </a>
            </div>
        </section>
    <?php endif; ?>

    <div class="layout-index">

        <?php
            $data = menuSections(2, 1);
        ?>

        <section class="about-section">
            <div class="container">
                <ul class="about-section__left">
                    <?php $__currentLoopData = linkData(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $link): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li class="about-section__left-item">
                            <a class="about-section__left--link" href="<?php echo e($link->url); ?>" target="_blank"
                               rel="noopener noreferrer">

                                <i class="<?php echo e($link->icon); ?>"></i>

                            </a>
                        </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ul>
                <div class="about-section__middle">
                    <div class="about-section__middle--logo">
                        <img src="<?php echo e(asset('front')); ?>/images/logo.png" alt="">
                        <h2><?php echo sectionValue($data[0], 'title'); ?></h2>
                    </div>
                    <div class="about-section__middle--content">
                        <p class="about-section__middle--content-text"><?php echo e(sectionValue($data[0], 'description')); ?>

                        </p>

                        <div class="about-section__middle--content-video">
                            <a href="<?php echo e($heroVideo); ?>" target="_blank" rel="noopener noreferrer" data-fancybox>
                                <?php if($heroVideo): ?>
                                    <video class="hero-video" src="<?php echo e($heroVideo); ?>" loop autoplay muted></video>
                                <?php endif; ?>
                            </a>
                            <img src="<?php echo e(asset('front')); ?>/images/play2.svg" class="i-play about__play--button" alt="">
                        </div>
                    </div>
                </div>
                <ul class="about-section__right">
                    <li class="about-section__right--item">
                        <a href="#" class="about-section__right--link">
                            <img src="<?php echo e(asset('front')); ?>/images/uz-flag.png" alt="">
                        </a>
                    </li>
                    <li class="about-section__right--item">
                        <a href="#" class="about-section__right--link">
                            <img src="<?php echo e(asset('front')); ?>/images/uz-emblem.png" alt="">
                        </a>
                    </li>
                    <li class="about-section__right--item">
                        <a href="#" class="about-section__right--link">
                            <img src="<?php echo e(asset('front')); ?>/images/uz-hymn.png" alt="">
                        </a>
                    </li>

                </ul>
            </div>
        </section>

        <script>
            const video = document.querySelector('.hero-video');
            const aboutSection = document.querySelector('.about-section');
            const playButton = document.querySelector('.about__play--button');
            const anim = video.animate(
                [
                    {
                        width: '100vw',
                        height: '100dvh',
                        maxWidth: '100vw',
                        maxHeight: '100dvh',
                        bottom: '0px',
                        top: 'auto',
                        borderRadius: '0px'
                    },
                    {
                        transform: 'translate(-65%, 0)',
                    },
                    {
                        width: '400px',
                        height: 'auto',
                        bottom: '162.5px',
                        top: 'auto',
                        maxWidth: 'calc(100vw - 64px)',
                        maxHeight: '250px',
                        borderRadius: '20px'
                    }
                ],
                {
                    duration: 1000,
                    easing: 'ease',
                    fill: 'both'
                }
            );

            anim.pause();

            function setProgress(p) {
                const clamped = Math.max(0, Math.min(1, p));
                anim.currentTime = clamped * 1000;
                // console.log('Progress:', clamped.toFixed(2), 'CurrentTime:', anim.currentTime.toFixed(1));
            }

            window.addEventListener('scroll', () => {
                const sectionTop = aboutSection.offsetTop;
                const scrollFraction = (window.scrollY - sectionTop) / (aboutSection.clientHeight - window.innerHeight);
                setProgress(Math.min(Math.max(scrollFraction, 0), 1));

                //console.log('ScrollY:', window.scrollY, 'Section Height:', aboutSection.clientHeight, 'Scroll Fraction:', scrollFraction.toFixed(2));
                // Make video static when animation completes
                if (scrollFraction >= 1) {
                    video.style.position = 'static';
                    video.style.transform = 'none';
                    video.pause();
                    playButton.style.display = 'flex';
                    video.style.filter = "opacity(0.5) saturation(0.5)";

                } else {
                    video.style.position = 'fixed';
                    video.style.transform = 'translate(-50%, 0)';
                    video.play();
                    playButton.style.display = 'none';
                    video.style.filter = "none";
                }
            });

        </script>

        <?php
            $menuItself = menuSection(26);
            $newsSections = menuSections(26, 4, false);
        ?>

        <section class="news-section">
            <div class="container">
                <div class="section-top">
                    <p><?php echo e(staticValue('news')); ?></p>
                    <a href="<?php echo e(route('home', ['locale' => app()->getlocale(), 'any' => $menuItself->slug])); ?>"><?php echo e(staticValue('all')); ?>

                        <i
                                class="i-link"></i></a>

                </div>

                <div class="news-section__wrapper">
                    
                    <?php if($newsSections->first()): ?>
                        <?php
                            $main = $newsSections->first();
                            $mainImage = sectionImages($main, true);
                             if(!$mainImage){
                                    $mainImage = asset('front/images/news_fallback.png');
                                }
                        ?>
                        <a href="<?php echo e(route('home', ['locale' => app()->getlocale(), 'any' => $menuItself->slug, 'inside' => $main->slug])); ?>"
                           class="news-section__item main">
                            <?php if($mainImage): ?>
                                <img src="<?php echo e($mainImage); ?>" alt="<?php echo e(sectionValue($main, 'title')); ?>">
                            <?php endif; ?>

                            <div class="news-section__item--content">
                                <h3 class="news-section__item--content-title line-clamp-2 no-tooltip">
                                    <?php echo e(sectionValue($main, 'title')); ?>

                                </h3>

                                <div class="news-section__item--content-date">
                                    <?php echo e(date('d-m-Y', strtotime($main->publish_at))); ?>

                                </div>
                            </div>
                        </a>
                    <?php endif; ?>

                    
                    <div class="news-section__list">
                        <?php $__currentLoopData = $newsSections->skip(1); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $news): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php
                                $img = sectionImages($news, true);
                                if(!$img){
                                    $img = asset('front/images/news_fallback.png');
                                }
                            ?>

                            <a href="<?php echo e(route('home', ['locale' => app()->getlocale(), 'any' => $menuItself->slug, 'inside' => $news->slug])); ?>"
                               class="news-section__item">
                                <?php if($img): ?>
                                    <div class="news-section__item--img">
                                        <img src="<?php echo e($img); ?>" alt="<?php echo e(sectionValue($news, 'title')); ?>">
                                    </div>
                                <?php endif; ?>

                                <div class="news-section__item--content">
                                    <h3 class="news-section__item--content-title line-clamp-2 no-tooltip">
                                        <?php echo e(sectionValue($news, 'title')); ?>

                                    </h3>

                                    <div class="news-section__item--content-date">
                                        <?php echo e(date('d-m-Y', strtotime($news->publish_at))); ?>

                                    </div>
                                </div>
                            </a>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                </div>
            </div>
        </section>
        <section class="projects">
            <div class="container">
                <div class="section-top">
                    <p><?php echo e(staticValue('projects')); ?></p>
                    <?php
                        $projectItself = menuSection(38);
                        $projects = menuSections(38, 6, true, true);
                    ?>
                    <a href="<?php echo e(route('home', [
    'locale' => app()->getLocale(),
    'any' => $projectItself->slug
])); ?>"><?php echo e(staticValue('all')); ?><i class="i-link"></i></a>
                </div>

                <div class="projects__grid">
                    <?php $__currentLoopData = $projects; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $project): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                        <a href="<?php echo e(route('home', [
                    'locale' => app()->getLocale(),
                    'any' => $projectItself->slug,
                    'inside' => $project->slug
                ])); ?>" class="projects__grid--item">
                            <div class="projects__grid--item-img">
                                <?php
                                    $src = sectionImages($project, true);
                                ?>
                                <img src="<?php echo e($src); ?>" alt="">
                            </div>
                            <h3 class="projects__grid--item-title"><?php echo e(sectionValue($project, 'title')); ?>

                            </h3>
                        </a>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/gsap@3.14.1/dist/gsap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/gsap@3.14.1/dist/ScrollTrigger.min.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const pressLeft = document.querySelector(".press__left");
                const mainImg = document.querySelector(".press__left--img img");
                const patternImg = document.querySelector(".press__left > img");

                if (!pressLeft || !mainImg || !patternImg) return;

                // Set 3D perspective on parent
                gsap.set(pressLeft, {
                    perspective: 1000,
                    transformStyle: "preserve-3d"
                });

                gsap.set([mainImg, patternImg], {
                    transformStyle: "preserve-3d",
                    transformOrigin: "center center"
                });

                // Create smooth quickTo animations for main image
                const mainRX = gsap.quickTo(mainImg, "rotationX", {duration: 0.6, ease: "power2.out"});
                const mainRY = gsap.quickTo(mainImg, "rotationY", {duration: 0.6, ease: "power2.out"});
                const mainZ = gsap.quickTo(mainImg, "z", {duration: 0.6, ease: "power2.out"});
                const mainScale = gsap.quickTo(mainImg, "scale", {duration: 0.4, ease: "power2.out"});

                // Create smooth quickTo animations for pattern image (with different intensity)
                const patternRX = gsap.quickTo(patternImg, "rotationX", {duration: 0.8, ease: "power2.out"});
                const patternRY = gsap.quickTo(patternImg, "rotationY", {duration: 0.8, ease: "power2.out"});
                const patternZ = gsap.quickTo(patternImg, "z", {duration: 0.8, ease: "power2.out"});
                const patternX = gsap.quickTo(patternImg, "x", {duration: 0.8, ease: "power2.out"});
                const patternY = gsap.quickTo(patternImg, "y", {duration: 0.8, ease: "power2.out"});

                pressLeft.addEventListener("pointermove", (e) => {
                    const rect = pressLeft.getBoundingClientRect();
                    const x = (e.clientX - rect.left) / rect.width;
                    const y = (e.clientY - rect.top) / rect.height;

                    // Center-based coordinates (-0.5 to 0.5)
                    const centerX = x - 0.5;
                    const centerY = y - 0.5;

                    // Main image - stronger 3D effect
                    mainRY(centerX * 20);
                    mainRX(-centerY * 20);
                    mainZ(30);
                    mainScale(1.05);

                    // Pattern image - subtle parallax effect (moves in opposite direction)
                    patternRY(centerX * 5);
                    patternRX(-centerY * 5);
                    patternZ(-20);
                    patternX(centerX * 40);
                    patternY(centerY * 40);
                });

                pressLeft.addEventListener("pointerleave", () => {
                    // Reset main image
                    mainRX(0);
                    mainRY(0);
                    mainZ(0);
                    mainScale(1);

                    // Reset pattern image
                    patternRX(0);
                    patternRY(0);
                    patternZ(0);
                    patternX(0);
                    patternY(0);
                });
            });

        </script>

        <section class="press">
            <div class="container">
                <div class="section-top">
                    <p><?php echo e(staticValue('newspapers')); ?></p>
                    <?php
                        $newsp = menuSection(46);
                        $newspapers = menuSections(46, 3, false)
                    ?>
                    <a href="<?php echo e(route('home', ['locale' => app()->getLocale(), 'any' => $newsp->slug])); ?>"><?php echo e(staticValue('all')); ?>

                        <i
                                class="i-link"></i></a>
                </div>
                <div class="press__wrapper">
                    <div class="press__left">
                        <div class="press__left--img">
                            <img src="<?php echo e(asset('front')); ?>/images/press-main.jpg" width="330" alt="">
                        </div>

                        <img src="<?php echo e(asset('front')); ?>/images/press-pattern.svg" alt="">
                    </div>
                    <div class="press__right">
                        <?php $__currentLoopData = $newspapers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $newspaper): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <a href="<?php echo e(route('home', ['locale' => app()->getLocale(), 'any' => $newsp->slug, 'inside' => $newspaper->slug])); ?>"
                               class="press__right--item">
                                <p><?php echo e(sectionValue($newspaper, 'title')); ?></p>
                                <span>Batafsil <i class="i-link"></i></span>
                            </a>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                    </div>
                </div>
        </section>
        <section class="stats">
            <div class="container">
                <div class="section-top">
                    <p><?php echo e(staticValue('statisctic')); ?> </p>
                </div>

                <div class="stats__grid">
                    <?php $__currentLoopData = menuSections(3, 6, false); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $stat): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="stats__grid--item">
                            <div class="stats__grid--item-img">
                                <img src="<?php echo e(sectionValue($stat, 'image')
                ? Storage::url(sectionValue($stat, 'image'))
                : asset('front/images/stats-img-' . ($i + 1) . '.svg')); ?>" alt="<?php echo e(sectionValue($stat, 'title')); ?>">
                            </div>
                            <h3 class="stats__grid--item-title" data-count="<?php echo e(sectionValue($stat, 'number', 0)); ?>">
                                0+
                            </h3>
                            <p class="stats__grid--item-subtitle">
                                <?php echo e(sectionValue($stat, 'title', 'Qatnashgan vatandoshlar soni')); ?>

                            </p>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        </section>
        <?php
            $volunteers = menuSections(45, 9, false, true); // hammasini oling
            $vol1 = $volunteers->get(0);
            $vol2 = $volunteers->get(1);
            $vol3 = $volunteers->get(2);
            $vol4 = $volunteers->get(3);
            $vol5 = $volunteers->get(4);
            $vol6 = $volunteers->get(5);
            $vol7 = $volunteers->get(6);
            $vol8 = $volunteers->get(7);
            $vol9 = $volunteers->get(8);
        ?>

        <section class="volunteers">
            <div class="container">
                <div class="section-top">
                    <p><?php echo e(staticValue('volunteers')); ?></p>
                    <a href="#"><?php echo e(staticValue('all')); ?><i class="i-link"></i></a>
                </div>

                <div class="volunteers__wrapper">
                    <div class="volunteers__left">
                        <div class="volunteers__left-left">
                            <div class="item">
                                <img src="<?php echo e(sectionImages($vol1, true)); ?>" alt="">
                            </div>
                            <div class="volunteers__left-left-bottom">
                                <div class="item">
                                    <img src="<?php echo e(sectionImages($vol2, true)); ?>" alt="">
                                </div>
                                <div class="item">
                                    <img src="<?php echo e(sectionImages($vol3, true)); ?>" alt="">
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <img src="<?php echo e(sectionImages($vol4, true)); ?>" alt="">
                        </div>
                    </div>

                    <div class="volunteers__right">
                        <div class="volunteers__right-left">
                            <div class="item">
                                <img src="<?php echo e(sectionImages($vol5, true)); ?>" alt="">
                            </div>
                            <div class="item">
                                <img src="<?php echo e(sectionImages($vol6, true)); ?>" alt="">
                            </div>
                        </div>

                        <div class="volunteers__right-right">
                            <div class="volunteers__right-right-top">
                                <div class="item">
                                    <img src="<?php echo e(sectionImages($vol7, true)); ?>" alt="">
                                </div>
                                <div class="item">
                                    <img src="<?php echo e(sectionImages($vol8, true)); ?>" alt="">
                                </div>
                            </div>

                            <div class="item">
                                <img src="<?php echo e(sectionImages($vol9, true)); ?>" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="president">
            <div class="container">
                <?php
                    $presidentSections = menuSections(4, 1);
                    $item = $presidentSections->first();
                ?>
                <div class="section-top">
                    <p> “<?php echo e(sectionValue($item, 'title')); ?>” </p>
                </div>
                <div class="president__wrapper">
                    <?php if($item): ?>
                        <div class="president__right">
                            <p class="president__right--text">
                                “<?php echo e(sectionValue($item, 'content')); ?>”
                            </p>
                            <p class="president__right--name">
                                — <?php echo e(sectionValue($item, 'description')); ?>

                            </p>
                            <span class="president__right--position">
                        <?php echo e(sectionValue($item, 'content1')); ?>

                    </span>
                        </div>
                        <div class="president__left">
                            <img src="<?php echo e(sectionImages($item, true)); ?>" width="520"
                                 alt="<?php echo e(sectionValue($item, 'title')); ?>">
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </section>
        <section class="social">
            <div class="container">
                <div class="section-top">
                    <p><?php echo e(staticValue('knowledge')); ?> </p>
                </div>
                <?php
                    $socials = menuSections(47,2);
                    $social1 = isset($socials[0])? $socials[0] : null;
                    $social2 = isset($socials[1])? $socials[1] : null;
                ?>

                <div class="social__wrapper">
                    <?php if($social1): ?>
                    <div class="social__card">
                        <div class="social__card--content">

                            <h6><?php echo e(sectionValue($social1,'title')); ?></h6>
                            <p><?php echo e(sectionValue($social1,'description')); ?></p>
                            <div class="d-flex align-items-center gap-2">
                                <a class="link" href="<?php echo e(sectionValue($social1,'link1')); ?>" target="_blank"><img
                                            src="<?php echo e(asset('front')); ?>/images/appstore.svg" alt=""></a>
                                <a class="link" href="<?php echo e(sectionValue($social1,'link2')); ?>" target="_blank"><img
                                            src="<?php echo e(asset('front')); ?>/images/googleplay.svg" alt=""></a>
                            </div>
                        </div>
                        <div class="social__card--img">
                            <?php
                                $image = sectionImages($social1, true);
                            ?>
                            <img src="<?php echo e($image); ?>" width="280" alt="">
                        </div>
                    </div>
                    <?php endif; ?>
                        <?php if($social2): ?>
                    <div class="social__card">
                        <div class="social__card--content">
                            <h6><?php echo e(sectionValue($social2,'title')); ?></h6>
                            <p><?php echo e(sectionValue($social2,'description')); ?></p>
                            <a class="button" href="<?php echo e(sectionValue($social2,'link1')); ?>"
                               target="_blank"><?php echo e(staticValue('keyboard')); ?></a>
                        </div>
                        <div class="social__card--img">
                            <?php
                                $imagesFalse = sectionImages($social2, true);

                            ?>
                            <img src="<?php echo e($imagesFalse); ?>" width="280" alt="">
                        </div>
                    </div>
                        <?php endif; ?>
                </div>
        </section>
        <section class="links">
            <div class="container">
                <div class="section-top">
                    <p><?php echo e(staticValue('podcasts')); ?></p>
                    <!-- <a href="#"><?php echo e(staticValue('all')); ?><i class="i-link"></i></a> -->
                </div>
            </div>

            <div class="links__carousel owl-carousel">
                <?php
                    $podcasts = menuSections(52, 4);
                ?>

                <?php $__currentLoopData = $podcasts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $podcast): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php
                        $images = sectionImages($podcast); // array kutiladi
                    ?>

                    <a class="slide" href="<?php echo e(sectionValue($podcast,'url')); ?>" target="_blank">
                        <div class="slide__images">
                            <?php if(isset($images[0])): ?>
                                <img class="active" src="<?php echo e($images[0]); ?>" alt="<?php echo e(sectionValue($podcast,'title')); ?>">
                            <?php endif; ?>

                            <?php if(isset($images[1])): ?>
                                <img class="after" src="<?php echo e($images[1]); ?>" alt="<?php echo e(sectionValue($podcast,'title')); ?>">
                            <?php endif; ?>

                            <?php if(isset($images[2])): ?>
                                <img class="before" src="<?php echo e($images[2]); ?>" alt="<?php echo e(sectionValue($podcast,'title')); ?>">
                            <?php endif; ?>
                        </div>

                        <div class="wrapper">
                            <p class="title"><?php echo e(sectionValue($podcast,'title')); ?></p>
                            <span><?php echo e(sectionValue($podcast,'description')); ?></span>
                        </div>
                    </a>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </section>

        <div class="library__section">
            <div class="container">
                <div class="library__section--wrapper">
                    <div class="library__section--left">
                        <div class="library__section--logo">
                            <?php
                                $library = menuSections(51)->first();
                                $images = sectionImages($library);
                            ?>

                            <?php if($library && is_array($images)): ?>
                                <?php $__currentLoopData = $images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <img src="<?php echo e($image); ?>" alt="<?php echo e(sectionValue($library,'title')); ?>">
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                        </div>



                        <h4 class="library__section--title"><?php echo sectionValue($library,'title'); ?></h4>
                        <p class="library__section--text">
                            <?php echo e(sectionValue($library,'description')); ?>

                        </p>
                        <a class="button library__section--link" href="<?php echo e(sectionValue($library,'url')); ?>" target="_blank"><?php echo e(sectionValue($library,'url_title')); ?></a>
                    </div>
                    <?php
                        $libraryBooks = menuSections(50, 3, false);
                    ?>
                    <div class="library__section--right">
                        
                        <div class="carousel library-carousel1">
                            <?php for($i = 0; $i < 2; $i++): ?>
                                <?php $__currentLoopData = $libraryBooks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php $image=sectionImages($item, true);
                                    ?> <img src="<?php echo e($image); ?>" alt="">
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endfor; ?>
                        </div>

                        
                        <div class="carousel library-carousel2">
                            <?php for($i = 0; $i < 2; $i++): ?>
                                <?php $__currentLoopData = $libraryBooks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php $image=sectionImages($item, true);
                                    ?> <img src="<?php echo e($image); ?>" alt="">
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endfor; ?>
                        </div>

                        
                        <div class="carousel library-carousel3">
                            <?php for($i = 0; $i < 2; $i++): ?>
                                <?php $__currentLoopData = $libraryBooks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php $image=sectionImages($item, true);
                                    ?> <img src="<?php echo e($image); ?>" alt="">
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endfor; ?>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <script>
            const setCarouselVars = () => {
                document.querySelectorAll(".library__section--right").forEach(c => {
                    c.style.setProperty("--c-width", `${c.offsetWidth}px`)
                    // console.log(c.offsetWidth);
                })
            }
            setCarouselVars();
            window.addEventListener("DOMContentLoaded", setCarouselVars)
            window.addEventListener("resize", setCarouselVars)
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const contactLeft = document.querySelector(".contacts__left");
                const contactMainImg = document.querySelector(".contacts__left--img img");
                const contactImg = document.querySelector(".contacts__left img");

                if (!contactLeft || !contactMainImg || !contactImg) return;

                // Set 3D perspective on parent
                gsap.set(contactLeft, {
                    perspective: 1000,
                    transformStyle: "preserve-3d"
                });

                gsap.set([contactMainImg, contactImg], {
                    transformStyle: "preserve-3d",
                    transformOrigin: "center center"
                });

                // Create smooth quickTo animations forcontactMain image
                const contactMainRX = gsap.quickTo(contactMainImg, "rotationX", {duration: 0.6, ease: "power2.out"});
                const contactMainRY = gsap.quickTo(contactMainImg, "rotationY", {duration: 0.6, ease: "power2.out"});
                const contactMainZ = gsap.quickTo(contactMainImg, "z", {duration: 0.6, ease: "power2.out"});
                const contactMainScale = gsap.quickTo(contactMainImg, "scale", {duration: 0.4, ease: "power2.out"});

                // Create smooth quickTo animations for contact image (with different intensity)
                const contactRX = gsap.quickTo(contactImg, "rotationX", {duration: 0.8, ease: "power2.out"});
                const contactRY = gsap.quickTo(contactImg, "rotationY", {duration: 0.8, ease: "power2.out"});
                const contactZ = gsap.quickTo(contactImg, "z", {duration: 0.8, ease: "power2.out"});
                const contactX = gsap.quickTo(contactImg, "x", {duration: 0.8, ease: "power2.out"});
                const contactY = gsap.quickTo(contactImg, "y", {duration: 0.8, ease: "power2.out"});

                contactLeft.addEventListener("pointermove", (e) => {
                    const rect = contactLeft.getBoundingClientRect();
                    const x = (e.clientX - rect.left) / rect.width;
                    const y = (e.clientY - rect.top) / rect.height;

                    // Center-based coordinates (-0.5 to 0.5)
                    const centerX = x - 0.5;
                    const centerY = y - 0.5;

                    // contactMain image - stronger 3D effect
                    contactMainRY(centerX * 20);
                    contactMainRX(-centerY * 20);
                    contactMainZ(30);
                    contactMainScale(1.05);

                    // contact image - subtle parallax effect (moves in opposite direction)
                    contactRY(centerX * 5);
                    contactRX(-centerY * 5);
                    contactZ(-20);
                    contactX(centerX * 40);
                    contactY(centerY * 40);
                });

                contactLeft.addEventListener("pointerleave", () => {
                    // Reset contactMain image
                    contactMainRX(0);
                    contactMainRY(0);
                    contactMainZ(0);
                    contactMainScale(1);

                    // Reset contact image
                    contactRX(0);
                    contactRY(0);
                    contactZ(0);
                    contactX(0);
                    contactY(0);
                });
            });

        </script>
        <section class="contacts">
            <div class="container">
                <div class="contacts__wrapper">
                    <div class="contacts__right">
                        <h5><?php echo e(staticValue('platform')); ?></h5>
                        <p><?php echo e(staticValue('platform', 'content')); ?></p>
                        <div class="contacts__right--wrapper">
                            <?php if(staticValue('button1')): ?>
                                <a class="button"
                                   href="<?php echo e(route('home', ['locale' => app()->getlocale(), 'any' => 'contacts'])); ?>"><?php echo e(staticValue('button1')); ?></a>
                            <?php endif; ?>
                            <a class="link" data-fancybox=" gallery" href="<?php echo e(staticValue('video_l', 'url')); ?>"><i
                                        class="i-play"></i><span><?php echo e(staticValue('video_l')); ?></span></a>
                        </div>
                    </div>
                    <div class="contacts__left">
                        <div class="contacts__left--img">
                            <img src="<?php echo e(asset('front')); ?>/images/contact-main.png" width="520" alt="">
                        </div>
                        <img src="<?php echo e(asset('front')); ?>/images/contacts-pattern.svg" alt="">
                    </div>
                </div>
                <script>
                    Fancybox.bind("[data-fancybox]", {
                        thumbs: false
                    });
                </script>
        </section>
        <div class="join-us">
            <div class="container">

                <div class="join-us__img join-us__img--left">
                    <?php
                        $volunteers = menuSections(53,2);
                        $volunteers1 = $volunteers->first();
                        $volunteers2 = $volunteers->last();
                        $images = sectionImages($volunteers1);
                    ?>

                    <?php $__currentLoopData = $images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="join-us__img--item">
                            <img src="<?php echo e($image); ?>">
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>

                <div class="join-us__content">
                    <h2><?php echo e(staticValue('vatandosh')); ?></h2>
                    <p><?php echo e(staticValue('vatandosh1')); ?></p>

                    <?php if(staticValue('button1')): ?>
                        <a class="join-us__content--btn"
                           href="<?php echo e(route('home',['locale'=>app()->getlocale(), 'any'=>'application'])); ?>">
                            <?php echo e(staticValue('button1')); ?>

                        </a>
                    <?php endif; ?>
                </div>

                <div class="join-us__img join-us__img--right">
                    <?php
                        $images = sectionImages($volunteers2);
                    ?>

                    <?php $__currentLoopData = $images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="join-us__img--item">
                            <img src="<?php echo e($image); ?>">
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>

            </div>
        </div>

    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/index.blade.php ENDPATH**/ ?>