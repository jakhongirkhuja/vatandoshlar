<?php $__env->startSection('body'); ?>
    <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="leadership-page">
                    <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="leadership-page__card">
                            <div class="leadership-page__card--img">
                                <?php
                                    $mainImage = sectionImages($item, true);
                                ?>
                                <?php if($mainImage): ?>
                                    <img src="<?php echo e($mainImage); ?>" alt="<?php echo e(sectionValue($item, 'title')); ?>">
                                <?php endif; ?>
                            </div>
                            <div class="leadership-page__card--about">
                                <div class="leadership-page__card--about-name">
                                    <h2><?php echo e(sectionValue($item, 'title')); ?></h2>
                                    <p><?php echo e(sectionValue($item, 'description')); ?></p>
                                </div>
                                <div class="leadership-page__card--about-contact">
                                    <div class="leadership-page__card--about-contact-item">
                                        <p>Telefon raqam:</p>
                                        <h3><i class="i-phone"></i><?php echo e(sectionValue($item, 'phone')); ?></h3>
                                    </div>
                                    <div class="leadership-page__card--about-contact-item">
                                        <p>Elektron manzil:</p>
                                        <h3><i class="i-email"></i> <?php echo e(sectionValue($item, 'email')); ?></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                </div>
            </div>
            <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/pages/rahbariyat/index.blade.php ENDPATH**/ ?>