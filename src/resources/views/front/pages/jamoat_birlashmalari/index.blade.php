@extends('front.layouts.layout')

@section('body')
<link rel="stylesheet" href="{{ asset('front/location/jqvmap.css') }}">
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
                            <div id="vmap"></div>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="{{ asset('front/location/jquery.vmap.min.js') }}"></script>
     <script src="{{ asset('front/location/jquery.vmap.uzb.js') }}"></script>
    <script>
        window.APP_LOCALE = '{{  app()->getLocale() ?? "uz" }}';
    </script>
    @include('front.components.location')
   

    <script>
        $(document).ready(function() {
            // Xaritani ishga tushirish
            if($('#vmap').length > 0) {
                $('#vmap').vectorMap({
                    map: 'uzb_fr',
                    backgroundColor: '#ffffff',
                    color: '#3b7cad',
                    hoverOpacity: 0.7,
                    selectedColor: '#666666',
                    enableZoom: true,
                    showTooltip: true,
                    onRegionClick: function(element, code, region) {
                        console.log('Siz bosgan viloyat: ' + region);
                    }
                });
            }
        });
    </script>
@endsection