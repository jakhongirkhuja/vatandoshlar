@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')

    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <section class="newspaper">
                    @foreach ($items as $item)
                        <div class="newspapers">
                                <strong class="newspaper-title">
                                    {{ sectionValue($item, 'title') }}
                                </strong>

                                <p>
                                    {{ sectionValue($item, 'description') }}
                                </p>

                                @php
                                    $image = sectionImages($item, true);
                                @endphp
                                    <img src="{{ $image }}" alt="">
                        </div>
                    @endforeach
                </section>
            </div>

            @include('front.components.sidebar')
        </div>
    </div>
@endsection