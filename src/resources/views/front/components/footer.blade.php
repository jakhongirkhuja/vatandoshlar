<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col">
                <a href="/" class="logo light" aria-label="Home">
                    <img src="{{ asset('front/') }}/images/logo.png" alt="Logo" class="header__brand-img" />
                    <span>{{staticValue('vatandoshlar')}}<br>{{ staticValue('vatandoshlar', 'content') }}</span>
                </a>
                <p class="footer__text">
                    {{staticValue('agency')}}
                </p>
            </div>
            <div class="col">
                <div class="footer__items">
                    <div class="footer__item">
                        <a href="tel:{{staticValue('phone', 'description')}}" class="footer__item-value">{{staticValue('phone', 'description')}}</a>
                        <span class="footer__item-label">{{staticValue('phone')}}</span>
                    </div>
                    <div class="footer__item">
                        <a href="mailto:{{staticValue('email', 'description')}}" class="footer__item-value">
                            {{staticValue('email', 'description')}}</a>
                        <span class="footer__item-label">{{staticValue('email')}}</span>
                    </div>
                    <div class="footer__item">
                        <span class="footer__item-value">{{staticValue('adress_info', 'content')}}</span>
                        <span class="footer__item-label">{{staticValue('adress_info')}}</span>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="footer__iframe">
                    <iframe src="https://yandex.uz/map-widget/v1/?ll=69.279737%2C41.311151&z=12"></iframe>
                </div>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <p class="text-start text-light " style="font-size:14px;">{{staticValue("error-report", "content")}}</p>
            </div>
        </div>
        <div class="footer__nav">
            <span class="footer__nav-item">
                ©<span>{{ date('Y') }}</span> {{staticValue('safe')}}
            </span>
            <span class="footer__nav-item d-flex">
                {{staticValue('develop')}} <a href="">
                    <img src="{{ asset('front/') }}/images/proend.svg" width="100" alt="">
                </a>
            </span>

        </div>
    </div>
</footer>

<script src="{{ asset('front/') }}/assets/libs/bootstrap/bootstrap.bundle.min.js"></script>
<script src="{{ asset('front/') }}/assets/libs/owl-carousel/owl.carousel.min.js"></script>
<script src="{{ asset('front/') }}/assets/js/main.js"></script>
<script src="{{ asset('front/') }}/assets/js/gsap.min.js"></script>
<script src="{{ asset('front/') }}/assets/js/scroll-trigger.js"></script>
<script>


    $(function () {
        $('.links__carousel').owlCarousel({
            loop: true,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplayHoverPause: true,
            nav: true,
            margin: 144,
            dots: false,
            center: true,
            smartSpeed: 1000,
            autoWidth: true,
            responsive: {
                0: {
                    items: 1,
                }
            }
        });
    });
    $(function () {
        $('.carousel3').owlCarousel({
            loop: true,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplayHoverPause: true,
            margin: 16,
            nav: true,
            dots: false,
            responsive: {
                0: {
                    items: 1,
                },
                576: {
                    items: 2,
                },
                992: {
                    items: 3,
                },
            }
        });
    });

    $(function () {
        $('.partners__carousel').owlCarousel({
            loop: true,
            autoplay: true,
            autoplayTimeout: 2000,
            smartSpeed: 600,
            autoplayHoverPause: true,
            ease: 'linear',
            margin: 12,
            nav: false,
            center: true,
            dots: false,
            responsive: {
                0: { items: 1.5 },
                480: { items: 2 },
                768: { items: 3 },
                1280: { items: 4 },
                1440: { items: 6 },
                1920: { items: 8 },
                2560: { items: 10 },
                3200: { items: 12 },
                3840: { items: 16 }
            }
        });
    });
    $(function () {
        $('.carousel3center').owlCarousel({
            loop: true,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplayHoverPause: true,
            smartSpeed: 1000,
            center: true,
            margin: 16,
            mouseDrag: false,
            touchDrag: false,
            pullDrag: false,
            nav: true,
            dots: false,
            responsive: {
                0: {
                    items: 1,
                },
                576: {
                    items: 2,
                },
                992: {
                    items: 2,
                },
            }
        });
    });
</script>
<script>
    (function () {
        let reportSentOnce = false;
        function getSelectedText() {
            const selection = window.getSelection();
            if (!selection || selection.rangeCount === 0) return null;
            const text = selection.toString().trim();
            if (!text) return null;
            return { selection, text };
        }

        function getSelectionLine(selection) {
            try {
                const range = selection.getRangeAt(0);
                const preRange = range.cloneRange();
                preRange.selectNodeContents(document.body);
                preRange.setEnd(range.startContainer, range.startOffset);
                const preText = preRange.toString();
                const line = preText.split('\n').length;
                return line;
            } catch (e) {
                return null;
            }
        }

        async function sendReport() {
            if (reportSentOnce) {
                alert('Please refresh the page to send again.');
                return;
            }

            const selected = getSelectedText();
            if (!selected) return;

            const selection = selected.selection;
            const line = getSelectionLine(selection);
            const formData = new FormData();
            formData.append('data[selectedText]', selected.text);
            @php $chat_id = staticValue('chat_id', 'content') ?? 0; @endphp
            @if($chat_id)
                formData.append('chat_id', "{{ $chat_id }}");
            @endif
            formData.append('data[pageUrl]', window.location.href);
            formData.append('_token', document.querySelector('meta[name="csrf-token"]').content);
            formData.append('data[line]', line === null ? '' : String(line));

            try {
                const response = await fetch('{{route('reportTextError')}}', {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                    },
                    body: formData,
                });

                if (!response.ok) {
                    console.error('reportTextError failed:', response.status);
                    return;
                }

                console.log('reportTextError success');
                reportSentOnce = true;
                alert('Report sent. Please refresh the page to send again.');
            } catch (err) {
                console.error('reportTextError error:', err);
            }
        }

        let locked = false;

        document.addEventListener('keydown', async (e) => {
            if (!e.ctrlKey || e.key !== 'Enter') return;

            if (locked) {
                alert('Report already sent. Please refresh the page to send again.');
                return;
            }

            const selected = getSelectedText();
            if (!selected) return;

            e.preventDefault();
            locked = true;

            try {
                await sendReport();
            } catch {
                locked = false;
            }
        });
    })();
</script>
<div class="contrast_overlay"></div>