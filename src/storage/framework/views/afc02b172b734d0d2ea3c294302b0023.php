<?php $__env->startSection('body'); ?>
    <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="news__page">
                    <div class="news__page--grid">
                        <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <a class="news__page--grid-item"  href="<?php echo e(route('home',['locale'=>app()->getlocale(), 'any'=>request()->route('any'),'inside'=>$item->slug])); ?>">
                                <div class="news__page--grid-item-img">
                                    <?php
                                        $mainImage = sectionImages($item, true);
                                         if(!$mainImage){
                                            $mainImage = asset('front/images/news_fallback.png');
                                        }
                                    ?>
                                    <?php if($mainImage): ?>
                                        <img src="<?php echo e($mainImage); ?>" alt="<?php echo e(sectionValue($item, 'title')); ?>">
                                    <?php endif; ?>
                                </div>
                                <div class="news__page--grid-item-text">
                                    <p class="line-clamp-3"><?php echo e(sectionValue($item, 'title')); ?></p>
                                    <div class="news__page--grid-item-links">
                                        <div><i class="i-calendar"></i><span><?php echo e(date('d-m-Y', strtotime($item->publish_at))); ?></span></div>
                                        <div><i class="i-eye"></i><span><?php echo e($item->views()->count()); ?></span></div>
                                    </div>
                            </div>
                        </a>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>   
                    <div class="pagination">
                    <?php if($items->hasPages()): ?>
<div class="pagination">

    
    <?php if($items->onFirstPage()): ?>
        <li><span><i class="i-prev"></i></span></li>
    <?php else: ?>
        <li><a href="<?php echo e($items->previousPageUrl()); ?>"><i class="i-prev"></i></a></li>
    <?php endif; ?>

    
    <?php $__currentLoopData = $items->getUrlRange(1, $items->lastPage()); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $page => $url): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <li>
            <a href="<?php echo e($url); ?>"
               class="pagination-item <?php echo e($page == $items->currentPage() ? 'active' : ''); ?>">
                <?php echo e($page); ?>

            </a>
        </li>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

    
    <?php if($items->hasMorePages()): ?>
        <li><a href="<?php echo e($items->nextPageUrl()); ?>"><i class="i-next"></i></a></li>
    <?php else: ?>
        <li><span><i class="i-next"></i></span></li>
    <?php endif; ?>

</div>
<?php endif; ?>

</div>
                </div>
            </div>
            <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/news/index.blade.php ENDPATH**/ ?>