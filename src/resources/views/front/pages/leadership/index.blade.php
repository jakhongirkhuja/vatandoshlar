@extends('front.layouts.layout')

@section('body')
@include('front.components.breadcrumbs')
<div class="layout">
    <div class="container">
        <div class="layout-content">
            <div class="leadership-page">

                @foreach ($items as $item)
                @if ($item->status == 1)

                <div class="leadership-page__card">
                    <div class="leadership-page__card--img">
                        @php
                        $mainImage = sectionImages($item, true);
                        @endphp
                        @if($mainImage)
                        <img src="{{ $mainImage }}" alt="{{ sectionValue($item, 'title') }}">
                        @endif
                    </div>
                    <div class="leadership-page__card--about">
                        <div class="leadership-page__card--about-name">
                            <h2>{{ sectionValue($item, 'title') }}</h2>
                            <p>{{ sectionValue($item, 'description') }}</p>
                        </div>
                        <div class="leadership-page__card--about-contact">
                            <div class="leadership-page__card--about-contact-item">
                                <p>{{staticValue('phone')}}</p>
                                <h3><i class="i-phone"></i>{{ sectionValue($item, 'phone') }}</h3>
                            </div>
                            <div class="leadership-page__card--about-contact-item">
                                <p>{{staticValue('email_info')}}</p>
                                <h3><i class="i-email"></i> {{ sectionValue($item, 'email') }}</h3>
                            </div>
                        </div>
                    </div>
                </div>
                @endif
                @endforeach

            </div>
        </div>
        @include('front.components.sidebar')
    </div>
</div>
@endsection