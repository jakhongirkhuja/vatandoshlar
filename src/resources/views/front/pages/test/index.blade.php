@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')
{!!  sectionValue($items[0],'desc')!!}
@endsection