<script src="https://www.google.com/recaptcha/api.js?onload=onLoadRecaptcha&render=explicit" async defer></script>

<script>
    let recaptchaWidgetId;
    let isRecaptchaVerified = false;

    function onLoadRecaptcha() {
        console.log('recaptcha script loaded');
        recaptchaWidgetId = grecaptcha.render('recaptcha-container', {
            // 'sitekey': '6LfsQzUsAAAAADZWvzzEJ40sVpFw5tnK7ML5LR0q',
            'sitekey': '6Lf7y1MsAAAAAI0ueJhLqjb5oADsWMRlwv4aC0S3',
            'size': 'invisible',
            'callback': function () {
                const form = document.getElementById('myForm');
                if (!form) {
                    console.error('reCAPTCHA: form not found');
                    return;
                }

                isRecaptchaVerified = true;
                form.submit();
            }
        });

        const form = document.getElementById('myForm');
        if (!form) {
            console.error('reCAPTCHA: form not found');
            return;
        }

        form.addEventListener('submit', function (e) {
            e.preventDefault();
            // if (isRecaptchaVerified) {
            //     return;
            // }


            if (!form.checkValidity()) {
                form.reportValidity();
                return;
            }

            if (typeof grecaptcha !== 'undefined' && recaptchaWidgetId !== undefined) {
                grecaptcha.execute(recaptchaWidgetId);
            } else {
                console.error('reCAPTCHA: grecaptcha not ready');
            }
        });
    }
</script>