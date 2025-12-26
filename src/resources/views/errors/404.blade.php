@extends('front.layouts.layout')

@section('body')
    <div class="text-center my-5">
        <h1>404</h1>
        <h3>Oops! Page Not Found.</h3>
        <p>The page you are looking for does not exist.</p>
        <a href="{{ route('home') }}" class="btn btn-primary">Go Home</a>
    </div>
@endsection
