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
                                @if(isset($items[1]) && $items[1]->children)
                                    @foreach($items[1]->children as $country)
                                        <a href=href="{{ route('home',['locale'=>app()->getlocale(), 'any'=>request()->route('any'),'inside'=>$country->slug]) }}" class="associations__grid--item">
                                            <div class="associations__grid--item-img">
                                                @if($flag = sectionImages($country))
                                                    <img src="{{ $flag[0] }}" href="{{ route('home',['locale'=>app()->getlocale(), 'any'=>request()->route('any'),'inside'=>$country->slug]) }}">
                                                @endif
                                            </div>
                                            <p>{{ sectionValue($country, 'title') }}</p>
                                        </a>
                                    @endforeach
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @include('front.components.sidebar')
        </div>
    </div>
@endsection