<div class="header__lang">
    @php
        $currentLang = app()->getLocale();
        $activeLang = $langs->firstWhere('code', $currentLang);
    @endphp

    @if($activeLang)
        {{-- Aktiv til tugmasi --}}
        <button data-bs-toggle="dropdown" class="header__lang-btn" type="button" aria-haspopup="true" aria-expanded="false">

            <img src="{{ sectionImages($activeLang, true) }}" alt="{{ $activeLang->code }}">

            {{ $activeLang->name }}
            <span class="i-dropdown"></span>
        </button>

        {{-- Dropdown --}}
        <ul class="dropdown-menu header__lang-dropdown">
            @foreach($langs as $lang)
                @php
                    $route = request()->route();
                    $routeName = $route?->getName();
                    $routeParams = $route ? $route->parameters() : [];

                    $url = $routeName
                        ? route($routeName, array_merge($routeParams, ['locale' => $lang->code]))
                        : url($lang->code);

                    $url = preg_replace('#(?<!:)//#', '/', $url);
                @endphp

                <li class="header__lang-item">
                    <a href="{{ $url }}" class="header__lang-link {{ $lang->code === $currentLang ? 'header__lang-link--active' : '' }}">

                        <img src="{{ sectionImages($lang, true) }}" alt="{{ $lang->code }}">
                        {{ $lang->name }}
                    </a>
                </li>
            @endforeach
        </ul>
    @endif
</div>
