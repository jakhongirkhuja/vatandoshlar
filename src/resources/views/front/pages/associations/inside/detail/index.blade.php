@php
    $news = menuSections(26,3);
    $newsSlug = menuSection(26);
@endphp

@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')

    <div class="layout">
        <div class="container">
            <div class="layout-content">

                <div class="associations-detail">
                    @foreach($items[0]->children->sortByDesc('category_slug')->values()->sortByDesc(function($item, $key) {
                    return $key == 1;
                    }) as $key => $mainItem)
                        @if($key == 1)
                            <div class="associations-detail__about">
                                <div class="associations-detail__about--img">
                                    @php $image = sectionImages($mainItem, true); @endphp
                                    @if($image)
                                        <img src="{{ $image }}" alt="">
                                    @endif
                                </div>
                                <div class="associations-detail__about--text">
                                    <div class="associations-detail__about--text-title">
                                        <h2>{{ sectionValue($mainItem, 'title') }} </h2>
                                    </div>
                                    <div class="associations-detail__about--text-date">
                                        <div class="associations-detail__about--text-date-item">
                                            <p>{{staticValue('date_at')}}</p>
                                            <span><i class="i-calendar"></i> {{ sectionValue($mainItem, 'date_at') }}</span>
                                        </div>
                                        <div class="associations-detail__about--text-date-item">
                                            <p>{{staticValue('leader')}}</p>
                                            <span><i class="i-calendar"></i> {{ sectionValue($mainItem, 'boss_at') }}</span>
                                        </div>
                                    </div>
                                    <div class="associations-detail__about--text-hr"></div>
                                    <div class="associations-detail__about--text-task">
                                        <p>{{staticValue('aim')}}</p>
                                        <div>{!! sectionValue($mainItem, 'description') !!}</div>
                                    </div>
                                </div>
                            </div>
                        @endif

                        @if($key == 0)

                            <div class="associations-detail__president">
                                <div class="associations-detail__president--img">
                                    @php $image = sectionImages($mainItem, true);
                                    @endphp
                                    @if($image)
                                        <img src="{{ $image }}" alt="">
                                    @endif
                                </div>
                                <div class="associations-detail__president--data">
                                    <div class="associations-detail__president--data-name">
                                        <p>{{ sectionValue($mainItem, 'title') }}</p>
                                        <span>{{ sectionValue($mainItem, 'description') }}</span>
                                    </div>
                                    @if(sectionValue($mainItem, 'phone') || sectionValue($mainItem, 'email'))
                                        <div class="associations-detail__president--data-contact">
                                            @if(sectionValue($mainItem, 'phone'))
                                                <div class="associations-detail__president--data-contact-item">
                                                    <p> {{staticValue('phone')}}</p>
                                                    <span><i class="i-phone"></i> {{ sectionValue($mainItem, 'phone') }}</span>
                                                </div>
                                            @endif
                                            @if(sectionValue($mainItem, 'email'))
                                                <div class="associations-detail__president--data-contact-item">
                                                    <p>{{ staticValue('email_info')}}</p>
                                                    <span><i class="i-email"></i> {{ sectionValue($mainItem, 'email') }}</span>
                                                </div>
                                            @endif
                                        </div>
                                    @endif
                                </div>
                            </div>
                        @endif
                    @endforeach
                    @if(isset($items[0]))
                        @php
                            $mainImage = sectionImages($items[0],false);
                        @endphp
                        @if(count($mainImage))
                            <div class="associations-detail__gallery">
                                <h2 class="associations-detail__gallery--title">{{ staticValue('photogallery') }}</h2>

                                <div class="carousel carousel3center owl-carousel">


                                    @if($mainImage)
                                        @foreach ($mainImage as $src)
                                            <a href="{{$src}}" data-fancybox="gallery" class="carousel__item">
                                                <div class="carousel__item--img">
                                                    <img src="{{ $src }}" alt="">
                                                </div>
                                            </a>
                                        @endforeach
                                    @endif
                                </div>
                            </div>
                        @endif
                    @endif
                    <div class="associations-detail__news">
                        @if ($news)
                            <h2 class="associations-detail__gallery--title">{{ staticValue('news') }}</h2>
                            <div class="carousel carousel3 owl-carousel">
                                @foreach($news as $newsItem)
                                    <a class="carousel__item"
                                       href="{{ route('home', ['locale' => app()->getLocale(), 'any' =>$newsSlug->slug, 'inside' => $newsItem->slug]) }}">
                                        <div class="carousel__item--img">
                                            @php
                                                $mainImage = sectionImages($newsItem, true);
                                            @endphp
                                            @if($mainImage)
                                                <img src="{{ $mainImage }}" alt="">
                                            @endif
                                        </div>
                                        <div class="carousel__item--content">
                                            <p class="carousel__item--content-title line-clamp-2 no-tooltip">{{ sectionValue($newsItem,
                                    'title') }}</p>
                                            <p class="carousel__item--content-date">
                                                <i class="i-calendar"></i>
                                                <span>{{ date('Y-m-d', strtotime($newsItem->publish_at)) }}</span>
                                            </p>
                                        </div>
                                    </a>
                                @endforeach
                            </div>
                        @endif
                    </div>
                </div>
            </div>
            @include('front.components.sidebar')
        </div>
    </div>
    <script>
        Fancybox.bind("[data-fancybox]", {
            thumbs: false
        });
    </script>
@endsection