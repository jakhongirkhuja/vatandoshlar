@php
    $testMode = staticValue('test-mode');

@endphp

@if($testMode)
    <div class="test  " data-marquee-text="{{ $testMode }}" data-gap="200">
        <div class="test__marquee">
            <div class="test__marquee-track"></div>
        </div>
    </div>
@endif
<script>
    (function () {
        const root = document.querySelector('.test');
        if (!root) return;

        const track = root.querySelector('.test__marquee-track');
        if (!track) return;

        const text = root.getAttribute('data-marquee-text') || '';
        const gap = parseInt(root.getAttribute('data-gap') || '200', 10);
        const groupCount = 2;

        const measure = document.createElement('span');
        measure.style.position = 'absolute';
        measure.style.visibility = 'hidden';
        measure.style.whiteSpace = 'nowrap';
        measure.textContent = text;
        document.body.appendChild(measure);

        const textWidth = measure.getBoundingClientRect().width || 1;
        const itemWidth = textWidth + gap;
        const viewportWidth = window.innerWidth || 1;
        const repeatsPerGroup = Math.max(3, Math.ceil(viewportWidth / itemWidth) + 2);

        measure.remove();

        const fragment = document.createDocumentFragment();
        for (let g = 0; g < groupCount; g += 1) {
            const group = document.createElement('div');
            group.className = 'test__marquee-group';
            group.style.display = 'inline-flex';
            group.style.gap = `${gap}px`;

            for (let i = 0; i < repeatsPerGroup; i += 1) {
                const span = document.createElement('span');
                span.textContent = text;
                group.appendChild(span);
            }

            fragment.appendChild(group);
        }

        track.appendChild(fragment);
    })();
</script>

<header class="header" role="banner">
    <div class=" container">
        <a href="{{route('home', ['locale' => app()->getLocale()])}}" class="logo" aria-label="Home">
            <img src="{{ asset('front/') }}/images/logo.png" alt="Logo" class="header__brand-img" />
            <span>{{staticValue('vatandoshlar')}}<br>{{staticValue('vatandoshlar', 'content')}}</span>
        </a>
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

                    if ($link === '#' && $menu->type === 'category' && $menu->childrens->count()) {
                        $firstChild = $menu->childrens->first();
                        $link = match ($firstChild->type) {
                            'page' => url($locale . '/' . $firstChild->slug),
                            'url' => $firstChild->url,
                            'category', 'section' => '#',
                            default => '#',
                        };
                    }
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
        </ul>
        @include('front.components.lang')
        <form action="{{ route('search', ['locale' => app()->getLocale()]) }}" method="post" class="header__search--wrapper">
            @csrf
            <input type="text" class="form-control" required name="search" placeholder="{{staticValue('search')}}">
            <button type="submit" class="header__search--btn"><i class="i-search"></i> </button>
        </form>
        <div class="header__right">
            <button class="header__search--btn accessibility-btn" id="header__search--btn" type="button" onclick="toggleSearch()" aria-label="Search">
                <i class="i-search" aria-hidden="true"></i>
            </button>
            <button class="header__search--btn bvi-open" title="Visibility">
                <span class="i-eye"></span>
            </button>

            <!-- <div class="col-md-6">
                <div class="form-group">
                    <form method="get" action="{{ route('search', ['locale' => app()->getLocale()]) }}">
                        <div class="input-group">
                            <input class="form-control" placeholder="Search...">
                            <button type="submit" class="btn btn-primary">Search</button>
                        </div>
                    </form>
                </div>
            </div> -->
            @php
                $contact = menuSection(44)
            @endphp
            <a class="header__btn button" href="{{ route('home', ['locale' => app()->getlocale(), 'any' => $contact->slug ?? Str::slug($contact->title)]) }}">
                {{staticValue('contacts_header')}}
            </a>
        </div>

        <button class="header__menu-btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMenu" aria-controls="offcanvasMenu" aria-expanded="false">
            <i class="i-menu" aria-hidden="true"></i>
        </button>
    </div>
</header>
@include('front.components.menu')