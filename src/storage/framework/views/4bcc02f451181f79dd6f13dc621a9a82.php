<div class="layout-sidebar">
    <div class="sidebar">
        <div class="sidebar__menu">

            <?php if($currentPage): ?>
                <?php if($currentPage->parent): ?>
                    <?php
                        $category = $currentPage->parent;
                        $categoryLink = $category->type === 'page' ? url(app()->getLocale() . '/' . $category->slug) : '#';
                    ?>
                    <h3 class="sidebar__title" href="<?php echo e($categoryLink); ?>">
                        <span><?php echo e(sectionValue($category, 'title')); ?></span>
                    </h3>
                    <ul class="sidebar__list">
                        <?php $__currentLoopData = $category->children; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php
                                $target = false;

                                if ($menu->type === 'page') {
                                    $link = url(app()->getLocale() . '/' . $menu->slug);
                                } else if ($menu->type === 'url') {
                                    $link = $menu->url;
                                    $target = true;
                                } else {
                                    $link = "#";
                                }

                                $isActive = $menu->id == $currentPage->id;
                            ?>
                            <li class="sidebar__list--item <?php echo e($isActive ? 'active' : ''); ?>">
                                <a class="sidebar__link" <?php if(!$isActive): ?> href="<?php echo e($link); ?>" <?php endif; ?> <?php if($target): ?> target="_blank"
                                rel="noopener noreferrer" <?php endif; ?>>
                                    <span><?php echo e(sectionValue($menu, 'title')); ?></span>
                                </a>
                            </li>

                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                <?php else: ?>

                    <li class="active">
                        <a
                            href="<?php echo e($currentPage->type === 'page' ? url(app()->getLocale() . '/' . $currentPage->slug) : '#'); ?>">
                            <span><?php echo e($currentPage->title); ?></span>
                        </a>
                    </li>
                <?php endif; ?>
            <?php endif; ?>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const dropdownItems = document.querySelectorAll('.sidebar__list--item.has-dropdown');

        dropdownItems.forEach(item => {
            const button = item.querySelector('.sidebar__button');
            const dropdown = item.querySelector('.sidebar__dropdown');

            if (button) {
                button.addEventListener('click', function (e) {
                    e.preventDefault();

                    // Toggle current item
                    item.classList.toggle('open');

                    // Close other dropdowns
                    dropdownItems.forEach(otherItem => {
                        if (otherItem !== item) {
                            otherItem.classList.remove('open');
                        }
                    });
                });
            }
        });
    });
</script><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/components/sidebar.blade.php ENDPATH**/ ?>