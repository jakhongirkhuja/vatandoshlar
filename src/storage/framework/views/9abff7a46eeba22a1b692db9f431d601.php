<div class="header__lang">
    <?php
        $currentLang = app()->getLocale();
        $activeLang = $langs->firstWhere('code', $currentLang);
    ?>

    <?php if($activeLang): ?>
        
        <button data-bs-toggle="dropdown" class="header__lang-btn" type="button" aria-haspopup="true" aria-expanded="false">

            <img src="<?php echo e(sectionImages($activeLang, true)); ?>" alt="<?php echo e($activeLang->code); ?>">

            <?php echo e($activeLang->short_name); ?>

            <span class="i-dropdown"></span>
        </button>

        
        <ul class="dropdown-menu header__lang-dropdown">
            <?php $__currentLoopData = $langs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $lang): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php
                    $route = request()->route();
                    $routeName = $route?->getName();
                    $routeParams = $route ? $route->parameters() : [];

                    $url = $routeName
                        ? route($routeName, array_merge($routeParams, ['locale' => $lang->code]))
                        : url($lang->code);

                    $url = preg_replace('#(?<!:)//#', '/', $url);
                ?>

                <li class="header__lang-item">
                    <a href="<?php echo e($url); ?>" class="header__lang-link <?php echo e($lang->code === $currentLang ? 'header__lang-link--active' : ''); ?>">

                        <img src="<?php echo e(sectionImages($lang, true)); ?>" alt="<?php echo e($lang->code); ?>">
                        <?php echo e($lang->short_name); ?>

                    </a>
                </li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </ul>
    <?php endif; ?>
</div><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/components/lang.blade.php ENDPATH**/ ?>