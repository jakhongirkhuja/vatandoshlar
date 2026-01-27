<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasMenu"
    aria-labelledby="offcanvasMenuLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasMenuLabel"><?php echo e(staticValue('menu')); ?></h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </div>

    <div class="offcanvas-body">
        <ul class="menu">
            <?php echo $__env->make('front.components.menu-item', ['menus' => $headerMenu, 'level' => 0], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        </ul>
    </div>
</div><?php /**PATH /var/www/html/resources/views/front/components/menu.blade.php ENDPATH**/ ?>