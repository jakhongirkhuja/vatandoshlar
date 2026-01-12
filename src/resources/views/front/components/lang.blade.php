<div class="header__lang">
    @php
        $currentLang = app()->getLocale();
        $activeLang = $langs->firstWhere('code', $currentLang);
    @endphp

    <button data-bs-toggle="dropdown" class="header__lang-btn" type="button" aria-haspopup="true" aria-expanded="false">

        <img src="{{ asset('front/images/flag-' . ($activeLang->code ?? 'uz') . '.png') }}"
             alt="{{ $activeLang->code ?? 'uz' }}">

        {{ $activeLang->short_name ?? "O'zb" }}
        <span class="i-dropdown"></span>
    </button>
    <ul class="dropdown-menu header__lang-dropdown">
        @foreach($langs as $lang)
            <li class="header__lang-item">
                <a href="{{ route(
                        request()->route()->getName(),
                        array_merge(request()->route()->parameters(), ['locale' => $lang->code])
                    ) }}"
                   class="header__lang-link {{ $lang->code === $currentLang ? 'header__lang-link--active' : '' }}">
                    <img src="{{ asset('front/images/flag-' . $lang->code . '.png') }}" alt="{{ $lang->code }}">
                    {{ $lang->short_name }}
                </a>
            </li>
        @endforeach
    </ul>
</div>
