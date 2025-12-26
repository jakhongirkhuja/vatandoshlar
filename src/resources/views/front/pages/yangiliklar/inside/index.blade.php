@extends('front.layouts.layout')

@section('body')

    @include('front.components.breadcrumbs')

    <div class="layout">
        <div class="container">
            <div class="layout-content">

                {{-- Swiper CSS --}}
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css" />

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
                                        $images = sectionImages($item, false);
                                    @endphp

                                    @if(!empty($images))
                                        @foreach($images as $image)
                                            <div class="swiper-slide">
                                                <img src="{{ $image }}" alt="{{ sectionValue($item, 'title') }}">
                                            </div>
                                        @endforeach
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

                            <h4 class="text-2">
                                {!!  sectionValue($item, 'description') !!}
                            </h4>

                            <div class="text-wrapper">
                                {!! sectionValue($item, 'content') !!}
                            </div>

                            @if(sectionValue($item, 'url'))
                                <div class="iframe-text">

                                    <iframe width="560" height="315"
                                        src="{{ sectionValue($item, 'url') }}"
                                        title="{{ sectionValue($item, 'title') }}" frameborder="0"
                                        allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                        referrerpolicy="strict-origin-when-cross-origin"  height="550" allowfullscreen style="border-radius:12px;margin-bottom:20px; width: 100%;"></iframe>
                                    

                                    <div class="iframe-text--link">
                                        <a href="#">
                                            <i class="i-calendar"></i>
                                            {{ $item->created_at->toDateString()  }}
                                        </a>
                                        <a href="#">
                                            <i class="i-eye"></i>{{ rand(1, 500) }}
                                        </a>
                                    </div>

                                    <div class="iframe-text--line"></div>

                                    <div class="iframe-text--copy">
                                        <p>Bo’lishish</p>
                                        <div class="copy-flex">
                                            <button class="btn-copy">
                                                <i class="i-copy"></i>Copy link
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
                            @endif

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