<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Vatandoshlar Jamoat Fondi rasmiy veb-sayti">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="<?php echo e(asset('front/')); ?>/images/logo.png">
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/libs/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/libs/aos/main.min.css">
    <link rel="stylesheet" href="<?php echo e(asset('front/assets/bvi/css/bvi.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/libs/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/libs/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/icomoon/style.css">
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/css/main.min.css">
    <script src="<?php echo e(asset('front/')); ?>/assets/libs/aos/main.min.js"></script>
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/fancy-box/fancybox.css">
    <script src="<?php echo e(asset('front/')); ?>/assets/fancy-box/fancybox.umd.js"></script>
    <script src="<?php echo e(asset('front/')); ?>/assets/libs/jquery.min.js"></script>
    <title>“Vatandoshlar”Jamoat Fondi</title>
</head>

<?php
    $segments = request()->segments();
?>
<body class="<?php echo e(count($segments)<=1 ? 'index' : ''); ?> " >

    <?php echo $__env->make('front.components.header', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <?php echo $__env->yieldContent('body'); ?>
    <?php if(count($segments)>1): ?>
        <div class="layout">
            <div class="container">
                <div class="layout-content">
                    <!-- @include('components/journal.html') -->
                </div>
                <div class="layout-sidebar">
                    <!-- @include('components/sidebar1.html') -->
                </div>
            </div>
        </div>
    <?php endif; ?>

    <?php if(count($segments)<=1): ?>

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
    <?php endif; ?>
    <?php echo $__env->make('front.components.footer', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

</body>



</html>
<?php /**PATH /var/www/html/resources/views/front/layouts/layout.blade.php ENDPATH**/ ?>