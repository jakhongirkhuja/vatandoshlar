@extends('front.layouts.layout')

@section('body')
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const header = document.querySelector('.header');
            if (!header) return;

            function onScroll() {
                header.classList.toggle('light', window.scrollY <= 30);
            }

            onScroll();
            window.addEventListener('scroll', onScroll);
        });
    </script>
    @php
        $sections = menuSections(30, 2);
    @endphp

    @php

        $projects = $items->first();
        // dd($projects->children);
        $projectVideo = sectionImages($projects, true);

        if (!$projectVideo) {
            $projectVideo = asset('front/images/news_fallback.png');
        }
        $projectModalImage = sectionImages($projects, false);
        $currentSlug = request()->route('inside');

        $categories = menuSections(38, null, true, true) // limitni olib tashlaymiz
            ->reject(function ($item) use ($currentSlug) {
                return $item->slug === $currentSlug;
            })
            ->take(3);

    @endphp

    @if($projects)
        <div class="projects-hero">
            <div class="projects-hero__bg">

                <img src="{{ $projectVideo }}">

            </div>

            <div class="projects-hero__content">
                @if(sectionValue($projects, 'project_status') == 'inactive')
                    <p class="projects-hero__finish">{{ staticValue('inactive_project') }}</p>
                @endif
                <h1 class="projects-hero__title">
                    {{ sectionValue($projects, 'title') }}
                </h1>


                @if(sectionValue($projects, 'project_status') !== 'inactive')
                    <div class="projects-hero__wrapper">
                        @php
                            $otherPdf = sectionImages($projects, false);
                        @endphp
                        @if(isset($otherPdf[0]))
                            <a data-fancybox href="{{$otherPdf[0]}}" class="button projects-hero__wrapper--btn">{{staticValue('requirements')}}</a>
                        @endif
                        <a href="{{ route('home', ['locale' => app()->getlocale(), 'any' => request()->route('any'), 'inside' => $projects->slug, 'detail' => 'ariza-topshirish']) }}"
                            class="button projects-hero__wrapper--btn">{{staticValue('Participate')}}</a>
                    </div>
                @endif
                <a href="{{ sectionValue($projects, 'video') }}" class="projects-hero__btn" data-fancybox=" ">

                    <i class="i-play"></i>
                    <span>{{staticValue('video-play')}}</span>
                </a>
            </div>


        </div>
    @endif
    <div class="container mb-5">
        <div class="projects-categories">

            @foreach($categories as $category)
                <div class="projects-categories__item">
                    @php
                        $image = sectionImages($category, true);
                    @endphp
                    <a href="{{ route('home', ['locale' => app()->getLocale(), 'any' => request()->route('any'), 'inside' => $category->slug]) }}">
                        <p class="line-clamp-1">
                            {{ sectionValue($category, 'title') }}
                        </p>
                        <img src="{{ $image }}" alt="">
                    </a>
                </div>
            @endforeach
        </div>
        @php
            $years = pageSectionChilds($id, 'yillar-1')->filter(function ($year) {
                $yearVideos = $year->children->filter(fn($v) => mediaContent($v, true));
                $yearImages = collect(mediaContent($year, false))->filter();
                return $yearVideos->isNotEmpty() || $yearImages->isNotEmpty();
            })->values();
        @endphp
        @if($years->isNotEmpty())
            <div class="seasons-navigation">

                <div class="seasons-year-selector">
                    <button class="season-prev-year btn-circle small"><i class="i-prev"></i></button>
                    <div class="current-year-text">
                        @foreach ($years as $k => $projectYear)
                            <button class="year-label {{ $k == 0 ? 'active' : 'next' }}">{{sectionValue($projectYear, 'title')}}</button>
                        @endforeach
                    </div>
                    <button class="season-next-year btn-circle small"><i class="i-next"></i></button>
                </div>
            </div>
        @endif
        @foreach ($years as $year)
            @php
                $yearVideos = $year->children->filter(fn($v) => mediaContent($v, true));
                $yearImages = collect(mediaContent($year, false))->filter();
            @endphp

            <div class="year-section {{ $loop->first ? 'active' : '' }}" data-year="{{ sectionValue($year, 'title') }}">
                @if($yearVideos->isNotEmpty())
                    <div class="projects-video mb-5">
                        <div class="section-top">
                            <p>{{ staticValue('forum') }}</p>
                        </div>
                        <div class="carousel carousel3 owl-carousel">
                            @foreach($yearVideos as $videos)
                                @php
                                    $src = mediaContent($videos, true);
                                    $img = $src['image'];
                                    $poster = $src['poster'];
                                    $isVideo = \Illuminate\Support\Str::endsWith(\Illuminate\Support\Str::lower($img), ['.mp4', '.webm', '.ogg']);
                                @endphp
                                <a class="content__grid--item video-card" data-fancybox="gallery" href="{{$img}}">
                                    <div class="content__grid--item-img">
                                        @if($isVideo)
                                            <video src="{{ $img }}" poster="{{$poster}}" paused muted preload="metadata"></video>
                                        @else
                                            <img src="{{ $img }}" alt="">
                                        @endif
                                    </div>
                                    <div class="carousel__item--content">
                                        <p class="carousel__item--content-title line-clamp-2">
                                            {{ sectionValue($videos, 'title') }}
                                        </p>
                                        <p class="carousel__item--content-date"><i class="i-calendar"></i><span>
                                                {{ date('d-m-Y', strtotime($videos->created_at))}}</span>
                                    </div>
                                </a>
                            @endforeach
                        </div>
                    </div>
                @endif
                @if($yearImages->isNotEmpty())
                    <div class="projects-seasons">
                        <div class="section-top">
                            <p>{{staticValue('project')}}</p>
                        </div>
                        <div class="seasons-carousel">
                            @foreach($yearImages as $mediaItem)
                                @php
                                    $img = is_array($mediaItem) ? ($mediaItem['image'] ?? $mediaItem) : $mediaItem;
                                    $poster = is_array($mediaItem) && isset($mediaItem['poster']) ? $mediaItem['poster'] : '';
                                    $isVideo = \Illuminate\Support\Str::endsWith(\Illuminate\Support\Str::lower($img), ['.mp4', '.webm', '.ogg']);
                                @endphp
                                <a href="{{ $img }}" class="seasons-carousel__item" data-fancybox="seasons-gallery">
                                    @if($isVideo)
                                        <video src="{{ $img }}" @if($poster) poster="{{ $poster }}" @endif muted preload="metadata"></video>
                                    @else
                                        <img src="{{ $img }}" alt="">
                                    @endif
                                </a>
                            @endforeach
                        </div>
                    </div>

                    <div class="seasons-navigation">
                        <div class="seasons-nav-arrows">
                            <button class="season-prev-img btn-circle"><i class="i-prev"></i></button>
                            <button class="season-next-img btn-circle"><i class="i-next"></i></button>
                        </div>
                    </div>
                @endif
            </div>

        @endforeach
    </div>
    <script>

        Fancybox.bind("[data-fancybox]", {
            thumbs: false
        });
        (function () {
            'use strict';

            // Projects Seasons Carousel Logic
            const yearSections = document.querySelectorAll('.year-section');
            const yearLabels = document.querySelectorAll('.year-label');
            const prevYearBtn = document.querySelector('.season-prev-year');
            const nextYearBtn = document.querySelector('.season-next-year');
            const prevImgBtn = document.querySelector('.season-prev-img');
            const nextImgBtn = document.querySelector('.season-next-img');

            let currentSeasonIndex = 0;
            let currentImageIndices = new Array(yearSections.length).fill(0); // Track image index for each year section

            // Update image positions within a year section's carousel
            function updateImagePositions(yearIndex) {
                const yearSection = yearSections[yearIndex];
                if (!yearSection) return;

                const items = yearSection.querySelectorAll('.seasons-carousel__item');
                const currentIndex = currentImageIndices[yearIndex];
                const totalItems = items.length;

                items.forEach((item, index) => {
                    // Remove all position classes
                    item.classList.remove('close-prev', 'active', 'close-next',);

                    // Calculate relative position from current active item
                    const relativePosition = (index - currentIndex + totalItems) % totalItems;

                    // Assign appropriate class based on relative position
                    if (relativePosition === 0) {
                        item.classList.add('active');
                    } else if (relativePosition === 1) {
                        item.classList.add('close-next');
                    } else if (relativePosition === totalItems - 1) {
                        item.classList.add('close-prev');
                    }
                });
            }

            // Initialize carousel state
            function initCarousel() {
                // Initialize image positions for all year sections
                yearSections.forEach((section, index) => {
                    updateImagePositions(index);
                });
                updateSeasonDisplay();
                updateYearLabels();
            }

            // Update which year section is visible
            function updateSeasonDisplay() {
                yearSections.forEach((section, index) => {
                    if (index === currentSeasonIndex) {
                        section.classList.add('active');
                    } else {
                        section.classList.remove('active');
                    }
                });
            }

            // Update year labels styling with carousel positioning
            function updateYearLabels() {
                const totalYears = yearLabels.length;

                yearLabels.forEach((label, index) => {
                    label.classList.remove('active', 'close-prev', 'close-next',);

                    const relativePosition = (index - currentSeasonIndex + totalYears) % totalYears;

                    if (relativePosition === 0) {
                        label.classList.add('active');
                    } else if (relativePosition === 1) {
                        label.classList.add('close-next');
                    } else if (relativePosition === totalYears - 1) {
                        label.classList.add('close-prev');
                    }
                });
            }

            // Navigate to previous year (infinite loop)
            function goToPrevSeason() {
                currentSeasonIndex = (currentSeasonIndex - 1 + yearSections.length) % yearSections.length;
                updateSeasonDisplay();
                updateYearLabels();
            }

            // Navigate to next year (infinite loop)
            function goToNextSeason() {
                currentSeasonIndex = (currentSeasonIndex + 1) % yearSections.length;
                updateSeasonDisplay();
                updateYearLabels();
            }

            // Navigate to previous image in current year section
            function goToPrevImage() {
                const yearSection = yearSections[currentSeasonIndex];
                if (!yearSection) return;
                const items = yearSection.querySelectorAll('.seasons-carousel__item');
                const totalItems = items.length;

                currentImageIndices[currentSeasonIndex] =
                    (currentImageIndices[currentSeasonIndex] - 1 + totalItems) % totalItems;

                updateImagePositions(currentSeasonIndex);
            }

            // Navigate to next image in current year section
            function goToNextImage() {
                const yearSection = yearSections[currentSeasonIndex];
                if (!yearSection) return;
                const items = yearSection.querySelectorAll('.seasons-carousel__item');
                const totalItems = items.length;

                currentImageIndices[currentSeasonIndex] =
                    (currentImageIndices[currentSeasonIndex] + 1) % totalItems;

                updateImagePositions(currentSeasonIndex);
            }

            // Navigate to a specific year by clicking its label
            function goToSeason(index) {
                if (index >= 0 && index < yearSections.length) {
                    currentSeasonIndex = index;
                    updateSeasonDisplay();
                    updateYearLabels();
                }
            }

            // Event listeners
            if (prevYearBtn) prevYearBtn.addEventListener('click', goToPrevSeason);
            if (nextYearBtn) nextYearBtn.addEventListener('click', goToNextSeason);
            if (prevImgBtn) prevImgBtn.addEventListener('click', goToPrevImage);
            if (nextImgBtn) nextImgBtn.addEventListener('click', goToNextImage);

            // Year label click events
            yearLabels.forEach((label, index) => {
                label.addEventListener('click', () => goToSeason(index));
            });

            // Keyboard navigation
            document.addEventListener('keydown', (e) => {
                if (e.key === 'ArrowLeft') goToPrevImage();
                else if (e.key === 'ArrowRight') goToNextImage();
                else if (e.key === 'ArrowUp') goToPrevSeason();
                else if (e.key === 'ArrowDown') goToNextSeason();
            });

            // Touch/swipe and mouse drag support
            let touchStartX = 0;
            let touchEndX = 0;
            let touchStartY = 0;
            let touchEndY = 0;
            let isDragging = false;

            function attachSwipeEvents(carousel) {
                if (!carousel) return;

                // Touch events for mobile
                carousel.addEventListener('touchstart', (e) => {
                    touchStartX = e.changedTouches[0].clientX;
                    touchStartY = e.changedTouches[0].clientY;
                }, { passive: true });

                carousel.addEventListener('touchmove', (e) => {
                    touchEndX = e.changedTouches[0].clientX;
                    touchEndY = e.changedTouches[0].clientY;
                }, { passive: true });

                carousel.addEventListener('touchend', () => handleSwipe(), { passive: true });

                // Mouse events for desktop drag
                carousel.addEventListener('mousedown', (e) => {
                    isDragging = true;
                    touchStartX = e.clientX;
                    touchStartY = e.clientY;
                    carousel.style.cursor = 'grabbing';
                });

                carousel.addEventListener('mousemove', (e) => {
                    if (isDragging) {
                        touchEndX = e.clientX;
                        touchEndY = e.clientY;
                    }
                });

                carousel.addEventListener('mouseup', () => {
                    if (isDragging) {
                        handleSwipe();
                        isDragging = false;
                        carousel.style.cursor = 'grab';
                    }
                });

                carousel.addEventListener('mouseleave', () => {
                    if (isDragging) {
                        handleSwipe();
                        isDragging = false;
                        carousel.style.cursor = 'grab';
                    }
                });

                carousel.style.cursor = 'grab';
            }

            // Attach swipe/drag events to every year section's carousel
            yearSections.forEach(section => {
                attachSwipeEvents(section.querySelector('.seasons-carousel'));
            });

            function handleSwipe() {
                const swipeThreshold = 50;
                const diffX = touchStartX - touchEndX;
                const diffY = touchStartY - touchEndY;

                // Only trigger swipe if horizontal movement is greater than vertical
                if (Math.abs(diffX) > Math.abs(diffY) && Math.abs(diffX) > swipeThreshold) {
                    if (diffX > 0) {
                        // Swipe left - next image
                        goToNextImage();
                    } else {
                        // Swipe right - previous image
                        goToPrevImage();
                    }
                }

                // Reset values
                touchStartX = 0;
                touchEndX = 0;
                touchStartY = 0;
                touchEndY = 0;
            }

            // Initialize on load
            initCarousel();

            // Optional: Auto-play functionality (uncomment if needed)
            /*
            let autoPlayInterval;
            function startAutoPlay(interval = 3000) {
                autoPlayInterval = setInterval(() => {
                    goToNextImage();
                }, interval);
            }

            function stopAutoPlay() {
                if (autoPlayInterval) {
                    clearInterval(autoPlayInterval);
                }
            }

            // Start auto-play
            startAutoPlay();

            // Pause on hover
            const firstCarousel = yearSections[0]?.querySelector('.seasons-carousel');
            if (firstCarousel) {
                firstCarousel.addEventListener('mouseenter', stopAutoPlay);
                firstCarousel.addEventListener('mouseleave', () => startAutoPlay());
            }
            */

        })();
    </script>
    </div>


@endsection