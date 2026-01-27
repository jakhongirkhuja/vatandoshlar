<header class="header" role="banner">
    <div class="container">
        <a href="<?php echo e(route('home', ['locale' => app()->getLocale()])); ?>" class="logo" aria-label="Home">
            <img src="<?php echo e(asset('front/')); ?>/images/logo.png" alt="Logo" class="header__brand-img" />
            <span><?php echo e(staticValue('vatandoshlar')); ?><br><?php echo e(staticValue('vatandoshlar', 'content')); ?></span>
        </a>
        <ul class="header__menu">
            <?php $__currentLoopData = $headerMenu; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php
                    $locale = app()->getLocale();
                    $link = match ($menu->type) {
                        'page' => url($locale . '/' . $menu->slug),
                        'url' => $menu->url,
                        'category', 'section' => '#',
                        default => '#',
                    };
                ?>

                <li class="header__submenu-item <?php echo e($menu->childrens->count() ? 'header__menu-item--dropdown' : ''); ?>">

                    <?php if($menu->childrens->count()): ?>
                        <a href="<?php echo e($link); ?>" class="header__menu-link">
                            <?php echo e(sectionValue($menu, 'title')); ?>

                            <?php if($menu->childrens->count()): ?>
                                <i class="i-dropdown bi bi-chevron-down toggle-dropdown"></i>
                            <?php endif; ?>
                        </a>
                    <?php else: ?>
                        <a href="<?php echo e($link); ?>">
                            <span class="header__submenu-link"><?php echo e(sectionValue($menu, 'title')); ?></span>
                        </a>
                    <?php endif; ?>

                    </a>

                    <?php if($menu->childrens->count()): ?>
                        <ul class="header__submenu">
                            <?php echo $__env->make('front.components.navbar-item', ['menus' => $menu->childrens], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

                        </ul>
                    <?php endif; ?>

                </li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </ul>
        <?php echo $__env->make('front.components.lang', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        <form action="<?php echo e(route('search', ['locale' => app()->getLocale()])); ?>" method="post"
            class="header__search--wrapper">
            <?php echo csrf_field(); ?>
            <input type="text" class="form-control" required name="search" placeholder="<?php echo e(staticValue('search')); ?>">
            <button type="submit" class="header__search--btn"><i class="i-search"></i> </button>
        </form>
        <div class="header__right">
            <button class="header__search--btn bvi-open" title="Visibility">
                <span class="i-eye"></span>
            </button>
            <button class="header__search--btn" id="header__search--btn" type="button" onclick="toggleSearch()"
                aria-label="Search">
                <i class="i-search" aria-hidden="true"></i>
            </button>
            <!-- <div class="col-md-6">
                <div class="form-group">
                    <form method="get" action="<?php echo e(route('search', ['locale' => app()->getLocale()])); ?>">
                        <div class="input-group">
                            <input class="form-control" placeholder="Search...">
                            <button type="submit" class="btn btn-primary">Search</button>
                        </div>
                    </form>
                </div>
            </div> -->
            <?php
                $contact = menuSection(44)
            ?>
            <a class="header__btn"
                href="<?php echo e(route('home', ['locale' => app()->getlocale(), 'any' => $contact->slug ?? Str::slug($contact->title)])); ?>">
                <?php echo e(staticValue('contacts_header')); ?>

            </a>
        </div>

        <button class="header__menu-btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMenu"
            aria-controls="offcanvasMenu" aria-expanded="false">
            <i class="i-menu" aria-hidden="true"></i>
        </button>
    </div>
</header>
<?php echo $__env->make('front.components.menu', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/components/header.blade.php ENDPATH**/ ?>