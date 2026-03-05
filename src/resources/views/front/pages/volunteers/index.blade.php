@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')

    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <section class="volunteers">
                    @foreach ($items as $item)
                    <a href="{{ route('home',['locale' => app()->getLocale(),'any' => request()->route('any'),'inside' => $item->slug]) }}">
                        <strong>{{ sectionValue($item,'title') }}</strong>
                        @php
                        $image = sectionImages($item,true);
                        @endphp
                        <img src="{{ $image }}" alt="">
                    </a>
                    @endforeach
                </section>
            </div>

            @include('front.components.sidebar')
        </div>
    </div>
@endsection