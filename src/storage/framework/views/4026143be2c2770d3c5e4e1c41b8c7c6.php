<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col">
                <a href="/" class="logo light" aria-label="Home">
                    <img src="<?php echo e(asset('front/')); ?>/images/logo.png" alt="Logo" class="header__brand-img" />
                    <span><?php echo e(staticValue('vatandoshlar')); ?><br><?php echo e(staticValue('vatandoshlar', 'content')); ?></span>
                </a>
                <p class="footer__text">
                    <?php echo e(staticValue('agency')); ?>

                </p>
            </div>
            <div class="col">
                <div class="footer__items">
                    <div class="footer__item">
                        <a href="tel:<?php echo e(staticValue('phonenumber', 'description')); ?>"
                            class="footer__item-value"><?php echo e(staticValue('phonenumber', 'description')); ?></a>
                        <span class="footer__item-label"><?php echo e(staticValue('phonenumber')); ?></span>
                    </div>
                    <div class="footer__item">
                        <a href="mailto:<?php echo e(staticValue('email', 'description')); ?>" class="footer__item-value">
                            <?php echo e(staticValue('email', 'description')); ?></a>
                        <span class="footer__item-label"><?php echo e(staticValue('email')); ?></span>
                    </div>
                    <div class="footer__item">
                        <span class="footer__item-value"><?php echo e(staticValue('adress_info', 'content')); ?></span>
                        <span class="footer__item-label"><?php echo e(staticValue('adress_info')); ?></span>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="footer__iframe">
                    <iframe src="https://yandex.uz/map-widget/v1/?ll=69.279737%2C41.311151&z=12"></iframe>
                </div>
            </div>
        </div>
        <div class="footer__nav">
            <span class="footer__nav-item">
                ©<span><?php echo e(date('Y')); ?></span> <?php echo e(staticValue('safe')); ?>

            </span>
            <span class="footer__nav-item d-flex">
                <?php echo e(staticValue('develop')); ?> <a href="">
                    <img src="<?php echo e(asset('front/')); ?>/images/proend.svg" width="100" alt="">
                </a>
            </span>

        </div>
    </div>
</footer>

<script src="<?php echo e(asset('front/')); ?>/assets/libs/bootstrap/bootstrap.bundle.min.js"></script>
<script src="<?php echo e(asset('front/')); ?>/assets/libs/owl-carousel/owl.carousel.min.js"></script>
<script src="<?php echo e(asset('front/')); ?>/assets/js/main.js"></script>
<script src="<?php echo e(asset('front/assets/bvi/js/bvi.js')); ?>"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {

        new isvek.Bvi({
            target: '.bvi-open',
            fontSize: 14,
            panelFixed: false,
            panelHide: true,
        })
    });
    $(function () {
        $('.links__carousel').owlCarousel({
            loop: true,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplayHoverPause: true,
            nav: true,
            margin: 144,
            dots: false,
            center: true,
            smartSpeed: 1000,
            autoWidth: true,
            responsive: {
                0: {
                    items: 1,
                }
            }
        });
    });
    $('.carousel3').owlCarousel({
        loop: true,
        autoplay: true,
        autoplayTimeout: 5000,
        autoplayHoverPause: true,
        margin: 16,
        nav: true,
        dots: false,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 2,
            },
            992: {
                items: 3,
            },
        }
    });
    $('.carousel3center').owlCarousel({
        loop: true,
        autoplay: true,
        autoplayTimeout: 5000,
        autoplayHoverPause: true,
        smartSpeed: 1000,
        center: true,
        margin: 16,
        nav: true,
        dots: false,
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 2,
            },
            992: {
                items: 2,
            },
        }
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const bviOnBtn = document.querySelector('.bvi-open');
        if (!bviOnBtn) return;

        const bindCloseListener = function () {
            const bviOffBtn = document.querySelector('[data-bvi="close"]');
            if (!bviOffBtn) return;

            if (bviOffBtn.dataset.bound) return;
            bviOffBtn.dataset.bound = '1';

            bviOffBtn.addEventListener('click', function () {
                console.log('[data-bvi="close"] clicked');
                document.body.classList.remove('bvi-active');

                const expire = 'Thu, 01 Jan 1970 00:00:00 UTC';
                const cookies = [
                    'bvi_builtElements',
                    'bvi_fontFamily',
                    'bvi_fontSize',
                    'bvi_images',
                    'bvi_lang',
                    'bvi_letterSpacing',
                    'bvi_lineHeight',
                    'bvi_panelActive',
                    'bvi_panelFixed',
                    'bvi_panelHide',
                    'bvi_reload',
                    'bvi_speech',
                    'bvi_target'
                ];

                cookies.forEach(function (name) {
                    document.cookie = name + '=; expires=' + expire + '; path=/;';
                    document.cookie = name + '=; expires=' + expire + '; path=/; domain=' + location.hostname + ';';
                    document.cookie = name + '=; expires=' + expire + '; path=/; domain=.' + location.hostname + ';';
                    document.cookie = name + '=; expires=' + expire + '; path=/; secure;';
                    console.log('Delete fired for', name);
                });

                console.log('document.cookie now:', document.cookie);
            });
        };

        bindCloseListener();
        bviOnBtn.addEventListener('click', bindCloseListener);
    });

</script><?php /**PATH /var/www/html/resources/views/front/components/footer.blade.php ENDPATH**/ ?>