@foreach($menus as $menu)
    @php
        $locale = app()->getLocale();
        $hasChildren = $menu->childrens->count();
        $id = 'submenu_' . $menu->id;
        $link = match ($menu->type) {
            'page' => url($locale . '/' . $menu->slug),
            'url' => $menu->url,
            default => '#',
        };
    @endphp

    <li
        class="{{ $level === 0 ? 'menu-item' : 'submenu-item' }} {{ $hasChildren ? ($level === 0 ? 'menu-item--dropdown' : 'submenu-item--dropdown') : '' }}">
        @if($hasChildren)
            <span class="{{ $level === 0 ? 'menu-link' : 'submenu-link' }}" data-bs-toggle="collapse"
                data-bs-target="#{{ $id }}" aria-expanded="false" aria-controls="{{ $id }}">
                {{ sectionValue($menu, 'title') }}
                <i class="{{ $level === 0 ? 'i-dropdown' : 'i-next' }}"></i>
            </span>

            <ul class="submenu collapse" id="{{ $id }}">
                @include('front.components.menu-item', ['menus' => $menu->childrens, 'level' => $level + 1])
            </ul>
        @else
            <a href="{{ $link }}" class="{{ $level === 0 ? 'menu-link' : 'submenu-link' }}">
                {{ sectionValue($menu, 'title') }}
            </a>
        @endif
    </li>
@endforeach