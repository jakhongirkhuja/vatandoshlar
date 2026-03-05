@extends('front.layouts.layout')

@section('body')
@include('front.components.breadcrumbs')
<div class="layout">
    <div class="container">
        <div class="layout-content">
            <div class="content">
                @foreach ($items as $item)
                <div class="content__title">{{ sectionValue($item, 'title') }}</div>
                <div class="content__text">
                    {{ sectionValue($item, 'description') }}
                </div>
                <div class="content__grid gtc-3">

                    @foreach(mediaContent($item) as $src)
                    @php
                    $isVideo = \Illuminate\Support\Str::endsWith(\Illuminate\Support\Str::lower( $src['image']), ['.mp4', '.webm', '.ogg']);
                    @endphp

                    <a class="content__grid--item video-card" data-fancybox="gallery" href="{{ $src['image']}}">
                        <div class="content__grid--item-img">
                            @if($isVideo)
                            <video src="{{ $src['image'] }}" poster="{{$src['poster']}}" paused muted preload="metadata"></video>
                            @else
                            <img src="{{  $src['image'] }}" alt="">
                            @endif
                        </div>

                    </a>
                    @endforeach

                </div>
                @endforeach
            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const videos = document.querySelectorAll('.video-preview');

                videos.forEach(video => {

                    video.addEventListener('loadedmetadata', function () {
                        this.currentTime = 2;
                    }, {
                        once: true
                    });

                    video.addEventListener('seeked', function () {
                        this.pause();
                    }, {
                        once: true
                    });
                });
            });

            Fancybox.bind("[data-fancybox]", {
                thumbs: false
            });
        </script>
        @include('front.components.sidebar')
    </div>
</div>
@endsection