@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')

    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <section class="newspaper">
                    @foreach ($items as $item)
                        <div class="newspapers">
                            <a href="{{ route('home', [
                                'locale' => app()->getLocale(),
                                'any' => request()->route('any'),
                                'inside' => $item->slug
                            ]) }}">
                                <strong class="newspaper-title">
                                    {{ sectionValue($item, 'title') }}
                                </strong>

                                <p>
                                    {{ sectionValue($item, 'description') }}
                                </p>

                                @php
                                    $image = sectionImages($item, true);
                                @endphp

                                @if($image)
                                    <img src="{{ $image }}" alt="{{ sectionValue($item, 'title') }}">
                                @endif
                            </a>
                        </div>
                    @endforeach
                </section>
            </div>

            @include('front.components.sidebar')
        </div>
    </div>
@endsection
