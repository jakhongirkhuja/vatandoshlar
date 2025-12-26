@extends('front.layouts.layout')
@section('body')

    @include('front.home.hero')
    <section class="hero">
        <div class="hero__bg">
            <video class="hero__video" width="100%" height="100%" muted loop autoplay
                src="{{ asset('front') }}/images/hero-video.mp4" type="video/mp4"></video>
        </div>
        <div class="hero__content container">
            <h1 class="hero__title">Biz barcha vatandoshlarni birlashtirib ularga kerakli mativatsiya</h1>
            <button class="hero__btn"><i class="i-arrow"></i><span>Batafsil</span></button>
        </div>
    </section>
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