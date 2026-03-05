@extends('front.layouts.layout')
@section('body')
<div class="container">
    @include('front.components.breadcrumbs')
</div>
<section id="portfolio-details" class="portfolio-details section">

    <div class="container section-title" data-aos="fade-up">
        <h2>{{dd($items)}}</h2>
        <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
    </div>

    <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">

            <div class="col-lg-8">
                tes ts das ds
            </div>

            <div class="col-lg-4">
                @include('front.components.sidebar', ['menus' => $headerMenu])
                <div class="portfolio-info" data-aos="fade-up" data-aos-delay="200">
                    <h3>Project information</h3>
                    <ul>
                        <li><strong>Category</strong>: Web design</li>
                        <li><strong>Client</strong>: ASU Company</li>
                        <li><strong>Project date</strong>: 01 March, 2020</li>
                        <li><strong>Project URL</strong>: <a href="#">www.example.com</a></li>
                    </ul>
                </div>
                <div class="portfolio-description" data-aos="fade-up" data-aos-delay="300">
                    <h2>Exercitationem repudiandae officiis neque suscipit</h2>
                    <p>
                        Autem ipsum nam porro corporis rerum. Quis eos dolorem eos itaque inventore commodi labore quia quia. Exercitationem repudiandae officiis neque suscipit non officia eaque itaque enim. Voluptatem officia accusantium nesciunt est omnis tempora consectetur dignissimos. Sequi nulla at esse enim cum deserunt eius.
                    </p>
                </div>
            </div>

        </div>

    </div>

</section>
@endsection