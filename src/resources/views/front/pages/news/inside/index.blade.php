@extends('front.layouts.layout')

@section('body')

    <!-- @include('front.components.breadcrumbs') -->
    <div style="height: calc(var(--height-header) + 16px);">

    </div>
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
                                {!! sectionValue($item, 'description') !!}
                            </div>

                            <div class="iframe-text mt-3">
                                <style>
                                    .custom_style_p {
                                        display: flex;
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
                                        {{ date('d.m.Y', strtotime($item->publish_at)) }}

                                    </p>
                                    <p class="custom_style_p">
                                        <i class="i-eye"></i>{{ $item->views()->count() }}
                                    </p>
                                </div>

                                <div class="iframe-text--line"></div>

                                <div class="iframe-text--copy">
                                    <label for="share" class="share-link" id="share-label" style="cursor:pointer;">
                                        <script>
                                            const patchYandexButton = () => {
                                                const moreBtn = document.querySelector('.ya-share2__badge.ya-share2__badge_more');
                                                const innerLink = document.querySelector('.ya-share2__link.ya-share2__link_more.ya-share2__link_more-button-type_short');

                                                if (!moreBtn || !innerLink) return false;

                                                innerLink.style.padding = '0';
                                                moreBtn.classList.add(".share")
                                                moreBtn.style.cssText = 'background: var(--white);  border: 0; outline: 0;display: flex; align-items: center; gap: 5px;   border-radius: 4px;';
                                                moreBtn.innerHTML = `<span>{{staticValue('share')}}</span><i class="i-link"></i>`;

                                                return true;
                                            };

                                            const startPatch = () => {
                                                if (patchYandexButton()) return;

                                                const observer = new MutationObserver(() => {
                                                    if (patchYandexButton()) observer.disconnect();
                                                });

                                                observer.observe(document.body, { childList: true, subtree: true });
                                                setTimeout(() => observer.disconnect(), 10000);
                                            };

                                            const script = document.createElement('script');
                                            script.src = 'https://yastatic.net/share2/share.js';
                                            script.onload = startPatch;
                                            document.head.appendChild(script);
                                        </script>


                                        <div id="share" class="ya-share2 share-link" data-curtain data-limit="0" data-more-button-type="short" data-services="telegram,twitter,whatsapp,linkedin">
                                        </div>
                                    </label>
                                    <div class="copy-flex">
                                        <button class="btn-copy">
                                            <i class="i-copy"></i>{{staticValue('copy')}}
                                        </button>

                                    </div>
                                </div>
                            </div>

                        @endforeach

                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.js"></script>
                <script>
                    document.querySelector('.btn-copy').addEventListener('click', function () {
                        const url = window.location.href;

                        navigator.clipboard.writeText(url).then(() => {
                            const originalText = this.innerHTML;
                            this.innerHTML = '<i class="i-copy" style="transform: rotate(-20deg);"></i>{{staticValue("copied")}}';

                            setTimeout(() => {
                                this.innerHTML = originalText;
                            }, 1200);
                        }).catch(err => {
                            console.error('Failed to copy:', err);
                        });
                    });
                </script>
                <script>
                    var swiper = new Swiper(".mySwiper", {
                        loop: true,
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