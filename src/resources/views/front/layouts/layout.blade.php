<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Vatandoshlar Jamoat Fondi rasmiy veb-sayti">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="{{ asset('front/') }}/images/logo.png">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/libs/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/libs/aos/main.min.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/libs/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/libs/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/fonts/stylesheet.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/icomoon/style.css">
    <link rel="stylesheet" href="{{ asset('front/') }}/css/main.min.css">
    <script src="{{ asset('front/') }}/assets/libs/aos/main.min.js"></script>
    <link rel="stylesheet" href="{{ asset('front/') }}/assets/fancy-box/fancybox.css">
    <script src="{{ asset('front/') }}/assets/fancy-box/fancybox.umd.js"></script>

    <title>“Vatandoshlar”Jamoat Fondi</title>
</head>


<body class="{{ is_current_route('home') ? 'index' : '' }}">

    @include('front.components.header')
    @yield('body')
    @if(!is_current_route('home'))
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

    @if(is_current_route('home'))

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

</body>



</html>