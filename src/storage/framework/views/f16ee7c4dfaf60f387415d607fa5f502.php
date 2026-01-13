<section class="stats">
    <div class="container">
        <div class="section-top">
            <p><?php echo e(staticValue('statisctic')); ?> </p>
        </div>

        <div class="stats__grid">
            <?php $__currentLoopData = menuSections(3, 6, false); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $stat): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?> 
                <div class="stats__grid--item">
                    <div class="stats__grid--item-img">
                        <img src="<?php echo e(sectionValue($stat, 'image') ? Storage::url(sectionValue($stat, 'image')) : asset('front/images/stats-img-1.svg')); ?>"
                            alt="<?php echo e(sectionValue($stat, 'title')); ?>">
                    </div>
                    <h3 class="stats__grid--item-title" data-count="<?php echo e(sectionValue($stat, 'number', 0)); ?>">
                        0+
                    </h3>
                    <p class="stats__grid--item-subtitle"><?php echo e(sectionValue($stat, 'title', 'Qatnashgan vatandoshlar soni')); ?>

                    </p>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
</section><?php /**PATH /var/www/html/resources/views/front/home/stats.blade.php ENDPATH**/ ?>