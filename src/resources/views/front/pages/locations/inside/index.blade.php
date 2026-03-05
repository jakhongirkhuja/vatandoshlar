@extends('front.layouts.layout')

@section('body')
@include('front.components.breadcrumbs')
<div class="layout">
    <div class="container">
        <div class="layout-content">
            <div class="content">
                @foreach ($items as $item)
                <div class="content__text">
                    {!! sectionValue($item, 'description') !!}
                </div>

                <div class="carousel carousel3 owl-carousel mb-3">
                    @if($item->children)
                    @foreach($item->children as $child)
                    @if($mainImages = mediaContent($item))
                    @foreach($mainImages as $src)
                    @php
                    $isVideo = \Illuminate\Support\Str::endsWith(\Illuminate\Support\Str::lower( $src['image']), ['.mp4', '.webm', '.ogg']);
                    $link = sectionValue($child, 'url') ?: $src['image'];
                    @endphp

                    <a class="content__grid--item video-card" data-fancybox href="{{ $link }}">
                        <div class="content__grid--item-img">
                            @if($isVideo)
                            <video src="{{ $src['image'] }}" poster="{{$src['poster']}}" paused muted preload="metadata"></video>
                            @else
                            <img src="{{  $src['image'] }}" alt="">
                            @endif
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
                    <a data-fancybox="gallery" href="{{ $mainImage }}" class="carousel__item">
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
        <script>

            Fancybox.bind("[data-fancybox]", {
                thumbs: false
            });
        </script>
        @include('front.components.sidebar')
    </div>
</div>
@endsection