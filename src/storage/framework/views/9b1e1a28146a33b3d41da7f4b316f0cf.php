<?php $__env->startSection('body'); ?>
    <div class="text-center my-5">
        <h1>404</h1>
        <h3>Oops! Page Not Found.</h3>
        <p>The page you are looking for does not exist.</p>
        <a href="<?php echo e(route('home')); ?>" class="btn btn-primary">Go Home</a>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/errors/404.blade.php ENDPATH**/ ?>