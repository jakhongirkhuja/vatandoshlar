@extends('front.layouts.layout')
@section('body')
    @include('front.components.breadcrumbs')
    <script src="{{ asset('front/') }}/assets/js/imask.js"></script>
    <div class="layout">
        <div class="container">
            <div class="contacts-page">
                <div class="contacts-page__data">
                    <h2 class="contacts-page__data--title">{{staticValue('contactmessage')}}</h2>

                    {{-- Success Message --}}
                    @include('front.components.modal')

                    {{-- Error Messages --}}

                    <form action="{{route('support.createForm')}}" class="contacts-page__data--form" id="myForm"
                        method="post">
                        @csrf
                        <input type="hidden" name="type" value="form">
                        <div class="contacts-page__data--form-group">
                            <label>{{staticValue('fullname')}}</label>
                            <input type="hidden" name="chat_id" value="{{staticValue('telegram_contact_chat_id','description')}}">
                            <input class="form-control" type="text" placeholder="{{staticValue('info-add')}}"
                                name="data[name]" required />
                            @error('data.name')
                                <span class="text-danger" style="color: red; font-size: 14px;">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="contacts-page__data--form-row">
                            <div class="contacts-page__data--form-group">
                                <label>{{staticValue('number')}}</label>
                                <!-- <input id="phone" class="form-control" type="text" name="data[phone]" required /> -->
                                <div class="phone-dropdown">
                                    <button type="button" class="phone-toggle">
                                        <img src="" data-code="+998">
                                        <i class="i-dropdown"></i>
                                    </button>

                                    <input type="tel" class="form-control" id="phone" name="data[phone]" required>

                                    <div class="phone-menu">
                                        <div class="phone-search">
                                            <i class="i-search"></i>
                                            <input type="text" placeholder="{{staticValue('search')}}">
                                        </div>
                                        <ul>
                                            @foreach(countries() as $country)
                                                <li data-code="+{{$country['phonecode']}}"
                                                    data-flag="{{ asset('front') }}/images/flags/{{ strtolower($country['iso']) }}.png">
                                                    <img
                                                        src="{{ asset('front') }}/images/flags/{{ strtolower($country['iso'])  }}.png">
                                                    <span>{{ $country['iso3'] }}</span>
                                                    <small>+{{$country['phonecode']}}</small>
                                                </li>

                                            @endforeach

                                        </ul>
                                    </div>
                                </div>

                                <script>
                                    document.addEventListener('DOMContentLoaded', () => {
                                        const phoneInput = document.getElementById('phone')
                                        const toggle = document.querySelector('.phone-toggle')
                                        const menu = document.querySelector('.phone-menu')
                                        const search = document.querySelector('.phone-search input')
                                        if (!phoneInput || !toggle || !menu || !search) {
                                            console.error('Required DOM elements missing')
                                            console.groupEnd()
                                            return
                                        }
                                        document.addEventListener('click', e => {
                                            if (!menu.classList.contains('active')) return
                                            if (e.target.closest('.phone-dropdown')) return
                                            menu.classList.remove('active')
                                        })
                                        let mask
                                        const masks = {
                                            @foreach(countries() as $country)
                                                @php
                                                    // Trim all country data before processing
                                                    $phonecode = trim(strval($country['phonecode']));
                                                    $code = '+' . ltrim(trim($phonecode), '+');
                                                    $phonemask = !empty($country['phonemask']) ? trim($country['phonemask']) : '00 000-00-00';
                                                    // Escape each digit in the phone code for IMask literal format
                                                    $codeDigits = ltrim(trim($phonecode), '+');
                                                    $escapedCode = '+' . implode('', array_map(fn($c) => "\\\\$c", str_split($codeDigits)));
                                                    $mask = trim("{$escapedCode} {$phonemask}");
                                                @endphp
                                                '{{ trim($code) }}': '{{ trim($mask) }}',
                                            @endforeach
                                                    };

                                    const updateToggleFromCode = code => {
                                        if (!code) return
                                        const img = toggle.querySelector('img')
                                        if (!img) return
                                        const match = Array.from(menu.querySelectorAll('li')).find(li => li.dataset.code === code)
                                        if (match) {
                                            img.src = match.dataset.flag
                                            img.dataset.code = match.dataset.code
                                        }
                                    }

                                    const setMask = code => {
                                        mask && mask.destroy()
                                        phoneInput.value = ''

                                        // Create fallback with escaped code digits
                                        let fallbackMask = code ? code.split('').map(c => c === '+' ? '+' : '\\' + c).join('') + ' 00 000-00-00' : '+\\0\\0\\0 00 000-00-00';
                                        const selectedMaskPattern = masks[code] || fallbackMask;


                                        // Use IMask with simple pattern
                                        mask = IMask(phoneInput, {
                                            mask: selectedMaskPattern,
                                            lazy: false
                                        })

                                        // share mask instance for other scripts (e.g., persistence)
                                        phoneMaskInstance = mask

                                        mask.value = ''
                                        phoneInput.focus()
                                        phoneInput.blur()
                                    }

                                    // choose initial mask: saved phone_code from sessionStorage if present, else current toggle flag, else fallback to +998
                                    let initialMaskCode = '+998'
                                    try {
                                        const savedRaw = sessionStorage.getItem('form_apply_data')
                                        if (savedRaw) {
                                            const savedObj = JSON.parse(savedRaw)
                                            if (savedObj?.inputs?.phone_code) {
                                                initialMaskCode = savedObj.inputs.phone_code
                                            }
                                        }
                                    } catch (e) {
                                        // ignore parse errors, keep default
                                    }

                                    const toggleImg = toggle.querySelector('img')
                                    if (toggleImg?.dataset?.code && (!initialMaskCode || initialMaskCode === '+998')) {
                                        initialMaskCode = toggleImg.dataset.code
                                    }

                                    setMask(initialMaskCode)
                                    updateToggleFromCode(initialMaskCode)

                                    toggle.onclick = () => {
                                        menu.classList.toggle('active')
                                    }

                                    menu.onclick = e => {
                                        const li = e.target.closest('li')
                                        if (!li) {
                                            return
                                        }


                                        toggle.querySelector('img').src = li.dataset.flag
                                        toggle.querySelector('img').dataset.code = li.dataset.code
                                        setMask(li.dataset.code)
                                        menu.classList.remove('active')
                                    }

                                    search.oninput = () => {
                                        const v = search.value.toLowerCase()

                                        menu.querySelectorAll('li').forEach(li => {
                                            const visible = li.querySelector('span').textContent.toLowerCase().includes(v)
                                            li.style.display = visible ? 'flex' : 'none'
                                        })
                                    }

                                    console.groupEnd()
                                                    })
                                </script>

                                <!-- @error('data.phone')
                                                <span class="text-danger" style="color: red; font-size: 14px;">{{ $message }}</span>
                                                @enderror -->
                            </div>

                            <div class="contacts-page__data--form-group">
                                <label>{{staticValue('email')}}</label>
                                <input class="form-control" type="email" placeholder="example@gmail.com" name="data[email]"
                                    required />
                                @error('data.email')
                                    <span class="text-danger" style="color: red; font-size: 14px;">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>

                        <div class="contacts-page__data--form-group">
                            <label>{{staticValue('message')}}</label>
                            <textarea class="form-control" placeholder="Kiriting" name="data[description]"
                                required> </textarea>
                            @error('data.description')
                                <span class="text-danger" style="color: red; font-size: 14px;">{{ $message }}</span>
                            @enderror
                        </div>
                        <div id="recaptcha-container"></div>
                        <button type="submit" id="submitBtn" class="submit-btn"> <img
                                src="{{asset('front/images/send.svg')}}" alt="Send"> {{staticValue('request')}}</button>
                    </form>
                </div>

                <div class="contacts-page__contact">
                    <h2 class="contacts-page__data--title">{{staticValue('contacts')}}</h2>
                    <div class="contacts-page__contact--info">
                        <a href="tel:+998712345678" class="contacts-page__contact--info-item">
                            <div class="contacts-page__contact--info-item-img">
                                <div class="contacts-page__contact--info-item-img-circle">
                                    <img src="{{asset('front/images/contacts-1.svg')}}" alt="Phone">
                                </div>
                            </div>
                            <div class="contacts-page__contact--info-item-numbers">
                                <p>{{staticValue('phone')}}</p>
                                <span>{{staticValue('phone', 'description')}}</span>
                            </div>
                        </a>

                        <a href="mailto:info@example.com" class="contacts-page__contact--info-item">
                            <div class="contacts-page__contact--info-item-img">
                                <div class="contacts-page__contact--info-item-img-circle">
                                    <img src="{{asset('front/images/contacts-2.svg')}}" alt="Email">
                                </div>
                            </div>
                            <div class="contacts-page__contact--info-item-numbers">
                                <p>{{staticValue('email')}}</p>
                                <span>{{staticValue('email', 'description')}}</span>
                            </div>
                        </a>

                        <div class="contacts-page__contact--info-item">
                            <div class="contacts-page__contact--info-item-img">
                                <div class="contacts-page__contact--info-item-img-circle">
                                    <img src="{{asset('front/images/contacts-3.svg')}}" alt="Time">
                                </div>
                            </div>
                            <div class="contacts-page__contact--info-item-numbers">
                                <p>{{staticValue('work-time')}}</p>
                                <span>{{staticValue('work-days')}} {{staticValue('work-days', 'description')}}</span>
                            </div>
                        </div>

                        <div class="contacts-page__contact--info-item">
                            <div class="contacts-page__contact--info-item-img">
                                <div class="contacts-page__contact--info-item-img-circle">
                                    <img src="{{asset('front/images/contacts-4.svg')}}" alt="Address">
                                </div>
                            </div>
                            <div class="contacts-page__contact--info-item-numbers">
                                <p>{{staticValue('address')}}</p>
                                <span>{{staticValue('address', 'content')}}</span>
                            </div>
                        </div>
                    </div>
                </div>

                @if(isset($items[0]))
                    {!! sectionValue($items[0], 'map')!!}
                @endif

            </div>
        </div>
    </div>
@endsection
@include('front.components.recaptchaHandler')
