<section class="social">
    <div class="container">
        <div class="section-top">
            <p><?php echo e(staticValue('knowledge')); ?> </p>
        </div>
        <?php
            $socials = menuSections(47,2);
            $social1 = $socials[0];
            $social2 = $socials[1]; 
        ?>
       
        <div class="social__wrapper">
            <div class="social__card">
                <div class="social__card--content">
                    <h6><?php echo e(staticValue('download ')); ?></h6>
                    <h6><?php echo e(sectionValue($social2,'title')); ?></h6>
                    <p><?php echo e(sectionValue($social1,'description')); ?></p>
                    <div class="d-flex align-items-center gap-2">
                        <a class="link" href="#"><img src="<?php echo e(asset('front')); ?>/images/appstore.svg" alt=""></a>
                        <a class="link" href="#"><img src="<?php echo e(asset('front')); ?>/images/googleplay.svg" alt=""></a>
                    </div>
                </div>
                <div class="social__card--img">
                    <?php
                        $image = sectionImages($social1, true);
                    ?>
                    <img src="<?php echo e($image); ?>" width="280" alt="">
                </div>
            </div>
            <div class="social__card">
                <div class="social__card--content">
                    <h6><?php echo e(sectionValue($social2,'title')); ?></h6>
                    <p><?php echo e(sectionValue($social2,'description')); ?></p>
                    <a class="button" href="#"><?php echo e(staticValue('keyboard')); ?></a>
                </div>
                <div class="social__card--img">
                    <?php
                         $imagesFalse = sectionImages($social2, true);
                       
                    ?>
                    <img src="<?php echo e($imagesFalse); ?>" width="280" alt="">
                </div>
            </div>
        </div>
</section><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/home/socials.blade.php ENDPATH**/ ?>