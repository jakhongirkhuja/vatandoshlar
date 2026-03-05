@extends('front.layouts.layout')

@section('body')
@include('front.components.breadcrumbs')
<div class="layout">
    <div class="container">
        <div class="content d-flex flex-column align-items-center">
            <audio src="{{ sectionImages($items[0], true) }}" controls style="width: 100%;"></audio>
            <br>
            <div>
                <br>
                <h3 class="text-center">{{ sectionValue($items[0], 'title') }}</h3>
                <br>
                <div class="d-flex gap-3 flex-column">{!! sectionValue($items[0], 'desc') !!}</div>
            </div>
        </div>
    </div>
</div>
@endsection