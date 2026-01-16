<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="{{ setting('meta_description') }}">
    <meta name="keywords" content="{{ setting('meta_keywords') }}">
    <meta name="author" content="ProEnd">
    <title>Vatandoshlar - {{ setting('title') }}</title>
    <link rel="icon" href="{{ settingImageMain() }}">
    <meta property="og:type" content="website">
    <meta property="og:url" content="{{url()->current()}}">
    <meta property="og:title" content="{{ setting('title') }}">
    <meta property="og:description" content="{{ setting('meta_description') }}">
    <meta property="og:image" content="{{ settingImageMain() }}">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:site_name" content="Vatandoshlar">


    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="{{ asset('front/') }}/assets/libs/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/libs/aos/main.min.css">
    <link rel="stylesheet" href="{{ asset('front/assets/bvi/css/bvi.css') }}">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/libs/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/libs/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/icomoon/style.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/css/main.min.css">
    <script src="{{ asset('front/') }}/assets/libs/aos/main.min.js"></script>
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/fancy-box/fancybox.css">
    <script src="{{ asset('front/') }}/assets/fancy-box/fancybox.umd.js"></script>
    <script src="{{ asset('front/') }}/assets/libs/jquery.min.js"></script>
</head>

@php
    $segments = request()->segments();
@endphp
<body class="{{ count($segments)<=1 ? 'index' : '' }} " >

    @include('front.components.header')
    @yield('body')
    @if(count($segments)>1)
        <div class="layout">
            <div class="container">
                <div class="layout-content">
                    <!-- @@include('components/journal.html') -->
                </div>
                <div class="layout-sidebar">
                    <!-- @@include('components/sidebar1.html') -->
                </div>
            </div>
        </div>
    @endif


    @if(count($segments)<=1)

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
    @include('front.components.footer')
    @yield('script')
</body>



</html>
