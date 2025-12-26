  <header class="header" role="banner">
        <div class="container">
            <a href="{{route('home')}}" class="logo light" aria-label="Home">
                <img src="{{ asset('front/') }}/images/logo.png" alt="Logo" class="header__brand-img" />
                <span>“Vatandoshlar”<br>Jamoat Fondi</span>
            </a>
            @include('front.components.menu')
            @include('front.components.lang')
            <div class="header__search--wrapper">
                <input type="text" class="form-control" placeholder="Qidiruv">
            </div>
            <div class="header__right">

                <button class="header__search--btn">
                    <span class="i-eye"></span>
                </button>
                <button class="header__search--btn" type="button" onclick="toggleSearch()" aria-label="Search">
                    <span class="i-search" aria-hidden="true"></span>
                </button>
                <a class="header__link" href="#">
                    Ramzlarimiz
                </a>
                <a class="header__btn" href="{{ route('home',['locale'=>app()->getlocale(),'any'=>'contacts']) }}">
                    Bog’lanish
                </a>
            </div>

            <button class="header__menu-btn " hidden type="button" data-bs-toggle="offcanvas"
                data-bs-target="#offcanvasMenu" aria-controls="offcanvasMenu" aria-expanded="false">
                <span class="header__burger" aria-hidden="true"></span>
            </button>
        </div>
    </header>