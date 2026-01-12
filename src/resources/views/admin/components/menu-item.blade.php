@php
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
@endphp
@if($menu->show_admin)
<li class="nav-item {{ $menu->children->isNotEmpty() ? 'has-sub' : '' }}
    {{ (int) request()->route('id') === (int) $menu->id ? 'active' : '' }}">

    @if($menu->children->isEmpty())
    <a href="{{ $route }}" @if($menu->type === 'url') target="_blank" @endif>
        <i class="feather {{ $menu->icon ?? $defaultIcon }}"></i>
        <span class="menu-title">
            {{ $menu->getTitle($menu->translations, app()->getLocale()) }}
        </span>
    </a>
    @else
    <a href="javascript:void(0)">
        <i class="feather {{ $menu->icon ?? 'icon-menu' }}"></i>
        <span class="menu-title">
            {{ $menu->getTitle($menu->translations, app()->getLocale()) }}
        </span>
    </a>

    <ul class="menu-content">
        @foreach($menu->children as $child)
        @include('admin.components.menu-item', [
        'menu' => $child,
        'slug' => $currentSlug
        ])
        @endforeach
    </ul>
    @endif
</li>
@endif
