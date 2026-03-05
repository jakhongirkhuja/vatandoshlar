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
                        <div class="carousel__item" style="pointer-events: none;">
                            <a class="carousel__item--img" data-fancybox href="{{ $src }}">
                                @php
                                $isVideo = \Illuminate\Support\Str::endsWith(\Illuminate\Support\Str::lower($src), ['.mp4', '.webm', '.ogg']);
                                @endphp
                                @if($isVideo)
                                <video src="{{ $src }}" preload="metadata"></video>
                                @else
                                <img src="{{ $src }}" alt="">
                                @endif
                            </a>
                        </div>
                        @endforeach
                        @endif
                    </div>
                </div>
                @endif
                <script>
                    Fancybox.bind("[data-fancybox]", {
                        thumbs: false
                    });
                </script>
                <div class="content__title primary">
                    {{ sectionValue($items[0], 'title') }}
                </div>
                <div class="carousel carousel3 owl-carousel">

                    @foreach ($items as $k => $item)
                    @if($k >= 1 && $k >= count($items) - 2)
                    @continue
                    @endif
                    @php
                    $mainImage = sectionImages($item);
                    @endphp

                    @if($mainImage)
                    @foreach ($mainImage as $src)
                    @php
                    $isVideo = \Illuminate\Support\Str::endsWith(\Illuminate\Support\Str::lower($src), ['.mp4', '.webm', '.ogg']);
                    @endphp
                    <a href="{{ $src }}" data-fancybox class="carousel__item{{ $isVideo ? ' video-card' : '' }}">
                        <div class="carousel__item--img">
                            @if($isVideo)
                            <video paused muted src="{{ $src }}" preload="metadata"></video>
                            @else
                            <img src="{{ $src }}" alt="">
                            @endif

                        </div>
                        <div class="carousel__item--content">
                            <p class="carousel__item--content-title line-clamp-2">
                                {{ sectionValue($item, 'title') }}
                            </p>
                            <p class="carousel__item--content-date">
                                <i class="i-calendar"></i>

                                <span>{{ formatLocalizedDate(sectionValue($item, 'date'),true) }}</span>
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
                        <a data-fancybox="gallery" href="{{ $src }}" class="carousel__item">
                            <div class="carousel__item--img">
                                @php
                                $isVideo = \Illuminate\Support\Str::endsWith(\Illuminate\Support\Str::lower($src), ['.mp4', '.webm', '.ogg']);
                                @endphp
                                @if($isVideo)
                                <video poster="{{asset(" front")}}/images/placeholder.png" src="{{ $src }}" preload="metadata"></video>
                                @else
                                <img src="{{ $src }}" alt="">
                                @endif
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