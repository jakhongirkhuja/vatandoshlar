@foreach($menus as $menu)
    @php
        $locale = app()->getLocale();
        $link = match ($menu->type) {
            'page' => url($locale . '/' . $menu->slug),
            'url' => $menu->url,
            'category', 'section' => '#',
            default => '#',
        };
    @endphp

    <li class="header__submenu-item {{ $menu->childrens->count() ? 'header__menu-item--dropdown' : '' }}">

        @if($menu->childrens->count())
            <a href="{{ $link }}" class="header__menu-link">
                {{ sectionValue($menu, 'title') }}
                @if($menu->childrens->count())
                    <i class="i-dropdown bi bi-chevron-down toggle-dropdown"></i>
                @endif
            </a>
        @else
            <a href="{{ $link }}">
                <span class="header__submenu-link">{{ sectionValue($menu, 'title') }}</span>
            </a>
        @endif

        </a>

        @if($menu->childrens->count())
            <ul class="header__submenu">
                @include('front.components.navbar-item', ['menus' => $menu->childrens])

            </ul>
        @endif

    </li>
@endforeach