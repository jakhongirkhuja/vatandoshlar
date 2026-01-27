    <?php if($heroSection): ?>
    <section class="hero">
        <div class="hero__bg">
           
            <?php if($heroVideo): ?>
            
                 <video class="hero__video" width="100%" height="100%" muted loop autoplay src="<?php echo e($heroVideo); ?>"
                type="video/mp4"></video>
            <?php endif; ?>
        </div>

        <div class="hero__content container">
            <h1 class="hero__title">
                <?php echo e(sectionValue($heroSection, 'title')); ?>

            </h1>
    
            <button class="hero__btn">
                <i class="i-arrow"></i>
                <span><?php echo e(staticValue('more')); ?></span>
            </button>
        </div>
    </section>
 <?php endif; ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/home/hero.blade.php ENDPATH**/ ?>