<!DOCTYPE html>
<html lang="en">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description"
        content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords"
        content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Админ панель PROEND TEAM </title>
    <link rel="apple-touch-icon" href="{{asset('assets/admin')}}/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon"
        href="{{asset('assets/admin')}}/app-assets/images/ico/proend-icon.png">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="{{asset('assets/admin')}}/app-assets/vendors/css/vendors.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="{{asset('assets/admin')}}/app-assets/css/bootstrap.css">
    <!-- <link rel="stylesheet" type="text/css" href="{{asset('assets/admin')}}/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="{{asset('assets/admin')}}/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="{{asset('assets/admin')}}/app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="{{asset('assets/admin')}}/app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="{{asset('assets/admin')}}/app-assets/css/themes/semi-dark-layout.css"> -->
    <link rel="stylesheet" type="text/css" href="{{asset('assets/admin')}}/assets/css/main.min.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css"
        href="{{asset('assets/admin')}}/app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css"
        href="{{asset('assets/admin')}}/app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="{{asset('assets/admin')}}/app-assets/css/pages/authentication.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="{{asset('assets/admin')}}/assets/css/style.css">
    <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body style="background:white !important">
    <div class="layout login row">

        <div class="login-right col-lg-7">
            <img class="login-right__image" style="object-fit: contain;"
                src="{{asset('assets/admin')}}/app-assets/images/backgrounds/login.png" alt="">
            <div class="login-right__text">
                <h3 class="login-right__title text-white">
                    Добро пожаловать
                </h3>
                <p class="login-right__subtitle text-white">
                    в панель администратора </p>
                <p class="login-right__dev" style="opacity: 1;">
                    <span class="opacity-50">
                        Developed by
                    </span>
                    <a href="https://proend.uz" target="_blank">
                        <img src="{{asset('assets/admin')}}/app-assets/images/logo/proend.svg" width="222" accesskey=""
                            alt="">
                    </a>
                </p>
            </div>
        </div>
        <div class="login-left col-lg-5 " style="backdrop-filter: blur(4px);">
            <div class="login-left__wrapper">
                <a href="https://proend.uz" target="_blank">
                    <img class="login-left__logo" width="222" height="60"
                        src="{{asset('assets/admin')}}/app-assets/images/logo/proend-dark.svg" alt="">
                </a>
                <h3 class="login-left__title">
                    ВХОД В ПАНЕЛЬ PROEND-TEAM CMS
                </h3>
                @if ($errors->any())
                    <ul class="list-group mb-1">
                        @foreach ($errors->all() as $error)
                            <li class="list-group-item list-group-item-danger">{{ $error }}</li>
                        @endforeach
                    </ul>
                @endif
                <form class="login-form" method="post" action="{{ route('loginForm') }}">
                    @csrf
                    <div class="form-icon">
                        <i class="feather icon-user left"></i>
                        <input class="form-control @error('username') border-danger @enderror" type="text" id="username"
                            name="username" placeholder="Логин" required>
                    </div>
                    <div class="form-icon">
                        <i class="feather icon-lock left"></i>
                        <input class="form-control @error('password') border-danger @enderror" type="password"
                            id="password" name="password" placeholder="Пароль" required>
                        <button class="right clickable" type="button" onclick="togglePassword()">
                            <i class="feather icon-eye" id="eye-icon"></i>
                        </button>
                    </div>
                    <div class="form-group d-flex flex-row justify-content-center" style="gap: 15px;">
                        <div class="form-icon" style="flex:1">
                            <i class="feather icon-shield"></i>
                            <input type="text" class="form-control   @error('captcha') border-danger @enderror"
                                placeholder="Капча" name="captcha" required>
                        </div>

                        <div class="captcha d-flex align-items-center justify-content-center " style="gap: 15px;">
                            <span class="rounded" style="width: 160px;">{!! captcha_img('default') !!}</span>
                            <div class="reload rounded" id="reload">
                                <i class="fa fa-refresh ref_button vi-nopart" aria-hidden="true"></i>
                            </div>
                        </div>

                    </div>
                    <button class="button btn btn-primary btn-block" type="submit">
                        Вход в систему
                    </button>
                </form>
            </div>
            <p class="login-left__copy">© Copyright <span id="year"></span>, PROEND-TEAM</p>
        </div>
    </div>


    <!-- BEGIN: Vendor JS-->
    <script src="{{asset('assets/admin')}}/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="{{asset('assets/admin')}}/app-assets/js/core/app-menu.js"></script>
    <script src="{{asset('assets/admin')}}/app-assets/js/core/app.js"></script>
    <script src="{{asset('assets/admin')}}/app-assets/js/scripts/components.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <!-- END: Page JS-->

    <script>
        // Toggle password visibility
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const eyeIcon = document.getElementById('eye-icon');

            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                eyeIcon.className = 'feather icon-eye-off';
            } else {
                passwordInput.type = 'password';
                eyeIcon.className = 'feather icon-eye';
            }
        }

        // Set current year in copyright
        document.getElementById('year').textContent = new Date().getFullYear();

        // Captcha reload
        $('#reload').click(function () {
            $.ajax({
                type: 'GET',
                url: "{{ route('reload.captcha') }}",
                success: function (data) {
                    $('.captcha span').html(data.captcha);
                },
                error: function () {
                    alert('Captcha reload failed');
                }
            });
        });
    </script>

</body>
<!-- END: Body-->

</html>