<?php $__env->startSection('body'); ?>
    <div class="container">
        <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    </div>
    <section id="portfolio-details" class="portfolio-details section">

        <div class="container section-title" data-aos="fade-up">
            <h2>Static PAGE</h2>
            <p>sdsd</p>
        </div>

        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <div class="row gy-4">

                <div class="col-lg-8">
                    Statis
                </div>

                <div class="col-lg-4">
                    <?php echo $__env->make('front.components.sidebar', ['menus' => $headerMenu], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

                </div>

            </div>

        </div>

    </section>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/static/index.blade.php ENDPATH**/ ?>