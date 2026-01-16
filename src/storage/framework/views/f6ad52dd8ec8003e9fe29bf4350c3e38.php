<?php $__env->startSection('body'); ?>
    <div class="layout">
        <div class="container">
            <div class="search-page w-100" style="margin-top: 8rem;">

                <div class="search-header">

                </div>
                <div class="search-content">

                    <div class="search-box">
                        <form action="<?php echo e(route('search', ['locale' => app()->getLocale()])); ?>" method="GET"
                              class="search-form">
                            <div class="input-group w-100">
                                <div class="row w-100">
                                    <div class="col-md-10">
                                        <input type="text" name="search" class="form-control"
                                               placeholder="Qidiruv so'zingizni kiriting" value="<?php echo e($search ?? ''); ?>"
                                               required>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="submit"
                                                class="btn btn-secondary"><?php echo e(staticValue('search')); ?></button>
                                    </div>
                                </div>


                            </div>
                        </form>

                    </div>
                    <?php if($results->count() > 0): ?>
                        <div class="results-list mt-3">
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

                                
                                <a href="<?php echo e($url); ?>" class="p-2">
                                    <div class="result-item">
                                        <h5 class="result-title">
                                            <?php echo e(sectionValue($result, 'title')); ?>

                                        </h5>
                                    </div>
                                </a>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>


                        </div>
                        <div class="results-info mt-3">
                            <p>
                                «<strong><?php echo e($search); ?></strong>» qidiruv bo'yicha,
                                <strong><?php echo e($count); ?></strong> ta natija topildi:
                            </p>
                        </div>
                    <?php else: ?>
                        <div class="no-results">
                            <p>Hech qanday natija topilmadi</p>
                        </div>
                    <?php endif; ?>


                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/search/index.blade.php ENDPATH**/ ?>