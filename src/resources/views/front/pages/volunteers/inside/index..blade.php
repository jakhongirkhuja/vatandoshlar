@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')

    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <section class="volunteers">
                    @foreach ($items as $item)
                        <strong>{{ sectionValue($item,'title') }}</strong>
                        @php
                        $image = sectionImages($item,true);
                        @endphp
                        <img src="{{ $image }}" alt="">
                        <p>{{ sectionValue($item,'phone') }}</p>
                        <p>{{ sectionValue($item,'email') }}</p>
                        <p>{{ sectionValue($item,'age') }}</p>
                    @endforeach
                </section>
            </div>

            @include('front.components.sidebar')
        </div>
    </div>
@endsection