<?php
    $menuItself = menuSection(26);
    $newsSections = menuSections(26, 4, false);
?>

<section class="news-section">
    <div class="container">
        <div class="section-top">
            <p><?php echo e(staticValue('news')); ?></p>
            <a href="<?php echo e(route('home', ['locale' => app()->getlocale(), 'any' => $menuItself->slug])); ?>"><?php echo e(staticValue('all')); ?><i
                    class="i-link"></i></a>

        </div>

        <div class="news-section__wrapper">
            
            <?php if($newsSections->first()): ?>
                <?php
                    $main = $newsSections->first();
                    $mainImage = sectionImages($main, true);
                ?>
                <a href="<?php echo e(route('home', ['locale' => app()->getlocale(), 'any' => $menuItself->slug, 'inside' => $main->slug])); ?>"
                    class="news-section__item main">
                    <?php if($mainImage): ?>
                        <img src="<?php echo e($mainImage); ?>" alt="<?php echo e(sectionValue($main, 'title')); ?>">
                    <?php endif; ?>

                    <div class="news-section__item--content">
                        <h3 class="news-section__item--content-title line-clamp-2 no-tooltip">
                            <?php echo e(sectionValue($main, 'title')); ?>

                        </h3>

                        <div class="news-section__item--content-date">
                            <?php echo e(optional($main->created_at)->format('d F Y')); ?>

                        </div>
                    </div>
                </a>
            <?php endif; ?>

            
            <div class="news-section__list">
                <?php $__currentLoopData = $newsSections->skip(1); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $news): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php
                        $img = sectionImages($news, true);
                    ?>

                    <a href="<?php echo e(route('home', ['locale' => app()->getlocale(), 'any' => $menuItself->slug, 'inside' => $news->slug])); ?>"
                        class="news-section__item">
                        <?php if($img): ?>
                            <div class="news-section__item--img">
                                <img src="<?php echo e($img); ?>" alt="<?php echo e(sectionValue($news, 'title')); ?>">
                            </div>
                        <?php endif; ?>

                        <div class="news-section__item--content">
                            <h3 class="news-section__item--content-title line-clamp-2 no-tooltip">
                                <?php echo e(sectionValue($news, 'title')); ?>

                            </h3>

                            <div class="news-section__item--content-date">
                                <?php echo e(optional($news->created_at)->format('d F Y')); ?>

                            </div>
                        </div>
                    </a>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
</section><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/home/news.blade.php ENDPATH**/ ?>