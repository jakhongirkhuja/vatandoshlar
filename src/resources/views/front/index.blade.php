@extends('front.layouts.layout')
@section('body')
@php
    $heroSection = menuSections(35, 1)->first();
    $heroVideo = null;
    if($heroSection){
    $heroVideo = sectionImages($heroSection, true);
    }
            
             
    
@endphp
    @include('front.home.hero')
   
    <div class="layout-index">
        @include('front.home.about')
        @include('front.home.news')
        @include('front.home.projects')
        @include('front.home.press')
        @include('front.home.stats')
        @include('front.home.volunteers')
        @include('front.home.president')
        @include('front.home.socials')
        @include('front.home.links')
        @include('front.home.library')
        @include('front.home.contacts')
        @include('front.home.join-us')
    </div>
@endsection