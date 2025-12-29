@php
$sections = menuSections(31, 2, false);
$section = $sections->skip(1)->first();
$news = menuSections(26,3);
@endphp 

@extends('front.layouts.layout')

@section('body')    
    @include('front.components.breadcrumbs')

    <div class="layout">
        <div class="container">
            <div class="layout-content">
                @php 
                    //$items = $items->first()->children;
                    
                @endphp

                <div class="associations-detail">
                    {{-- About Section --}}
                    @foreach($items[0]->children as $key => $mainItem)
                      @if($key == 0)
                        <div class="associations-detail__about">
                            <div class="associations-detail__about--img">
                                @php $image = sectionImages($mainItem, true); @endphp
                                @if($image)
                                    <img src="{{ $image }}" alt="">
                                @endif
                            </div>
                            <div class="associations-detail__about--text">
                                <div class="associations-detail__about--text-title">
                                    <h2>{{ sectionValue($mainItem, 'title') }}</h2>
                                </div>
                                <div class="associations-detail__about--text-date">
                                    <div class="associations-detail__about--text-date-item">
                                        <p>Tashkil topgan sanasi:</p>
                                        <span><i class="i-calendar"></i> {{ sectionValue($mainItem, 'date_at') }}</span>
                                    </div>
                                    <div class="associations-detail__about--text-date-item">
                                        <p>Rahbari saylangan sanasi:</p>
                                        <span><i class="i-calendar"></i> {{ sectionValue($mainItem, 'boss_at') }}</span>
                                    </div>
                                </div>
                                <div class="associations-detail__about--text-hr"></div>
                                <div class="associations-detail__about--text-task">
                                    <p>Tashkilotning asosiy maqsad va vazifalari:</p>
                                    <span>{!! sectionValue($mainItem, 'description') !!}</span>
                                </div>
                            </div>
                        </div>
                    @endif

                    {{-- President Section --}}
                    @if($key == 1)
                    
                        <div class="associations-detail__president">
                            <div class="associations-detail__president--img">
                                @php $image = sectionImages($mainItem, true); 
                                @endphp
                                @if($image)
                                    <img src="{{ $image }}" alt="">
                                @endif
                            </div>
                            <div class="associations-detail__president--data">
                                <div class="associations-detail__president--data-name">
                                    <p>{{ sectionValue($mainItem, 'title') }}</p>
                                    <span>{{ sectionValue($mainItem, 'description') }}</span>
                                </div>
                                <div class="associations-detail__president--data-contact">
                                    <div class="associations-detail__president--data-contact-item">
                                        <p>Telefon raqam:</p>
                                        <span><i class="i-phone"></i> {{ sectionValue($mainItem, 'phone') }}</span>
                                    </div>
                                    <div class="associations-detail__president--data-contact-item">
                                        <p>Elektron manzil:</p>
                                        <span><i class="i-email"></i> {{ sectionValue($mainItem, 'email') }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif
                    @endforeach
                       @if($section)
    <div class="associations-detail__gallery">
        <h2 class="associations-detail__gallery--title">{{ sectionValue($section, 'title') }}</h2>
        
        <div class="carousel carousel3center owl-carousel">
            @php
                $mainImage = sectionImages($section);
            @endphp

            @if($mainImage)
                @foreach ($mainImage as $src)
                    <a href="{{ $src }}" class="carousel__item">
                        <div class="carousel__item--img">
                            <img src="{{ $src }}" alt="">
                        </div>
                    </a>
                @endforeach
            @endif
        </div>
    </div>
@endif
              <div class="associations-detail__news">
    @if ($news)
        <h2 class="associations-detail__gallery--title">{{ staticValue('news') }}</h2>
        <div class="carousel carousel3 owl-carousel">
            @foreach($news as $newsItem)
                <a class="carousel__item" href="{{ route('home', ['locale' => app()->getLocale(), 'any' => request()->route('any'), 'inside' => $newsItem->slug]) }}">
                    <div class="carousel__item--img">
                        @php
                            $mainImage = sectionImages($newsItem, true);
                        @endphp
                        @if($mainImage)
                            <img src="{{ $mainImage }}" alt="">
                        @endif
                    </div>
                    <div class="carousel__item--content">
                        <p class="carousel__item--content-title line-clamp-2">{{ sectionValue($newsItem, 'title') }}</p>
                        <p class="carousel__item--content-date">
                            <i class="i-calendar"></i>
                            <span>{{ $newsItem->created_at->format('d.m.Y') }}</span>
                        </p>
                    </div>
                </a>
            @endforeach
        </div>
    @endif
</div>
                </div>
            </div>
            @include('front.components.sidebar')
        </div>
    </div>
@endsection
