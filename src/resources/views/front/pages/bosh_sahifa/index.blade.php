@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')

    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="content">

                   
                    @php
                        $middleItem = $items->slice(-2, 1)->first();
                    @endphp

                    @if($middleItem)
                        <div class="content__text">
                            <strong>{{ sectionValue($middleItem, 'title') }}</strong>
                            <p>{{ sectionValue($middleItem, 'description') }}</p>

                            <div class="carousel carousel3center owl-carousel">
                                @php
                                    $mainImage = sectionImages($middleItem);
                                @endphp

                                @if($mainImage)
                                    @foreach ($mainImage as $src)
                                        <a href="{{ sectionValue($middleItem, 'url') }}" class="carousel__item">
                                            <div class="carousel__item--img">
                                                <img src="{{ $src }}" alt="">
                                            </div>
                                        </a>
                                    @endforeach
                                @endif
                            </div>
                        </div>
                    @endif

                  
                    <div class="content__title primary">
                        {{ sectionValue($items[0], 'title') }}
                    </div>
                    <div class="carousel carousel3 owl-carousel">
                       
                        @foreach ($items as $k=>$item)
                            @if($k >= 1 && $k >= count($items) - 2)
                                @continue
                            @endif
                            @php
                                $mainImage = sectionImages($item);
                            @endphp

                            @if($mainImage)
                                @foreach ($mainImage as $src)
                                    <a href="{{ sectionValue($item, 'url') }}" class="carousel__item video-card">
                                        <div class="carousel__item--img">
                                            <img src="{{ $src }}" alt="">
                                        </div>
                                        <div class="carousel__item--content">
                                            <p class="carousel__item--content-title line-clamp-2">
                                                {{ sectionValue($item, 'url_title') }}
                                            </p>
                                            <p class="carousel__item--content-date">
                                                <i class="i-calendar"></i>
                                                <span>{{ $item->created_at->toDateString() }}</span>
                                            </p>
                                        </div>
                                    </a>

                                @endforeach
                            @endif



                        @endforeach
                    </div>
                    @php
                        $lastItem = $items->last();
                    @endphp

                    @if($lastItem)
                        <div class="content__text">
                            <strong>{{ sectionValue($lastItem, 'title') }}</strong>
                            <p>{{ sectionValue($lastItem, 'description') }}</p>

                            <div class="carousel carousel3center owl-carousel">
                                @php
                                    $mainImage = sectionImages($lastItem);
                                @endphp

                                @if($mainImage)
                                    @foreach ($mainImage as $src)
                                        <a href="{{ sectionValue($lastItem, 'url') }}" class="carousel__item">
                                            <div class="carousel__item--img">
                                                <img src="{{ $src }}" alt="">
                                            </div>
                                        </a>
                                    @endforeach
                                @endif
                            </div>
                        </div>
                    @endif

                </div>
            </div>

            @include('front.components.sidebar')
        </div>
    </div>
@endsection