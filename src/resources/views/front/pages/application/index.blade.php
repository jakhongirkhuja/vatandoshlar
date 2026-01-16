@extends('front.layouts.layout')
@section('body')
    <div class="layout">
        <div class="container">
            <div class="projects__apply  w-100">

                @include('front.components.breadcrumbs')
                <div class="projects__apply-wrapper content">

                    @include('front.components.error')

                    <form class="apply-form" action="{{ route('support.create') }}" id="myForm" method="post">
                        <input type="hidden" name="type" value="application">
                        @csrf
                        <div class="form-row form-row--name-date">
                            <div class="form-field">
                                <label for="fullname">{{staticValue('pleasure')}}</label>
                                <input type="text" id="fullname" name="data[name]" class="form-control" placeholder="{{staticValue('info-add')}}"
                                       required>
                            </div>

                            <div class="form-field">
                                <label for="birthdate">{{staticValue('birthdate')}}</label>
                                <input type="date" id="birthdate" name="data[birthdate]" class="form-control" required>
                            </div>
                        </div>
                        @php
                            $jobs= contentSection('job');

                        @endphp
                        <div class="form-field">
                            <label for="specialization">{{staticValue('Specialization:')}}</label>
                            <select name="data[job]" id="specialization" class="form-control" required>
                                <option value="">{{staticValue('select_spec')}}</option>
                                @foreach($jobs as $job)
                                    <option value="{{ sectionValue($job,'title') }}">
                                        {{ sectionValue($job,'title') }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-field">
                            <label for="address">{{staticValue('turar-joy')}}</label>
                            <input type="text" id="address" name="data[address]" class="form-control"
                                   placeholder="{{staticValue('the_address')}}" required>
                        </div>

                        <div class="form-field">
                            <label for="extra_info">{{staticValue('add-info')}}</label>
                            <input type="text" id="extra_info" name="data[extra_info]" class="form-control"
                                   placeholder="{{staticValue('contact-info')}}" required>
                        </div>
                        <div class="form-field">
                            <label for="description">{{staticValue('taklif')}}</label>
                            <input type="text" id="description" name="data[description]" class="form-control" placeholder="{{staticValue('info-add')}}"
                                   required>
                        </div>
                        <div id="recaptcha-container" style="display: none"></div>
                        <button id="submitBtn"  type="button" class="btn btn-primary" >{{staticValue('request')}}</button>
                    </form>
                </div>
            </div>
        </div>
        @if(session('success'))
            {{-- Modal faqat success bo'lgandagina ko'rinadi --}}
            <div class="modal fade" id="supportResponseModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        {{-- Header qismini ko'k (bg-primary) qildik --}}
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title">{{staticValue('info')}}</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center py-4">
                            <h4 class="text-primary mb-2">{{ staticValue('thanks') }}</h4>
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
                document.addEventListener('DOMContentLoaded', function () {
                    var myModal = new bootstrap.Modal(document.getElementById('supportResponseModal'));
                    myModal.show();
                });
            </script>
        @endif
    </div>
    <script src="{{ asset('front/') }}/assets/js/imask.js"></script>
    <style>
        .breadcrumbs-wrapper{
            width: 100%;
        }
        .projects__apply-wrapper{
            max-width: initial;
        }
    </style>



    <script>

        function datePicker(selector) {
            flatpickr.localize({
                weekdays: {
                    shorthand: ['Yak', 'Du', 'Se', 'Ch', 'Pa', 'Ju', 'Sha'],
                    longhand: ['Yakshanba', 'Dushanba', 'Seshanba', 'Chorshanba', 'Payshanba', 'Juma', 'Shanba']
                },
                months: {
                    shorthand: ['Yan', 'Fev', 'Mar', 'Apr', 'May', 'Iyn', 'Iyl', 'Avg', 'Sen', 'Okt', 'Noy', 'Dek'],
                    longhand: ['Yanvar', 'Fevral', 'Mart', 'Aprel', 'May', 'Iyun', 'Iyul', 'Avgust', 'Sentabr', 'Oktabr', 'Noyabr', 'Dekabr']
                },
                firstDayOfWeek: 1,
                rangeSeparator: ' — ',
                weekAbbreviation: 'Hafta',
                scrollTitle: 'O‘zgartirish uchun aylantiring',
                toggleTitle: 'Ochiq/Yopiq'
            })

            flatpickr(selector, {
                mode: "single",
                dateFormat: "d-m-Y",
                position: "below",
                placeholder: "DD-MM-YYYY",
            })
        }

        // datePicker("#birthdate");

    </script>
@endsection
@section('script')

    @include('front.components.recaptchaHandler')
@endsection
