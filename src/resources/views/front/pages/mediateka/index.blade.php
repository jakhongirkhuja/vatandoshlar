@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')
    <div class="layout">
        <div class="container">
            <div class="layout-content">
              <div class="content">
    @foreach ($items as $item)
        {{ sectionValue($item, 'description') }}

        <div class="content__grid gtc-3">
            <a class="content__grid--item video-card" href="{{sectionValue($item, 'url')}}">
                <div class="content__grid--item-img">
                    @php
                        $mainImage = sectionImages($item, true);
                    @endphp

                    @if ($mainImage)
                        <img src="{{ $mainImage }}" alt="{{ sectionValue($item, 'url_title') }}">
                    @endif
                </div>

                <div class="content__grid--item-content">
                    <p class="content__grid--item-content-title line-clamp-2">
                        {{ sectionValue($item, 'url_title') }}
                    </p>
                </div>
            </a>
        </div>
    @endforeach
</div>
            </div>
            @include('front.components.sidebar')
        </div>
    </div>
@endsection