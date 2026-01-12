@extends('front.layouts.layout')
@section('body')
    <div class="container">
        @include('front.components.breadcrumbs')
    </div>
    <section id="portfolio-details" class="portfolio-details section">

        <div class="container section-title" data-aos="fade-up">
            <h2>Static PAGE</h2>
            <p>sdsd</p>
        </div>

        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <div class="row gy-4">

                <div class="col-lg-8">
                    Statis
                </div>

                <div class="col-lg-4">
                    @include('front.components.sidebar', ['menus' => $headerMenu])

                </div>

            </div>

        </div>

    </section>
@endsection
