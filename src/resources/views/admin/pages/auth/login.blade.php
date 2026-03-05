<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="author" content="PROEND TEAM" />
    <title>Proend Team CMS — Вход</title>
    <link rel="preload" href="{{ asset('assets/admin/assets/fonts/stylesheet.css') }}" as="style" />
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/admin/assets/fonts/stylesheet.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{asset('assets/admin')}}/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/fonts/font-awesome/css/font-awesome.min.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/admin/assets/css/style.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/admin/assets/css/main.css') }}?v={{ time() }}" />
    <link rel="icon" type="text/css" href="{{ asset('assets/admin/assets/images/favicon.svg') }}" />
</head>

<body>
    <main class="page">
        <img src="{{ asset('assets/admin/assets/images/proend-dark.svg') }}" class="proend " alt="Proend" />
        <section class="login-panel">
            <form class="card" method="post" action="{{ route('loginForm') }}">
                @csrf
                <h2>Добро пожаловать в панель администратора </h2>

                @if ($errors->any())
                    <ul class="list-group mb-1">
                        @foreach ($errors->all() as $error)
                            <li class="list-group-item list-group-item-danger">{{ $error }}</li>
                        @endforeach
                    </ul>
                @endif

                <div class="field">
                    <label for="username">Имя пользователя</label>
                    <div class="input-wrapper">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M9.99998 9.99996C12.3012 9.99996 14.1666 8.13448 14.1666 5.83329C14.1666 3.53211 12.3012 1.66663 9.99998 1.66663C7.69879 1.66663 5.83331 3.53211 5.83331 5.83329C5.83331 8.13448 7.69879 9.99996 9.99998 9.99996Z"
                                stroke="#64748B" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                            <path d="M17.1583 18.3333C17.1583 15.1083 13.95 12.5 10 12.5C6.05001 12.5 2.84167 15.1083 2.84167 18.3333" stroke="#64748B" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>

                        <input class="input @error('username') border-danger @enderror" type="text" id="username" name="username" placeholder="Имя пользователя" required minlength="3" />
                    </div>
                </div>

                <div class="field">
                    <label for="password">Пароль</label>
                    <div class="input-wrapper">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M5 8.33329V6.66663C5 3.90829 5.83333 1.66663 10 1.66663C14.1667 1.66663 15 3.90829 15 6.66663V8.33329" stroke="#64748B" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                            <path d="M10 15.4167C11.1506 15.4167 12.0834 14.4839 12.0834 13.3333C12.0834 12.1827 11.1506 11.25 10 11.25C8.84943 11.25 7.91669 12.1827 7.91669 13.3333C7.91669 14.4839 8.84943 15.4167 10 15.4167Z"
                                stroke="#64748B" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                            <path
                                d="M14.1667 18.3334H5.83335C2.50002 18.3334 1.66669 17.5 1.66669 14.1667V12.5C1.66669 9.16671 2.50002 8.33337 5.83335 8.33337H14.1667C17.5 8.33337 18.3334 9.16671 18.3334 12.5V14.1667C18.3334 17.5 17.5 18.3334 14.1667 18.3334Z"
                                stroke="#64748B" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>

                        <input class="input @error('password') border-danger @enderror" type="password" id="password" name="password" placeholder="Пароль" required minlength="6" />
                        <button class="right clickable" type="button" onclick="togglePassword()">
                            <i class="fa fa-eye" id="eye-icon" style="pointer-events: none;">
                            </i>
                        </button>
                    </div>
                </div>
                <div class="field">
                    <label for="captcha">Капча</label>
                    <div class="field-wrapper">
                        <div class="input-wrapper">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M8.74167 1.8583L4.58334 3.42497C3.62501 3.7833 2.84167 4.91663 2.84167 5.9333V12.125C2.84167 13.1083 3.49167 14.4 4.28334 14.9916L7.86667 17.6666C9.04167 18.55 10.975 18.55 12.15 17.6666L15.7333 14.9916C16.525 14.4 17.175 13.1083 17.175 12.125V5.9333C17.175 4.9083 16.3917 3.77497 15.4333 3.41663L11.275 1.8583C10.5667 1.59997 9.43334 1.59997 8.74167 1.8583Z"
                                    stroke="#64748B" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                <path
                                    d="M9.99998 10.4167C10.9205 10.4167 11.6666 9.67052 11.6666 8.75004C11.6666 7.82957 10.9205 7.08337 9.99998 7.08337C9.07951 7.08337 8.33331 7.82957 8.33331 8.75004C8.33331 9.67052 9.07951 10.4167 9.99998 10.4167Z"
                                    stroke="#64748B" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round" />
                                <path d="M10 10.4166V12.9166" stroke="#64748B" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round" />
                            </svg>
                            <input class="input" type="text" id="captcha" name="captcha" placeholder="Капча" value="" required minlength="4" />

                        </div>
                        <div class="captcha-image">
                            {!! captcha_img('default') !!}
                        </div>

                        <button id="reload" type="button" class="captcha-refresh reload rounded">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M18.3333 9.99996C18.3333 14.6 14.6 18.3333 9.99996 18.3333C5.39996 18.3333 2.59163 13.7 2.59163 13.7M2.59163 13.7H6.35829M2.59163 13.7V17.8666M1.66663 9.99996C1.66663 5.39996 5.36663 1.66663 9.99996 1.66663C15.5583 1.66663 18.3333 6.29996 18.3333 6.29996M18.3333 6.29996V2.13329M18.3333 6.29996H14.6333"
                                    stroke="#008DD3" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                            </svg>
                        </button>
                    </div>
                </div>
                <button class="btn" type="submit">Войти</button>
                <div class="footer">Разработано:
                    <a href="https://proend.uz" target="_blank"><img src="{{ asset('assets/admin/assets/images/proend-dark.svg') }}" alt="Proend" /></a>
                </div>
            </form>
        </section>
        <div class="copyright">© Copyright {{ date('Y') }}, PROEND-TEAM</div>
    </main>
</body>

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
            eyeIcon.className = 'fa fa-eye-slash';
        } else {
            passwordInput.type = 'password';
            eyeIcon.className = 'fa fa-eye';
        }
    }
    // Captcha reload
    $('#reload').click(function () {
        console.log('Reloading captcha...');
        $.ajax({
            type: 'GET',
            url: "{{ route('reload.captcha') }}",
            success: function (data) {
                $('.captcha-image').html(data.captcha);
            },
            error: function () {
                alert('Captcha reload failed');
            }
        });
    });
</script>

</html>