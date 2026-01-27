@extends('front.layouts.layout')
@section('body')
<div class="layout">
    <div class="container">
        <div class="projects__apply  w-100">

            @include('front.components.breadcrumbs')
            <div class="projects__apply-wrapper content">

                <form class="apply-form" action="{{ route('support.create') }}" id="myForm" method="post">
                    <input type="hidden" name="type" value="application">
                    @csrf
                    <input type="hidden" name="chat_id" value="{{staticValue('telegram_participation_chat_id','description')}}">
                    <div class="form-row form-row--name-date">
                        <div class="form-field">
                            <label for="fullname">{{staticValue('pleasure')}}</label>
                            <input type="text" id="fullname" name="data[name]" class="form-control"
                                placeholder="{{staticValue('info-add')}}" required>
                        </div>

                        <div class="form-field">
                            <label for="birthdate">{{staticValue('birthdate')}}</label>
                            <input type="date" id="birthdate" placeholder="DD-MM-YYYY" name="data[birthdate]"
                                class="form-control" required>
                        </div>
                    </div>
                    @php
                    $jobs = contentSection('job');
                    @endphp
                    <div class="form-field">
                        <label for="specialization">{{staticValue('Specialization:')}}</label>
                        <select name="data[job]" id="specialization" class="form-control" required>
                            <option value="">{{staticValue('select_spec')}}</option>
                            @foreach($jobs as $job)
                            <option value="{{ sectionValue($job, 'title') }}">
                                {{ sectionValue($job, 'title') }}
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
                        <input type="text" id="description" name="data[description]" class="form-control"
                            placeholder="{{staticValue('info-add')}}" required>
                    </div>
                    <div id="recaptcha-container" style="display: none"></div>
                    <div class="form-actions">
                        <button type="submit" id="submitBtn" class="submit-btn">
                            <img src="{{ asset('front') }}/images/send.svg" alt="Send icon">
                            <span>{{staticValue('request')}}</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    @include('front.components.modal')
</div>
<script src="{{ asset('front/') }}/assets/js/imask.js"></script>
<style>
    .breadcrumbs-wrapper {
        width: 100%;
    }

    .projects__apply-wrapper {
        max-width: initial;
    }
</style>





<script>

    function datePicker(selector) {
        const weekShorthand = "{{ setting('week_short') }}".split(', ');
        const weekLonghand = "{{ setting('week_long') }}".split(', ');
        const monthShorthand = "{{ setting('month_short') }}".split(', ');
        const monthLonghand = "{{ setting('month_long') }}".split(', ');
        flatpickr.localize({
            weekdays: {
                shorthand: weekShorthand,
                longhand: weekLonghand
            },
            months: {
                shorthand: monthShorthand,
                longhand: monthLonghand
            },
            firstDayOfWeek: 1,
            rangeSeparator: ' — ',
            weekAbbreviation: '{{staticValue('week')}}',
            scrollTitle: '{{staticValue('week','content')}}',
            toggleTitle: '{{staticValue('week','short_description')}}'
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
@include('front.components.recaptchaHandler')
