<?php $__env->startSection('body'); ?>
  <div class="layout">
        <div class="container">
<div class="search-page">
    <div class="search-header">
        <div class="container">
           

            
            <h1 class="search-title">Qidiruv</h1>
        </div>
    </div>

    
    <div class="search-content">
        <div class="container">
            <div class="search-box">
                <form action="<?php echo e(route('search', ['locale'=> app()->getLocale()])); ?>" method="GET" class="search-form">
                    <div class="input-group">
                        <span class="search-icon">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                <path d="M21 21L15 15M17 10C17 13.866 13.866 17 10 17C6.13401 17 3 13.866 3 10C3 6.13401 6.13401 3 10 3C13.866 3 17 6.13401 17 10Z" 
                                      stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                            </svg>
                        </span>
                        <input 
                            type="text" 
                            name="search" 
                            class="search-input" 
                            placeholder="Qidiruv so'zingizni kiriting"
                            value="<?php echo e($search ?? ''); ?>"
                            required
                        >
                        <button type="submit" class="search-btn">IZLASH</button>
                    </div>
                </form>
              
                
                <?php if(isset($results)): ?>
                <div class="results-info">
                    <p>
                        «<strong><?php echo e($search); ?></strong>» qidiruv bo'yicha, 
                        <strong><?php echo e($count); ?></strong> ta natija topildi:
                    </p>
                </div>
                <?php endif; ?>
            </div>
            <?php if(isset($results) && $results->count() > 0): ?>
            <div class="results-list">
                <?php $__currentLoopData = $results; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $result): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php
                            foreach($menus as $menu){
                                if($result->menu_main_id ==$menu->id){
                                        $slug = $menu->slug;
                                        break;
                                }
                            }
                            
                        ?>
                        <a href="<?php echo e(route('home',['locale'=>app()->getLocale(),'any' => $slug,'inside' => $result->slug])); ?>">
                            <div class="result-item">
                                <h3 class="result-title">
                                    <?php echo e(sectionValue($result,'title')); ?>

                                </h3>
                            </div>
                        </a>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
            <?php elseif(isset($results) && $results->count() == 0): ?>
            <div class="no-results">
                <p>Hech qanday natija topilmadi</p>
            </div>
            <?php endif; ?>
        </div>
    </div>
</div>
</div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/search/index.blade.php ENDPATH**/ ?>