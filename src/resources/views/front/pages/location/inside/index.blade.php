@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="content">
                    <div class="content__text">
                        @foreach ($items as $item)
                            {!! sectionValue($item, 'description') !!}

                            <div class="carousel carousel3 owl-carousel">
                                @if($item->children)
                                    @foreach($item->children as $child)
                                        @if($mainImages = sectionImages($child))
                                            @foreach ($mainImages as $mainImage)
                                                <a class="carousel__item video-card" href="{{ sectionValue($child, 'url') }}">
                                                    <div class="carousel__item--img">
                                                        <img src="{{ $mainImage }}" alt="{{ sectionValue($child, 'title') }}">
                                                    </div>
                                                    <div class="carousel__item--content">
                                                        <p class="carousel__item--content-title line-clamp-2">
                                                            {{ sectionValue($child, 'title') }}
                                                        </p>
                                                        <p class="carousel__item--content-date">
                                                            <i class="i-calendar"></i>
                                                            <span>{{ $child->created_at->toDateString() }}</span>
                                                        </p>
                                                    </div>
                                                </a>
                                            @endforeach
                                        @endif
                                    @endforeach
                                @endif
                            </div>
                            @foreach ($items as $k => $item)
                            @if ($k == 0)
                                <div class="content__title primary">Fotogalareya</div>
                                <div class="carousel carousel3center owl-carousel">
                                    @if($mainImages = sectionImages($item))
                                        @foreach ($mainImages as $mainImage)
                                            <a class="carousel__item" href="{{ $mainImage }}">
                                                <div class="carousel__item--img">
                                                    <img src="{{ $mainImage }}" alt="{{ sectionValue($item, 'title') }}">
                                                </div>
                                            </a>
                                        @endforeach
                                    @endif
                                </div>
                            @endif
                        @endforeach
                        @endforeach
                    </div>
                </div>
            </div>
            @include('front.components.sidebar')
        </div>
    </div>
@endsection