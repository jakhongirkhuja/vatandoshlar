@extends('front.layouts.layout')

@section('body')
@include('front.components.breadcrumbs')

<div class="layout">
    <div class="container">
        <div class="layout-content">

            @foreach ($items as $k => $item)
                @if($k != 2)
                <div class="content">
                    <div class="{{ $k == 4 ? 'content__title text-center' : 'content__text' }} ">
                        @if($k != 0 && $k != 2)
                        @if($k == 4)
                        {{ sectionValue($item, 'title') }}
                        @else
                        <strong>{{ sectionValue($item, 'title') }}</strong>
                        @endif

                        @endif

                        {!! sectionValue($item, 'description') !!}

                    </div>
                    @php
                    $image = sectionImages($item, true);
                    @endphp
                    @if($image)
                    <div class="about__page">
                        <div class="about__page--img">
                            <img src="{{ $image }}" alt="">
                        </div>
                    </div>
                    @endif
                    @if(sectionValue($item, 'content'))
                    <div class="content__text">{{ sectionValue($item, 'content') }}</div>
                    @endif

                    @php
                    $images = sectionImages($item);
                    @endphp
                    @if($images && count($images) > 1)
                        <div class="carousel carousel3center owl-carousel">
                            @foreach($images as $img)
                            <a class="carousel__item" href="#">
                                <div class="carousel__item--img">
                                    <img src="{{ $img }}" alt="">
                                </div>
                            </a>
                            @endforeach
                        </div>
                    @endif

                </div>
                @else
                <a href="{{sectionValue($item,'url')}}" class="about__page--video" data-fancybox="gallery">
                    @php
                    $image = sectionImages($item, true);
                    @endphp
                    <img src="{{ $image }}" alt="">
                    <div class="play">
                        <img src="{{ asset('front') }}/images/play2.svg" class="i-play about__play--button" alt="">
                    </div>
                </a>
                @endif
            @endforeach
        </div>

        @include('front.components.sidebar')

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const dropdownItems = document.querySelectorAll('.sidebar__list--item.has-dropdown');

                dropdownItems.forEach(item => {
                    const button = item.querySelector('.sidebar__button');
                    const dropdown = item.querySelector('.sidebar__dropdown');

                    if (button) {
                        button.addEventListener('click', function (e) {
                            e.preventDefault();

                            // Toggle current item
                            item.classList.toggle('open');

                            // Close other dropdowns
                            dropdownItems.forEach(otherItem => {
                                if (otherItem !== item) {
                                    otherItem.classList.remove('open');
                                }
                            });
                        });
                    }
                });
            });
        </script>
    </div>
</div>
<script>
    Fancybox.bind("[data-fancybox]", {
        thumbs: false
    });
</script>
@endsection