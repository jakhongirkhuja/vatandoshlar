<header class="header" role="banner">
    <div class="container">
        <a href="{{route('home',['locale' => app()->getLocale()])}}" class="logo" aria-label="Home">
            <img src="{{ asset('front/') }}/images/logo.png" alt="Logo" class="header__brand-img" />
            <span>“Vatandoshlar”<br>Jamoat Fondi</span>
        </a>
        @include('front.components.menu')
        @include('front.components.lang')
        <div class="header__search--wrapper">
            <input type="text" class="form-control" placeholder="Qidiruv">
        </div>
        <div class="header__right">

            <button class="header__search--btn bvi-open"  title="Visibility">
                <span class="i-eye" ></span>
            </button>
        <div class="col-md-6">
            <div class="form-group">
                <form method="get" action="{{ route('search') }}" >
                    <div class="input-group">
                        <input class="form-control" name="search" placeholder="Search...">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </form>
            </div>
        </div>
            <a class="header__link" style="display: none;" href="#">
                Ramzlarimiz
            </a>
            @php
                $contact = menuSection(44)
            @endphp
            <a class="header__btn"
                href="{{ route('home', ['locale' => app()->getlocale(), 'any' => $contact->slug ?? Str::slug($contact->title)]) }}">

                Bog’lanish
            </a>
        </div>

        <button class="header__menu-btn " hidden type="button" data-bs-toggle="offcanvas"
            data-bs-target="#offcanvasMenu" aria-controls="offcanvasMenu" aria-expanded="false">
            <span class="header__burger" aria-hidden="true"></span>
        </button>
    </div>
</header>
