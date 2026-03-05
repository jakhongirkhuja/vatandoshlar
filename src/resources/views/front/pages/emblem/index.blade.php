@extends('front.layouts.layout')

@section('body')
@include('front.components.breadcrumbs')
<div class="layout">
    <div class="container">
        <div class="content d-flex flex-column align-items-center">
            <img src="{{ sectionImages($items[0], true) }}" style="border-radius: 12px; " alt="">

            <br>
            <div>
                <br>
                <h3 class="text-center">{{ sectionValue($items[0], 'title') }}</h3>
                <br>
                <div>{!! sectionValue($items[0], 'desc') !!}</div>
            </div>
        </div>
    </div>
</div>
@endsection