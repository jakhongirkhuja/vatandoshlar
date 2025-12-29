@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="container">
                    <div class="associations__view">
                        <div class="associations__view--grid">
                            @php
                                $items = $items->first();
                            @endphp
                            @foreach ($items->children as $item)
                                                    <div class="associations__view--grid-item">
                                                        <div class="associations__view--grid-item-img">
                                                            @php
                                                                $image = sectionImages($item, true);
                                                            @endphp

                                                            @if($image)
                                                                <img src="{{ $image }}" alt="{{ sectionValue($item, 'title') }}">
                                                            @endif
                                                        </div>

                                                        <div class="associations__view--grid-item-content">
                                                            <p>
                                                                {{ sectionValue($item, 'title') }}
                                                            </p>

                                                            <a href="{{ route('home', ['locale' => app()->getLocale(), 'any' => $currentPage->slug,'inside'=>request()->route('inside') ,'detail' => $item->slug]) }}" class="btn-link">
                                                                Batafsil <i class="i-link"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                            @endforeach
                        </div>
                    </div>

                </div>
            </div>
            @include('front.components.sidebar')
        </div>
    </div>
@endsection