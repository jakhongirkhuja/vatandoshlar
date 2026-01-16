
<script src="https://www.google.com/recaptcha/api.js?onload=onLoadRecaptcha&render=explicit" async defer></script>

<script>
    let recaptchaWidgetId;

    function onLoadRecaptcha() {
        recaptchaWidgetId = grecaptcha.render('recaptcha-container', {
            'sitekey': '6LfsQzUsAAAAADZWvzzEJ40sVpFw5tnK7ML5LR0q',
            'size': 'invisible',
            'callback': function(token) {
                // Submit form after reCAPTCHA is verified
                document.getElementById('myForm').submit();
            }
        });

        document.getElementById('submitBtn').addEventListener('click', function(e) {
            const form = document.getElementById('myForm');

            if (!form.checkValidity()) {
                form.reportValidity();
                return;
            }

            e.preventDefault();

            grecaptcha.execute(recaptchaWidgetId);
        });
    }
</script>
<?php /**PATH /var/www/html/resources/views/front/components/recaptchaHandler.blade.php ENDPATH**/ ?>