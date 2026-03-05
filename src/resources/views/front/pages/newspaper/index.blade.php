@extends('front.layouts.layout')

@section('body')
@include('front.components.breadcrumbs')
<div class="layout">
    <div class="container">
        <div class="layout-content">
            <section class="press-page">
                @foreach ($items as $item)
                @php
                $image = sectionImages($item, true);
                @endphp

                <div class="press-page__item">
                    <div class="press-page__item--img">
                        @if($image)
                        <img src="{{ $image }}" alt="{{ sectionValue($item, 'title') }}">
                        @else
                        <img src="{{ asset('front/images/placeholder.png') }}" alt="{{ sectionValue($item, 'title') }}">
                        @endif
                        @php
                        $file = sectionImages($item, false);
                        @endphp
                    </div>
                    <div class="press-page__item--content">
                        <h4 class="press-page__title line-clamp-2 no-tooltip">
                            {{ sectionValue($item, 'title') }}
                        </h4>
                        <div class="press-page__item--details ">
                            <p>
                                <i class="i-calendar"></i>
                                {{ date('d.m.Y', strtotime($item->publish_at)) }}
                            </p>
                            <p>
                                <i class="i-download"></i>
                                {{$item->views()->count()}}
                            </p>
                        </div>
                        <div class="mt-auto d-flex flex-column gap-2">
                            <a download class="button download-btn" href="{{ $file[0] }}">
                                {{staticValue("downloadNow")}}
                                <i class="i-download"></i>
                            </a>
                            <a class="button" href="{{route('home', ['locale' => app()->getLocale(), 'any'=> request()->route('any'), 'inside' => $item->slug])}}">

                                {{staticValue("more")}}
                                <i class="i-link"></i>
                            </a>
                        </div>
                    </div>
                </div>
                @endforeach
            </section>
        </div>

        @include('front.components.sidebar')
    </div>
</div>
@endsection