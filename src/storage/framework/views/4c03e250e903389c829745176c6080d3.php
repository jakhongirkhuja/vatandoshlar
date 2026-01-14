<?php
$sections = menuSections(31, 2, false);
$section = $sections->skip(1)->first();
$news = menuSections(26,3);
?> 



<?php $__env->startSection('body'); ?>    
    <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <?php 
                    //$items = $items->first()->children;
                    
                ?>

                <div class="associations-detail">
                    
                    <?php $__currentLoopData = $items[0]->children; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $mainItem): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                      <?php if($key == 0): ?>
                        <div class="associations-detail__about">
                            <div class="associations-detail__about--img">
                                <?php $image = sectionImages($mainItem, true); ?>
                                <?php if($image): ?>
                                    <img src="<?php echo e($image); ?>" alt="">
                                <?php endif; ?>
                            </div>
                            <div class="associations-detail__about--text">
                                <div class="associations-detail__about--text-title">
                                    <h2><?php echo e(sectionValue($mainItem, 'title')); ?></h2>
                                </div>
                                <div class="associations-detail__about--text-date">
                                    <div class="associations-detail__about--text-date-item">
                                        <p>Tashkil topgan sanasi:</p>
                                        <span><i class="i-calendar"></i> <?php echo e(sectionValue($mainItem, 'date_at')); ?></span>
                                    </div>
                                    <div class="associations-detail__about--text-date-item">
                                        <p>Rahbari saylangan sanasi:</p>
                                        <span><i class="i-calendar"></i> <?php echo e(sectionValue($mainItem, 'boss_at')); ?></span>
                                    </div>
                                </div>
                                <div class="associations-detail__about--text-hr"></div>
                                <div class="associations-detail__about--text-task">
                                    <p>Tashkilotning asosiy maqsad va vazifalari:</p>
                                    <span><?php echo sectionValue($mainItem, 'description'); ?></span>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>

                    
                    <?php if($key == 1): ?>
                    
                        <div class="associations-detail__president">
                            <div class="associations-detail__president--img">
                                <?php $image = sectionImages($mainItem, true); 
                                ?>
                                <?php if($image): ?>
                                    <img src="<?php echo e($image); ?>" alt="">
                                <?php endif; ?>
                            </div>
                            <div class="associations-detail__president--data">
                                <div class="associations-detail__president--data-name">
                                    <p><?php echo e(sectionValue($mainItem, 'title')); ?></p>
                                    <span><?php echo e(sectionValue($mainItem, 'description')); ?></span>
                                </div>
                                <div class="associations-detail__president--data-contact">
                                    <div class="associations-detail__president--data-contact-item">
                                        <p>Telefon raqam:</p>
                                        <span><i class="i-phone"></i> <?php echo e(sectionValue($mainItem, 'phone')); ?></span>
                                    </div>
                                    <div class="associations-detail__president--data-contact-item">
                                        <p>Elektron manzil:</p>
                                        <span><i class="i-email"></i> <?php echo e(sectionValue($mainItem, 'email')); ?></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                       <?php if($section): ?>
    <div class="associations-detail__gallery">
        <h2 class="associations-detail__gallery--title"><?php echo e(sectionValue($section, 'title')); ?></h2>
        
        <div class="carousel carousel3center owl-carousel">
            <?php
                $mainImage = sectionImages($section);
            ?>

            <?php if($mainImage): ?>
                <?php $__currentLoopData = $mainImage; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $src): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <a href="<?php echo e($src); ?>" class="carousel__item">
                        <div class="carousel__item--img">
                            <img src="<?php echo e($src); ?>" alt="">
                        </div>
                    </a>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <?php endif; ?>
        </div>
    </div>
<?php endif; ?>
              <div class="associations-detail__news">
    <?php if($news): ?>
        <h2 class="associations-detail__gallery--title"><?php echo e(staticValue('news')); ?></h2>
        <div class="carousel carousel3 owl-carousel">
            <?php $__currentLoopData = $news; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $newsItem): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <a class="carousel__item" href="<?php echo e(route('home', ['locale' => app()->getLocale(), 'any' => request()->route('any'), 'inside' => $newsItem->slug])); ?>">
                    <div class="carousel__item--img">
                        <?php
                            $mainImage = sectionImages($newsItem, true);
                        ?>
                        <?php if($mainImage): ?>
                            <img src="<?php echo e($mainImage); ?>" alt="">
                        <?php endif; ?>
                    </div>
                    <div class="carousel__item--content">
                        <p class="carousel__item--content-title line-clamp-2"><?php echo e(sectionValue($newsItem, 'title')); ?></p>
                        <p class="carousel__item--content-date">
                            <i class="i-calendar"></i>
                            <span><?php echo e($newsItem->created_at->format('d.m.Y')); ?></span>
                        </p>
                    </div>
                </a>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    <?php endif; ?>
</div>
                </div>
            </div>
            <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/jamoat_birlashmalari/inside/detail/index.blade.php ENDPATH**/ ?>