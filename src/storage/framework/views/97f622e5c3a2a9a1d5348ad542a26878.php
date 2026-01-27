<div class="library__section">
    <div class="container">
        <div class="library__section--wrapper">
            <div class="library__section--left">
                <div class="library__section--logo">
                    <img src="<?php echo e(asset('front')); ?>/images/library-logo-1.png" alt="">
                    <img src="<?php echo e(asset('front')); ?>/images/library-logo-2.png" alt="">
                    <img src="<?php echo e(asset('front')); ?>/images/library-logo-3.png" alt="">
                </div>
                <?php
                    $library = menuSections(50, 3, false);
                ?>
                <h4 class="library__section--title"><span>“Mutolaa”</span> <?php echo e(staticValue('mutoola')); ?></h4>
                <p class="library__section--text">
                    <?php echo e(staticValue('download')); ?>

                </p>
                <a class="button library__section--link" href="https://mutolaa.uz"><?php echo e(staticValue('site')); ?></a>
            </div>
            <div class="library__section--right">
                
                <div class="carousel library-carousel1">
                    <?php for($i = 0; $i < 2; $i++): ?>
                        <?php $__currentLoopData = $library; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php
                                $image = sectionImages($item, true);
                            ?>
                            <img src="<?php echo e($image); ?>" alt="">
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endfor; ?>
                </div>

                
                <div class="carousel library-carousel2">
                    <?php for($i = 0; $i < 2; $i++): ?>
                        <?php $__currentLoopData = $library; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php
                                $image = sectionImages($item, true);
                            ?>
                            <img src="<?php echo e($image); ?>" alt="">
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endfor; ?>
                </div>

                
                <div class="carousel library-carousel3">
                    <?php for($i = 0; $i < 2; $i++): ?>
                        <?php $__currentLoopData = $library; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php
                                $image = sectionImages($item, true);
                            ?>
                            <img src="<?php echo e($image); ?>" alt="">
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endfor; ?>
                </div>

            </div>

        </div>
    </div>
</div>
<script>
    const setCarouselVars = () => {
        document.querySelectorAll(".library__section--right").forEach(c => {
            c.style.setProperty("--c-width", `${c.offsetWidth}px`)
            console.log(c.offsetWidth);
        })
    }
    setCarouselVars();
    window.addEventListener("DOMContentLoaded", setCarouselVars)
    window.addEventListener("resize", setCarouselVars)
</script><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/home/library.blade.php ENDPATH**/ ?>