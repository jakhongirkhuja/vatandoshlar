<?php
if (auth()->user()->role_id != 1 && !in_array($menu->id, $permissionMenus)) {
return;
}

$slug = $slug ?? null;
$currentSlug = $menu->slug ?: $slug;

$route = '#';
$defaultIcon = 'icon-menu';

if ($menu->type === 'page' && !empty($menu->slug)) {
$route = route('admin.pages.section.index', [
'slug' => $menu->slug,
'id' => $menu->id,
]);
$defaultIcon = 'icon-globe';

} elseif ($menu->type === 'section' && $currentSlug) {
$route = route('admin.pages.section.index', [
'slug' => $currentSlug,
'id' => $menu->id,
]);
$defaultIcon = 'icon-circle';

} elseif ($menu->type === 'url' && !empty($menu->url)) {
$route = $menu->url;
$defaultIcon = 'icon-external-link';

} elseif ($menu->type === 'category') {
$route = '#';
$defaultIcon = 'corner-down-right';
}
?>
<?php if($menu->show_admin): ?>
<li class="nav-item <?php echo e($menu->children->isNotEmpty() ? 'has-sub' : ''); ?>

    <?php echo e((int) request()->route('id') === (int) $menu->id && request()->route('slug')? 'active' : ''); ?>">
    <?php if($menu->children->isEmpty()): ?>
    <a href="<?php echo e($route); ?>" <?php if($menu->type === 'url'): ?> target="_blank" <?php endif; ?>>
        <i class="feather <?php echo e($menu->icon ?? $defaultIcon); ?>"></i>
        <span class="menu-title">
            <?php echo e($menu->getTitle($menu->translations, app()->getLocale())); ?>

        </span>
    </a>
    <?php else: ?>
    <a href="javascript:void(0)">
        <i class="feather <?php echo e($menu->icon ?? 'icon-menu'); ?>"></i>
        <span class="menu-title">
            <?php echo e($menu->getTitle($menu->translations, app()->getLocale())); ?>

        </span>
    </a>

    <ul class="menu-content">
        <?php $__currentLoopData = $menu->children; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $child): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <?php echo $__env->make('admin.components.menu-item', [
        'menu' => $child,
        'slug' => $currentSlug
        ], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </ul>
    <?php endif; ?>
</li>
<?php endif; ?>
<?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/admin/components/menu-item.blade.php ENDPATH**/ ?>