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
                  @if(session('success'))
                    {{-- Modal faqat success bo'lgandagina ko'rinadi --}}
                    <div class="modal fade"  id="supportResponseModal" tabindex="-1" role="dialog">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                {{-- Header qismini ko'k (bg-primary) qildik --}}
                                <div class="modal-header bg-primary text-white">
                                    <h5 class="modal-title">{{ staticValue('info') }}</h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body text-center py-4">
                                    <h4 class="text-primary mb-2">{{staticValue('thanks')}}</h4>
                                    <p class="mb-0">{{ session('success') }}</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">{{staticValue('close')}}</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    {{-- Success bo'lganda modalni avtomatik chiqarish uchun skript --}}
                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            var myModal = new bootstrap.Modal(document.getElementById('supportResponseModal'));
                            myModal.show();
                        });
                    </script>
                @endif

                    {{-- Error Messages --}}
                    @if($errors->any())
                        <div class="alert alert-danger" style="padding: 15px; margin-bottom: 20px; background: #f8d7da; color: #721c24; border-radius: 5px;">
                            <ul style="margin: 0; padding-left: 20px;">
                                @foreach($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    <form action="{{route('support.createForm')}}" class="contacts-page__data--form" method="post">
                        @csrf
                           <input type="hidden" name="type" value="form">
                        <div class="contacts-page__data--form-group">
                            <label>{{staticValue('fullname')}}</label>
                            <input class="form-control"
                                   type="text"
                                   placeholder="{{staticValue('info-add')}}"
                                   name="data[name]"
                                   required />
                            @error('data.name')
                                <span class="text-danger" style="color: red; font-size: 14px;">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="contacts-page__data--form-row">
                            <div class="contacts-page__data--form-group">
                                <label>{{staticValue('number')}}</label>
                                <input id="phone"
                                       class="form-control"
                                       type="text"
                                       name="data[phone]"
                                       required />
                                @error('data.phone')
                                    <span class="text-danger" style="color: red; font-size: 14px;">{{ $message }}</span>
                                @enderror
                            </div>

                            <div class="contacts-page__data--form-group">
                                <label>{{staticValue('email')}}</label>
                                <input class="form-control"
                                       type="email"
                                       placeholder="example@gmail.com"
                                       name="data[email]"
                                       required />
                                @error('data.email')
                                    <span class="text-danger" style="color: red; font-size: 14px;">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>

                        <div class="contacts-page__data--form-group">
                            <label>{{staticValue('message')}}</label>
                            <textarea class="form-control"
                                      placeholder="Kiriting"
                                      name="data[description]"
                                      required> </textarea>
                            @error('data.description')
                                <span class="text-danger" style="color: red; font-size: 14px;">{{ $message }}</span>
                            @enderror
                        </div>

                        <button type="submit" class="btn-submit">
                            <img src="{{asset('front/images/send.svg')}}" alt="Send">
                            {{staticValue('request')}}
                        </button>
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
                                <span>+998 71 234 56 78</span>
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
                                <span>info@example.com</span>
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
                                <span>{{staticValue('work-days')}} 09:00 – 18:00</span>
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
                                <span>{{staticValue('adres')}}</span>
                            </div>
                        </div>
                    </div>
                </div>

                @if(isset($items[0]))
                {!!  sectionValue($items[0],'map')!!}
                @endif

            </div>
            <script>
                const input = document.querySelector('#phone');
                IMask(input, {
                    mask: '+998 00-000-00-00',
                    lazy: false
                });
            </script>
        </div>
    </div>
@endsection
