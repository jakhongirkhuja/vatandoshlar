<div class="join-us">
    <div class="container">
        <div class="join-us__img join-us__img--left">
            <div class="join-us__img--item">
                <img src="<?php echo e(asset('front')); ?>/images/volunteer-1.png">
            </div>
            <div class="join-us__img--item">
                <img src="<?php echo e(asset('front')); ?>/images/volunteer-2.png">
            </div>
            <div class="join-us__img--item">
                <img src="<?php echo e(asset('front')); ?>/images/volunteer-3.png">
            </div>
            <div class="join-us__img--item">
                <img src="<?php echo e(asset('front')); ?>/images/volunteer-4.png">
            </div>
        </div>
        <div class="join-us__content">
            <h2><?php echo e(staticValue('vatandosh')); ?></h2>
            <p><?php echo e(staticValue('vatandosh1')); ?></p>
            <?php if(staticValue('button1')): ?>
            <a class="join-us__content--btn"  href="<?php echo e(route('home',['locale'=>app()->getlocale(), 'any'=>'application'])); ?>"><?php echo e(staticValue('button1')); ?></a>
            <?php endif; ?>
        </div>
        <div class="join-us__img join-us__img--right">
            <div class="join-us__img--item">
                <img src="<?php echo e(asset('front')); ?>/images/volunteer-5.png">
            </div>
            <div class="join-us__img--item">
                <img src="<?php echo e(asset('front')); ?>/images/volunteer-6.png">
            </div>
            <div class="join-us__img--item">
                <img src="<?php echo e(asset('front')); ?>/images/volunteer-7.png">
            </div>
            <div class="join-us__img--item">
                <img src="<?php echo e(asset('front')); ?>/images/volunteer-8.png">
            </div>
        </div>
    </div>
</div>
<?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/home/join-us.blade.php ENDPATH**/ ?>