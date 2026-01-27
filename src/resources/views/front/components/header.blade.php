<header class="header" role="banner">
    <div class="container">
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
        <form action="{{ route('search', ['locale' => app()->getLocale()]) }}" method="post"
            class="header__search--wrapper">
            @csrf
            <input type="text" class="form-control" required name="search" placeholder="{{staticValue('search')}}">
            <button type="submit" class="header__search--btn"><i class="i-search"></i> </button>
        </form>
        <div class="header__right">
            <button class="header__search--btn bvi-open" title="Visibility">
                <span class="i-eye"></span>
            </button>
            <button class="header__search--btn" id="header__search--btn" type="button" onclick="toggleSearch()"
                aria-label="Search">
                <i class="i-search" aria-hidden="true"></i>
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
            <a class="header__btn"
                href="{{ route('home', ['locale' => app()->getlocale(), 'any' => $contact->slug ?? Str::slug($contact->title)]) }}">
                {{staticValue('contacts_header')}}
            </a>
        </div>

        <button class="header__menu-btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMenu"
            aria-controls="offcanvasMenu" aria-expanded="false">
            <i class="i-menu" aria-hidden="true"></i>
        </button>
    </div>
</header>
@include('front.components.menu')