@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="content">
                   <h3> {{sectionValue($items,'title')}}</h3>
                    <h3> {{sectionValue($items,'description')}}</h3>
                </div>
                <div class="content">
                    <h3> {!!  sectionValue($items,'info')!!}</h3>
                </div>
            </div>
            @include('front.components.sidebar')
        </div>
    </div>
@endsection
