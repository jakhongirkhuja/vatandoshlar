<ul class="header__menu">
    @foreach($headerMenu as $menu)
        @php
            $locale = app()->getLocale();
            $link = match ($menu->type) {
                'page' => url($locale . '/' . $menu->slug),
                'url' => $menu->url,
                'category', 'section' => '#',
                default => '#',
            };
            $targetBlank = $menu->type === 'url' && is_string($menu->url) && str_starts_with($menu->url, 'https');
        @endphp

        <li class="header__submenu-item {{ $menu->childrens->count() ? 'header__menu-item--dropdown' : '' }}">

            @if($menu->childrens->count())
                <a href="{{ $link }}" class="header__menu-link" @if($targetBlank) target="_blank" rel="noopener" @endif>
                    {{ sectionValue($menu, 'title') }}
                    @if($menu->childrens->count())
                        <i class="i-dropdown bi bi-chevron-down toggle-dropdown"></i>
                    @endif
                </a>
            @else
                <a href="{{ $link }}" @if($targetBlank) target="_blank" rel="noopener" @endif>
                    <span class="header__submenu-link">{{ sectionValue($menu, 'title') }}</span>
                </a>
            @endif
            @if($menu->childrens->count())
                <ul class="header__submenu">
                    @include('front.components.navbar', ['headerMenu' => $menu->childrens])

                </ul>
            @endif

        </li>
    @endforeach
</ul>