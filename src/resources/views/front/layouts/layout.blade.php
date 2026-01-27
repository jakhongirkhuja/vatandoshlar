<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="{{ setting('meta_description') }}">
    <meta name="keywords" content="{{ setting('meta_keywords') }}">
    <meta name="author" content="ProEnd">
    @if (isset($title))
        @php
            $tit = $title;
        @endphp
    @else
        @php
            $tit = setting('title');
        @endphp
    @endif
    @if (isset($desc))
        @php
            $descript = strip_tags($desc);
        @endphp
    @else
        @php
            $descript = setting('meta_description');
        @endphp
    @endif
    <title>{{$tit}}</title>
    <link rel="icon" href="{{ settingImageMain(true) }}">
    <link rel="icon2222" href="{{ settingImageMain(false) }}">
    <meta property="og:type" content="website">
    <meta property="og:url" content="{{url()->current()}}">
    <meta property="og:title" content="{{$tit}}">
    <meta property="og:description" content="{{ $descript }}">

    <meta property="og:image" content="{{ (isset($image) && $image) ? url($image) : settingImageMain() }}">
    <meta property="og:image:secure_url" content="{{ (isset($image) && $image) ? url($image) : settingImageMain() }}">
    <meta property="og:image:width" content="200">
    <meta property="og:image:height" content="200">
    <meta property="og:site_name" content="{{setting('title')}}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="{{ asset('front/') }}/assets/libs/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/libs/aos/main.min.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/bvi/css/bvi.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/libs/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/libs/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/icomoon/style.css">
    <link rel="stylesheet"
        href="{{ asset('front/') }}/css/main.min.css?v={{ filemtime(public_path('front/css/main.min.css')) }}">
    <script src="{{ asset('front/') }}/assets/libs/aos/main.min.js"></script>
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/fancy-box/fancybox.css">
    <script src="{{ asset('front/') }}/assets/fancy-box/fancybox.umd.js"></script>
    <script src="{{ asset('front/') }}/assets/libs/jquery.min.js"></script>
</head>

@php
    $segments = request()->segments();
@endphp

<body class="{{ count($segments) <= 1 ? 'index' : '' }} ">

    @include('front.components.header')
    @yield('body')
    @if(count($segments) <= 1)

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const header = document.querySelector('.header');
                if (!header) return;
                function onScroll() {
                    header.classList.toggle('light', window.scrollY <= 30);
                }

                onScroll();
                window.addEventListener('scroll', onScroll);
            });

        </script>
    @endif
    <style>
        .rht_icon_wrapper_element.gsp_ic_l.ss_rht_b_i_opened{
            display: none;
        }
    </style>
    <div class="gsp_button_player"></div>
    <script async src="https://widget.gspeech.io/96ccb9c2672e19a787589eb1961ffd82?v=1"></script>
    @include('front.components.footer')
    @yield('script')
</body>



</html>
