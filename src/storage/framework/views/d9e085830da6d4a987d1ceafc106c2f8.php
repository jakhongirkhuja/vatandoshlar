<div class="header__lang">
    <?php
        $currentLang = app()->getLocale();
        $activeLang = $langs->firstWhere('code', $currentLang);

    ?>

    <button data-bs-toggle="dropdown" class="header__lang-btn" type="button" aria-haspopup="true" aria-expanded="false">

        <img src="<?php echo e(asset('front/images/flag-' . ($activeLang->code ?? 'uz') . '.png')); ?>"
             alt="<?php echo e($activeLang->code ?? 'uz'); ?>">

        <?php echo e($activeLang->short_name ?? "O'zb"); ?>

        <span class="i-dropdown"></span>
    </button>
    <?php if(count($langs)>0): ?>
    <ul class="dropdown-menu header__lang-dropdown">
        <?php $__currentLoopData = $langs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $lang): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <li class="header__lang-item">
                <a href="<?php echo e(route(
                        request()->route()->getName(),
                        array_merge(request()->route()->parameters(), ['locale' => $lang->code])
                    )); ?>"
                   class="header__lang-link <?php echo e($lang->code === $currentLang ? 'header__lang-link--active' : ''); ?>">
                    <img src="<?php echo e(sectionImages($lang, true)); ?>" alt="<?php echo e($lang->code); ?>">
                    <?php echo e($lang->short_name); ?>

                </a>
            </li>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </ul>
        <?php endif; ?>
</div>
<?php /**PATH /var/www/html/resources/views/front/components/lang.blade.php ENDPATH**/ ?>