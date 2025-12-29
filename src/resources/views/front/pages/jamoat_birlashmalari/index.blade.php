@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="content">
                    <div class="content__text">
                        {!! sectionValue($items[0], 'title') !!}
                    </div>

                    <div class="tab-navigation international-partnership__navigation">
                        <button data-tab-system="1" class="tab-button active">
                            Xarita ko'rinishida
                        </button>
                        <button data-tab-system="1" class="tab-button">
                            Grid ko'rinishida
                        </button>
                    </div>
                    <div class="tab-panels international-partnership__panels">
                        <div data-tab-system="1" class="tab-panel">
                            #map here
                        </div>
                        <div data-tab-system="1" class="tab-panel">
                            <div class="associations__grid">
                                @php


                                    $items = menuSections(23, null, true, true);

                                @endphp
                                @foreach($items as $k => $country)

                                    <a href="{{ route('home', ['locale' => app()->getlocale(), 'any' => request()->route('any'), 'inside' => $country->slug]) }}"
                                        class="associations__grid--item">
                                        <div class="associations__grid--item-img">
                                            @php
                                                $mainImage = sectionImages($country, true);
                                            @endphp
                                            @if($mainImage)
                                                <img src="{{ $mainImage }}" alt="{{ sectionValue($country, 'title') }}">
                                            @endif
                                        </div>
                                        <p>{{ sectionValue($country, 'title') }}</p>
                                    </a>

                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @include('front.components.sidebar')
        </div>
    </div>
@endsection