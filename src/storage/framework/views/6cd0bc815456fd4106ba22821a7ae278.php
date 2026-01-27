<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="<?php echo e(setting('meta_description')); ?>">
    <meta name="keywords" content="<?php echo e(setting('meta_keywords')); ?>">
    <meta name="author" content="ProEnd">
    <title>Админ панель PROEND-TEAM</title>

    <meta property="og:type" content="website">
    <meta property="og:url" content="<?php echo e(url()->current()); ?>">
    <meta property="og:title" content="<?php echo e(setting('title')); ?>">
    <meta property="og:description" content="<?php echo e(setting('meta_description')); ?>">
    <meta property="og:image" content="https://www.yourwebsite.com/path-to-image.jpg">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:site_name" content="Vatandoshlar">


    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
    <link rel="apple-touch-icon" href="<?php echo e(asset('assets/admin')); ?>/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon"
        href="<?php echo e(asset('assets/admin')); ?>/app-assets/images/ico/proend-icon.png">
    

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css"
        href="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/css/tables/ag-grid/ag-grid.css">
    <link rel="stylesheet" type="text/css"
        href="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/css/tables/ag-grid/ag-theme-material.css">
    
    <link rel="stylesheet" type="text/css"
        href="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/css/extensions/tether-theme-arrows.css">
    <link rel="stylesheet" type="text/css"
        href="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/css/extensions/tether.min.css">
    <link rel="stylesheet" type="text/css"
        href="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/css/extensions/shepherd-theme-default.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css"
        href="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/css/forms/select/select2.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/admin')); ?>/app-assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/admin')); ?>/app-assets/css/bootstrap-extended.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/admin')); ?>/app-assets/css/colors.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/admin')); ?>/app-assets/css/components.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/admin')); ?>/app-assets/css/themes/dark-layout.min.css">
    <link rel="stylesheet" type="text/css"
        href="<?php echo e(asset('assets/admin')); ?>/app-assets/css/themes/semi-dark-layout.min.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css"
        href="<?php echo e(asset('assets/admin')); ?>/app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css"
        href="<?php echo e(asset('assets/admin')); ?>/app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css"
        href="<?php echo e(asset('assets/admin')); ?>/app-assets/css/pages/dashboard-analytics.css">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/admin')); ?>/app-assets/css/pages/card-analytics.css">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/admin')); ?>/app-assets/css/pages/app-user.css">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/admin')); ?>/app-assets/css/pages/aggrid.css">
    <!-- END: Page CSS-->
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/admin')); ?>/app-assets/css/pages/data-list-view.css">

    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/css/pickers/pickadate/pickadate.css">
    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/admin')); ?>/assets/css/style.css">
    <link rel="stylesheet" href="<?php echo e(asset('assets/admin')); ?>/fancy-box/fancybox.css">


    <script src="<?php echo e(asset('assets/admin')); ?>/fancy-box/fancybox.umd.js"></script>

    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern semi-dark-layout 2-columns  navbar-floating footer-static  "
    data-open="click" data-menu="vertical-menu-modern" data-col="2-columns" data-layout="semi-dark-layout">
    <?php echo $__env->make('admin.components.header', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

    <?php echo $__env->make('admin.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>


    <?php echo $__env->yieldContent('body'); ?>

    <?php echo $__env->make('admin.components.footer', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>



    <!-- BEGIN: Vendor JS-->
    <script src="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    
    <script src="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/js/extensions/tether.min.js"></script>
    
    <!-- END: Page Vendor JS-->
    <script
        src="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/js/tables/ag-grid/ag-grid-community.min.noStyle.js"></script>
    <!-- BEGIN: Theme JS-->
    <script src="<?php echo e(asset('assets/admin')); ?>/app-assets/js/core/app-menu.js"></script>
    <script src="<?php echo e(asset('assets/admin')); ?>/app-assets/js/core/app.js"></script>
    <script src="<?php echo e(asset('assets/admin')); ?>/app-assets/js/scripts/components.js"></script>
    

    <!-- BEGIN: Page JS-->
    <script src="<?php echo e(asset('assets/admin')); ?>/app-assets/js/scripts/pages/dashboard-analytics.js"></script>
    <script src="<?php echo e(asset('assets/admin')); ?>/app-assets/js/scripts/pages/app-user.js"></script>


    <link href="<?php echo e(asset('assets/admin/summernote/summernote.min.css')); ?>" rel="stylesheet">
    <script src="<?php echo e(asset('assets/admin/summernote/summernote-bs4.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/admin/summernote/summernote-image-attributes.js')); ?>"></script>


    <script src="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
    <script src="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
    <script src="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/js/pickers/pickadate/picker.time.js"></script>
    <script src="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/js/pickers/pickadate/legacy.js"></script>
    <script src="<?php echo e(asset('assets/admin')); ?>/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
    <script src="<?php echo e(asset('assets/admin')); ?>/app-assets/js/scripts/forms/select/form-select2.js"></script>
    <script>
        $('.summernote').summernote({
            callbacks: {
                onInit: function () {
                    $('.note-toolbar').removeClass('card-header');
                }
            },
            height: 500,
            minHeight: null,
            maxHeight: null,
            focus: true,
            popover: {
                image: [
                    ['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
                    ['float', ['floatLeft', 'floatRight', 'floatNone']],
                    ['remove', ['removeMedia']],
                    ['custom', ['imageAttributes']],
                ],
            },
            imageAttributes: {
                icon: '<i class="note-icon-pencil"/>',
                removeEmpty: false,
                manageAspectRatio: true
            },

            toolbar: [

                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear', 'italic', 'strikethrough', 'superscript', 'subscript']],
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph', 'height']],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video', 'hr']],
                ['view', ['fullscreen', 'codeview', 'help']],
                ['history', ['undo', 'redo']]
            ],
            fontsize: ['8', '9', '10', '11', '12', '14', '18', '24', '36'],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Merriweather'],
        });
        $('.pickadate').pickadate({
            format: 'yyyy-mm-dd'
        });
        $('.select2-single-multiple').select2({
            maximumSelectionLength: 1
        });
    </script>
    <!-- END: Page JS-->
    <?php echo $__env->yieldContent('script'); ?>
</body>
<!-- END: Body-->

</html>
<?php /**PATH /var/www/html/resources/views/admin/layouts/layouts.blade.php ENDPATH**/ ?>