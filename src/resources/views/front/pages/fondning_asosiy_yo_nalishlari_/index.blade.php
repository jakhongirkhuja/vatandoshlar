@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="directions content">
                    @foreach ($items as $index => $item)
                        <div class="directions__card">
                            <div class="directions__card--img">
                                <div class="directions__card--img-logo">
                                    @php
                                        $mainImage = sectionImages($item, true);
                                    @endphp
                                    @if($mainImage)
                                        <img src="{{ $mainImage }}" alt="{{ sectionValue($item, 'title') }}">
                                    @endif
                                </div>
                                <div class="directions__card--num">
                                    {{ $index + 1 }}
                                </div>
                            </div>
                            <div class="directions__card--text">
                                {{ sectionValue($item, 'title') }}
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
            @include('front.components.sidebar')
        </div>
    </div>
@endsection