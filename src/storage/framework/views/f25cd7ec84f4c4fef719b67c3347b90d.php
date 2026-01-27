<div class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-wrapper">
            <ul class="breadcrumbs__list">
                <?php $__currentLoopData = $breadcrumbs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php
                        $locale = app()->getLocale();
                        $link = match ($menu->type) {
                            'page' => url($locale . '/' . $menu->slug),
                            'category', 'section' => '#',
                            default => '#',
                        };
                    ?>

                    <li class="breadcrumbs__list--item">
                        <a href="<?php echo e($link); ?>" class="breadcrumbs__link">
                            <?php echo e(sectionValue($menu, 'title')); ?>

                        </a>
                    </li>

                    <?php if(!$loop->last): ?>
                        <li class="breadcrumbs__list--item">
                            <i class="i-dropdown"></i>
                        </li>
                    <?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </ul>
            <?php if($breadcrumbs->count()): ?>
                <h1 class="breadcrumbs__title">
                    <?php echo e(sectionValue($breadcrumbs->last(), 'title')); ?>

                </h1>
            <?php endif; ?>
        </div>
    </div>
</div><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/components/breadcrumbs.blade.php ENDPATH**/ ?>