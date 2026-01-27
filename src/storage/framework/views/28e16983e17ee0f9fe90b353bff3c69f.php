<?php
    $items = menuSections(36, 1);
    $data = menuSections(2, 1);
?>

<section class="about-section">
    <div class="container">
        <ul class="about-section__left">
            <?php $__currentLoopData = linkData(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $link): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <li class="about-section__left-item">
                    <a class="about-section__left--link" href="<?php echo e($link->url); ?>" target="_blank" rel="noopener noreferrer">

                        <i class="<?php echo e($link->icon); ?>"></i>

                    </a>
                </li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </ul>
        <div class="about-section__middle">
            <div class="about-section__middle--logo">
                <img src="<?php echo e(asset('front')); ?>/images/logo.png" alt="">
                <h2><span><?php echo e(sectionValue($data[0], 'title')); ?> </span><?php echo e(sectionValue($data[0], 'content')); ?></h2>
            </div>
            <div class="about-section__middle--content">
                <p class="about-section__middle--content-text"><?php echo e(sectionValue($items[0], 'title')); ?>

                </p>

                <div class="about-section__middle--content-video">
                    <?php if($heroVideo): ?>
                        <video class="hero-video" src="<?php echo e($heroVideo); ?>" loop autoplay muted></video>
                    <?php endif; ?>
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

        console.log('ScrollY:', window.scrollY, 'Section Height:', aboutSection.clientHeight, 'Scroll Fraction:', scrollFraction.toFixed(2));
        // Make video static when animation completes
        if (scrollFraction >= 1) {
            video.style.position = 'static';
            video.style.transform = 'none';
        } else {
            video.style.position = 'fixed';
            video.style.transform = 'translate(-50%, 0)';
        }
    });

</script><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/home/about.blade.php ENDPATH**/ ?>