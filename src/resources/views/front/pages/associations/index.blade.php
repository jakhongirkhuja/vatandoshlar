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
                       {{staticValue('map')}}
                        </button>
                        <button data-tab-system="1" class="tab-button">
                        {{staticValue('grid')}}
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
    <link href="{{ asset('front/location2/jqvmap.css') }}" rel="stylesheet"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="{{ asset('front/location2/jquery.vmap.min.js') }}"></script>
    <script src="{{ asset('front/location2/jquery.vmap.world.js') }}"></script>
    <script src="{{ asset('front/location2/jquery.vmap.sampledata.js') }}"></script>
    <script src="{{ asset('front/location2/locales.json') }}"></script>

    <script>
        $(document).ready(function () {

            var currentLang = "{{ app()->getLocale() }}";

            var jsonPath = "{{ asset('front/location2/locales.json') }}";
            var selectedCountries = [
                @foreach($items as $k => $country)
                    "{{ sectionValue($country, 'code') }}"@if(!$loop->last),@endif
                @endforeach
            ];
            window.countryRoutes = {
                @foreach($items as $country)
                "{{ sectionValue($country, 'code') }}": "{{ route('home', [
                'locale' => app()->getLocale(),
                'any' => request()->route('any'),
                'inside' => $country->slug
            ]) }}",
                @endforeach
            };


            var mapLabels;
            $.getJSON(jsonPath, function(data) {
                mapLabels = data[currentLang];
            }).fail(function() {
                console.error("Could not load locales.json. Check the file path.");
            });




            makeMap();
            function makeMap(details, colors) {
                $('#vmap').vectorMap({
                    map: 'world_en',
                    backgroundColor: '',
                    labels: mapLabels,
                    borderColor: '#0A1F44',
                    color: '#D5EBFF',
                    selectedColor: '#1d3a6bff',
                    hoverColor: '#233a63ff',
                    enableZoom: true,
                    showTooltip: true,
                    selectedRegions: selectedCountries,
                    // scaleColors: ['#e2ebfb', '#cfdcf7'],
                    // values: sample_data,
                    normalizeFunction: 'polynomial',

                    onLabelShow: function(event, label, code) {

                        if(mapLabels[code.toUpperCase()]) {
                            label.text(mapLabels[code.toUpperCase()]);

                        }
                    },
                    onRegionClick: function (element, code, region) {
                        code = code.toUpperCase();
                        if (window.countryRoutes[code]) {
                            window.location.href = window.countryRoutes[code];
                        } else {
                            // No country page → block click
                            event.preventDefault();
                            return false;
                        }
                    },
                });
            }

            var $tooltip = $('.jqvmap-label');
            $('#vmap').on('mousemove', function (e) {
                $tooltip.css({
                    left: e.clientX + 15 + 'px',
                    top: e.clientY + 15 + 'px'
                });
            });

        });
    </script>
    <style>
        #vmap {
            position: relative;
            width: 90%;
            height: auto;
            display: flex;
            margin: 95px auto;
            min-height: 500px;
        }

        #vmap svg {
            width: 100%;
            height: 100%;
        }

        @media (max-width: 768px) {
            #vmap {
                /* min-height: 400px;  */
                width: 100%;
                margin: 50px 0;
            }

            #vmap svg {
                padding-top: 50px;
            }
        }

        @media (max-width: 575px) {
            #vmap {
                min-height: 300px;
                margin: 30px 0;
            }
        }

        .map_block {
            position: relative;
        }

        .jqvmap-label {
            position: fixed !important;
            z-index: 9999;
        }
    </style>
@endsection
