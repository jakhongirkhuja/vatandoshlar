@extends('front.layouts.layout')

@section('body')
@include('front.components.breadcrumbs')
<div class="layout">
    <div class="container">
        <div class="layout-content">
            <div class="content">
                <h3> {{sectionValue($items, 'title')}}</h3>
                <h3> {{sectionValue($items, 'description')}}</h3>
            </div>
            @php
            $sectionContent = sectionValue($items, 'info');
            @endphp
            @if ($sectionContent)
            <div class="content">
                <div class="content-text"> {!! $sectionContent !!}</div>
            </div>
            @endif
        </div>
        @include('front.components.sidebar')
    </div>
</div>
@endsection