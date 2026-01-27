<?php $__env->startSection('body'); ?>
<div class="layout">
    <div class="container">
        <div class="search">
            
            <div class="search__wrapper">
                <div class="search__sidebar">
                    <form action="<?php echo e(route('search', ['locale' => app()->getLocale(),'search' => request()->route()])); ?>" method="POST"
                        class="search__form">
            <?php echo csrf_field(); ?>

                        <div class="search-wrapper">
                            <input type="text" name="search" class="search-input"
                                placeholder="<?php echo e(staticValue('search')); ?>" value="<?php echo e($search ?? ''); ?>" required>
                        </div>
                        <button type="submit" class="search__button button"> <i class="i-search"></i>
                        </button>

                    </form>

                    
                    <?php if(isset($results)): ?>
                    <div class="results-info">
                        <p>
                            <strong><?php echo e($count); ?></strong> <?php echo e(staticValue('search-found')); ?>

                        </p>
                    </div>
                    <?php endif; ?>
                </div>
                <?php if(isset($results) && $results->count() > 0): ?>
                <div class="search__results">
                    <?php $__currentLoopData = $results; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $result): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php

                            $menu = $menus->firstWhere('id', $result->menu_main_id);

                            $existingViews = [];
                            $urlSegments = [];

                            $parentSlug = null;
                            $childSlug = null;

                            // traverse menu hierarchy
                            while ($menu) {
                                $slug = $menu->slug;
                                array_unshift($urlSegments, $slug);
                                $basePath = 'front.pages.' . $slug;

                                $candidates = [
                                    'root'           => $basePath . '.index',
                                    'inside_detail' => $basePath . '.inside.detail.index',
                                    'inside'         => $basePath . '.inside.index',



                                ];
                                $d = null;
                                foreach ($candidates as $type => $view) {
                                      $d['locale'] =app()->getLocale();
                                    if (\View::exists($view)) {
                                        $existingViews[$type] = $view;

                                        // assign parent/child slug for route params

                                        if ($type === 'root') {
                                            $parentSlug = $slug;
                                            $d['any'] =$slug;

                                        }
                                        if ($type === 'inside') {
                                            if(isset($d['detail'])){
                                                $in = $result->parent?->slug;
                                                if($in){
                                                    $d['inside'] = $in;
                                                }


                                            }else{

                                                 $d['inside'] = $result->slug;
                                            }

                                            $childSlug = $slug;
                                        }
                                        if ($type === 'inside_detail') {
                                            $childSlug = $slug;
                                             $d['detail'] = $result->slug;
                                        }
                                    }
                                }

                                $menu = $menu->parent_id
                                    ? $menus->firstWhere('id', $menu->parent_id)
                                    : null;
                            }



                            $parentSlug = $parentSlug ?? ($urlSegments[0] ?? 'default');
                            $childSlug  = $childSlug ?? ($urlSegments[1] ?? null);

                            $routes = $d;
                             $url = '/' . implode('/', $routes);

                        ?>
                    <?php
//                    $menu = $menus->firstWhere('id', $result->menu_main_id);
//
//                    if ($menu && $menu->parent) {
//                    $childSlug = $menu->slug;
//                    } else {
//                    $childSlug = null;
//                    }
                    ?>

                    <?php if($childSlug): ?>





                        <?php else: ?>




                            <?php endif; ?>
                        <a href="<?php echo e($url); ?>" >
                            <?php if(sectionValue($result, 'title')): ?>
                            <p class="search__results--title">
                                <?php echo e(sectionValue($result, 'title')); ?>

                            </p>
                            <?php endif; ?>
                            <?php if(sectionValue($result, 'description')): ?>
                            <div class="search__results--desc line-clamp-3 no-tooltip">
                                <?php echo sectionValue($result, 'description'); ?>

                            </div>
                            <?php endif; ?>

                        </a>

                        <?php if(!$loop->last): ?>
                        <hr class="result-separator">
                        <?php endif; ?>

                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                </div>
                <?php elseif(isset($results) && $results->count() == 0): ?>
                <div class="no-results">
                    <p><?php echo e(staticValue('search-not-found')); ?></p>
                </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/search/index.blade.php ENDPATH**/ ?>