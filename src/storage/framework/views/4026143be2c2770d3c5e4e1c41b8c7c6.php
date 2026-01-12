<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col">
                <a href="/" class="logo light" aria-label="Home">
                    <img src="<?php echo e(asset('front/')); ?>/images/logo.png" alt="Logo" class="header__brand-img" />
                    <span>“Vatandoshlar”<br>Jamoat Fondi</span>
                </a>
                <p class="footer__text">
                    <?php echo e(staticValue('agency')); ?>

                </p>
            </div>
            <div class="col">
                <div class="footer__items">
                    <div class="footer__item">
                        <a href="tel:+998998765432" class="footer__item-value">+998 (55) 502-22-99</a>
                        <span class="footer__item-label"><?php echo e(staticValue('phone')); ?></span>
                    </div>
                    <div class="footer__item">
                        <a href="mailto:info@vatandoshlar.uz" class="footer__item-value">
                            info@vatandoshlarfondi.uz</a>
                        <span class="footer__item-label"><?php echo e(staticValue('email')); ?></span>
                    </div>
                    <div class="footer__item">
                        <span class="footer__item-value">100100, Toshkent sh., Yakkasaroy tumani, Bobur ko'chasi,
                            30-uy.</span>
                        <span class="footer__item-label"><?php echo e(staticValue('address')); ?></span>
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
                ©2025 VATANDOSHLAR FONDI. Barcha huquqlari himoyalangan.
            </span>
            <span class="footer__nav-item d-flex">
                Developed by: <a href="">
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
<?php /**PATH /var/www/html/resources/views/front/components/footer.blade.php ENDPATH**/ ?>