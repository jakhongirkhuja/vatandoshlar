@extends('front.layouts.layout')

@section('body')

    @include('front.components.breadcrumbs')

    <div class="layout">
        <div class="container">
            <div class="layout-content">

                {{-- Swiper CSS --}}
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css"/>

                <div class="news-view">
                    <div class="news-view--main">

                        @foreach ($items as $item)

                            <h2 class="text">
                                {{ sectionValue($item, 'title') }}
                            </h2>

                            {{-- Slider --}}
                            <div class="swiper mySwiper">
                                <div class="swiper-wrapper">

                                    @php
                                        $images = sectionImages($item);
                                    @endphp

                                    @if(!empty($images))
                                        @foreach($images as $image)
                                            <div class="swiper-slide">
                                                <img src="{{ $image }}" alt="{{ sectionValue($item, 'title') }}">
                                            </div>
                                        @endforeach
                                    @else
                                        @php

                                $mainImage = asset('front/images/news_fallback.png');

                                     @endphp
                                        <div class="swiper-slide">
                                            <img src="{{ $mainImage }}" alt="{{ sectionValue($item, 'title') }}">
                                        </div>
                                    @endif


                                </div>

                                <div class="swiper-button-next">
                                    <i class="i-next"></i>
                                </div>
                                <div class="swiper-button-prev">
                                    <i class="i-prev"></i>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>


                            <div class="text-wrapper">
                                {!!  sectionValue($item, 'description') !!}
                            </div>

                            <div class="iframe-text mt-3">
                                <style>
                                    .custom_style_p{
                                        display:flex;
                                        align-items: center;
                                        color: #98a2b3;
                                        font-size: 16px;
                                        font-weight: 500;
                                        gap: 4px;
                                    }
                                </style>

                                <div class="iframe-text--link">
                                    <p class="custom_style_p">
                                        <i class="i-calendar"></i>
                                        {{ date('Y-m-d', strtotime($item->publish_at)) }}

                                    </p>
                                    <p class="custom_style_p">
                                        <i class="i-eye"></i>{{ $item->views()->count() }}
                                    </p>
                                </div>

                                <div class="iframe-text--line"></div>

                                <div class="iframe-text--copy">
                                    <p>{{staticValue('share')}}</p>
                                    <div class="copy-flex">
                                        <button class="btn-copy">
                                            <i class="i-copy"></i>{{staticValue('copy')}}
                                        </button>
                                        <button class="btn-ilova">
                                            <i class="i-telegram"></i>
                                        </button>
                                        <button class="btn-ilova">
                                            <i class="i-facebook"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>

                        @endforeach

                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.js"></script>
                <script>
                    var swiper = new Swiper(".mySwiper", {
                        spaceBetween: 30,
                        centeredSlides: true,
                        autoplay: {
                            delay: 2500,
                            disableOnInteraction: false,
                        },
                        pagination: {
                            el: ".swiper-pagination",
                            clickable: true,
                        },
                        navigation: {
                            nextEl: ".swiper-button-next",
                            prevEl: ".swiper-button-prev",
                        },
                    });
                </script>

            </div>
            @include('front.components.sidebar')
        </div>
    </div>

@endsection