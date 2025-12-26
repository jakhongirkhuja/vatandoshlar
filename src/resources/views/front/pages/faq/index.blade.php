@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <section class="faq">
                    @foreach ($items as $index => $item)
                        <button class="faq-item {{ $index === 0 ? 'active' : '' }}">
                            <p class="question">
                                {{ sectionValue($item, 'title') }}
                                <span class="toggle-btn i-dropdown"></span>
                            </p>
                            <p class="answer">
                                {{ sectionValue($item, 'description') }}
                            </p>
                        </button>
                    @endforeach
                </section>
            </div>
            @include('front.components.sidebar')
        </div>
    </div>
@endsection