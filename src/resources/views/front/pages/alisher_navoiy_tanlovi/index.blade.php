@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')
    @php
        $sections = menuSections(30,2);
    @endphp

    <div class="layout">
        <div class="container">
            <div class="layout-content">
                @php
                    $hero = $items->first();
                    $heroVideo = sectionImages($hero, true);
                    $categories = $items->slice(1, 3);
                @endphp

                @if($hero)
                    <div class="projects-hero">
                        <div class="projects-hero__bg">
                            @if($heroVideo)
                                <img src="{{ $heroVideo }}">
                            @endif
                        </div>

                        <div class="projects-hero__content">
                            <h1 class="projects-hero__title">
                                {{ sectionValue($hero, 'title') }}
                            </h1>

                            <div class="projects-hero__wrapper">
                                <a href="#" class="button projects-hero__wrapper--btn">Tanlov shartlari</a>
                                <a href="#" class="button projects-hero__wrapper--btn">Ishtirok etish</a>
                            </div>

                            <a href="#" class="projects-hero__btn">
                                <i class="i-play"></i>
                                <span>Video ko’rish</span>
                            </a>
                        </div>
                    </div>
                @endif

                <div class="projects-categories">
                    @foreach($categories as $item)
                        <div class="projects-categories__item">
                            @php
                                $image = sectionImages($item, true);
                            @endphp

                            @if($image)
                                <img src="{{ $image }}" alt="">
                            @endif

                            <p class="line-clamp-1">
                                {{ sectionValue($item, 'title') }}
                            </p>
                        </div>
                    @endforeach
                </div>

                <!-- @if($sections)
                    <div class="projects-forum">
                        <div class="section-top">
                            <p class="associations-detail__gallery--title">{{ staticValue('forum') }}</p>
                            </div>
                            @foreach ($sections as $section)

                                <div class="carousel carousel3center owl-carousel">
                                    @php
                                        $mainImage = sectionImages($section);
                                    @endphp

                                    @if($mainImage)
                                        @foreach ($mainImage as $src)
                                            <a href="{{ $src }}" class="carousel__item video-card">
                                                <div class="carousel__item--img">
                                                    <img src="{{ $src }}" alt="">
                                                </div>
                                            </a>
                                        @endforeach
                                    @endif
                                </div>
                        @endforeach
                    </div>
                @endif -->

            </div>

            @include('front.components.sidebar')
        </div>
    </div>
@endsection
