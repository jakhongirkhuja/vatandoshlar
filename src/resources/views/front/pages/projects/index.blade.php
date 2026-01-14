@extends('front.layouts.layout')
@section('body')
    @include('front.components.breadcrumbs')
    <div class="layout">
        <div class="container">
            <div class="projects-page__grid">
                @php
               $items = menuSections(38,null,false,true)
                @endphp
                @foreach ($items as $item)
                    @php
                        $images = sectionImages($item);
                    @endphp

                    @foreach ($images as $image)
                            <a href="{{ route('home', [
                            'locale' => app()->getLocale(),
                            'any' => request()->route('any'),
                            'inside' => $item->slug
                        ]) }}" class="projects-page__grid--item">

                                <div class="projects-page__grid--item-img">
                                    <img src="{{ $image }}" alt="">
                                </div>

                                <hr>

                                <p class="projects-page__grid--item-title">
                                    {{ sectionValue($item, 'title') }}
                                </p>

                                <button class="projects-page__grid--item-link">
                                    <span>Batafsil loyiha haqida</span>
                                    <i class="i-link"></i>
                                </button>
                            </a>
                    @endforeach
                @endforeach

            </div>
            @include('front.components.sidebar')
        </div>
    </div>
@endsection