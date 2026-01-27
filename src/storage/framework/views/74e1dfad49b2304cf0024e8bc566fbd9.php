<!DOCTYPE html>
<html lang="<?php echo e(app()->getLocale()); ?>">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="<?php echo e(setting('meta_description')); ?>">
    <meta name="keywords" content="<?php echo e(setting('meta_keywords')); ?>">
    <meta name="author" content="ProEnd">
    <?php if(isset($title)): ?>
        <?php
            $tit = $title;
        ?>
    <?php else: ?>
        <?php
            $tit = setting('title');
        ?>
    <?php endif; ?>
    <?php if(isset($desc)): ?>
        <?php
            $descript = strip_tags($desc);
        ?>
    <?php else: ?>
        <?php
            $descript = setting('meta_description');
        ?>
    <?php endif; ?>
    <title><?php echo e($tit); ?></title>
    <link rel="icon" href="<?php echo e(settingImageMain(true)); ?>">
    <link rel="icon2222" href="<?php echo e(settingImageMain(false)); ?>">
    <meta property="og:type" content="website">
    <meta property="og:url" content="<?php echo e(url()->current()); ?>">
    <meta property="og:title" content="<?php echo e($tit); ?>">
    <meta property="og:description" content="<?php echo e($descript); ?>">

    <meta property="og:image" content="<?php echo e((isset($image) && $image) ? url($image) : settingImageMain()); ?>">
    <meta property="og:image:secure_url" content="<?php echo e((isset($image) && $image) ? url($image) : settingImageMain()); ?>">
    <meta property="og:image:width" content="200">
    <meta property="og:image:height" content="200">
    <meta property="og:site_name" content="<?php echo e(setting('title')); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/libs/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/libs/aos/main.min.css">
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/bvi/css/bvi.css">
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/libs/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/libs/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/icomoon/style.css">
    <link rel="stylesheet"
        href="<?php echo e(asset('front/')); ?>/css/main.min.css?v=<?php echo e(filemtime(public_path('front/css/main.min.css'))); ?>">
    <script src="<?php echo e(asset('front/')); ?>/assets/libs/aos/main.min.js"></script>
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/fancy-box/fancybox.css">
    <script src="<?php echo e(asset('front/')); ?>/assets/fancy-box/fancybox.umd.js"></script>
    <script src="<?php echo e(asset('front/')); ?>/assets/libs/jquery.min.js"></script>
</head>

<?php
    $segments = request()->segments();
?>

<body class="<?php echo e(count($segments) <= 1 ? 'index' : ''); ?> ">

    <?php echo $__env->make('front.components.header', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <?php echo $__env->yieldContent('body'); ?>
    <?php if(count($segments) <= 1): ?>

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
    <style>
        .rht_icon_wrapper_element.gsp_ic_l.ss_rht_b_i_opened{
            display: none;
        }
    </style>
    <div class="gsp_button_player"></div>
    <script async src="https://widget.gspeech.io/96ccb9c2672e19a787589eb1961ffd82?v=1"></script>













    <?php echo $__env->make('front.components.footer', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <?php echo $__env->yieldContent('script'); ?>
</body>



</html>
<?php /**PATH /var/www/html/resources/views/front/layouts/layout.blade.php ENDPATH**/ ?>