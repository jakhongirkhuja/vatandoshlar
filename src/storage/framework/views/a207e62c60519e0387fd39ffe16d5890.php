<?php $__env->startSection('body'); ?>
<?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
<div class="layout">
    <div class="container">
        <div class="projects-page__grid">
            <?php
            $items = menuSections(38,null,false,true)
            ?>
            <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php
                $images = sectionImages($item,true);
                $image = $images;
                if(!$images){
                    $image = asset('front/images/news_fallback.png');
                }

                ?>


                    <a href="<?php echo e(route('home', [
                    'locale' => app()->getLocale(),
                    'any' => request()->route('any'),
                    'inside' => $item->slug
                ])); ?>" class="projects-page__grid--item">

                        <div class="projects-page__grid--item-img">
                            <img src="<?php echo e($image); ?>" alt="">
                        </div>

                        <hr>

                        <p class="projects-page__grid--item-title">
                            <?php echo e(sectionValue($item, 'title')); ?>

                        </p>

                        <button class="projects-page__grid--item-link">
                            <span><?php echo e(staticValue('more-about')); ?></span>
                            <i class="i-link"></i>
                        </button>
                    </a>

            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>


        </div>
        <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/pages/projects/index.blade.php ENDPATH**/ ?>