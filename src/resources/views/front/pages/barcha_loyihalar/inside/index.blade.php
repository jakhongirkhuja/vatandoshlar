@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')
    @php
        $sections = menuSections(30, 2);
    @endphp

    <div class="layout">
        <div class="container">
            <div class="layout-content">
                @php
                
                    $projects = $items->first();
                    $projectVideo = sectionImages($projects, true);
                    $categories = menuSections(38,3,true,true);
                  
                @endphp

                @if($projects)
                    <div class="projects-hero">
                        <div class="projects-hero__bg">
                            @if($projectVideo)
                                <img src="{{ $projectVideo }}">
                            @endif
                        </div>

                        <div class="projects-hero__content">
                            <h1 class="projects-hero__title">
                                {{ sectionValue($projects, 'title') }}
                            </h1>
                            {{ sectionValue($projects,'timer') }}

                            <div class="projects-hero__wrapper">
                                <a href="{{sectionValue($projects,'url')}}" class="button projects-hero__wrapper--btn">Tanlov shartlari</a>
                                <a href="{{route('participation')}}" class="button projects-hero__wrapper--btn">Ishtirok etish</a>
                            </div>

                            <a href="#" class="projects-hero__btn">
                                <i class="i-play"></i>
                                <span>Video ko’rish</span>
                            </a>
                        </div>
                          

                    </div>
                @endif

                <div class="projects-categories">
                    @foreach($categories as $category)
                        <div class="projects-categories__item">
                            @php
                                $image = sectionImages($category, true);
                            @endphp

                            @if($image)
                                <img src="{{ $image }}" alt="">
                            @endif

                            <p class="line-clamp-1">
                                {{ sectionValue($category, 'title') }}
                            </p>
                        </div>
                    @endforeach
                </div>

                <div class="projects-video">
                    <div class="section-top">
                        <p>{{ staticValue('forum') }}</p>
                    </div>
                    <div class="carousel carousel3 owl-carousel ">
                        @foreach ($sections as $section)
                            @php
                                $mainImage = sectionImages($section);
                            @endphp
                            @foreach ($mainImage as $src)
                                <a class="carousel__item video-card" href="{{ $src }}">
                                    <div class="carousel__item--img">
                                        <img src="{{ $src }}" alt="">
                                    </div>
                                    <div class="carousel__item--content">
                                        <p class="carousel__item--content-title line-clamp-2">
                                            {{ sectionValue($section, 'url_title') }}
                                        </p>
                                        <p class="carousel__item--content-date"><i
                                                class="i-calendar"></i><span>{{ $section->created_at->toDateString() }}5</span>
                                        </p>
                                    </div>
                                </a>
                            @endforeach
                        @endforeach
                    </div>
                </div>
                <div class="projects-seasons">
                    <div class="section-top">
                        <p>Loyihadan lavhalar</p>
                    </div>
                    <div class="season-carousels">

                        @foreach ($projects->children as $k => $projectYear)
                            <div class="seasons-carousel {{ $k == 0 ? 'active' : '' }}">
                                @php
                                    $srcc = sectionImages($projectYear,false);

                                 @endphp
                                @foreach ($srcc as $s => $sr)

                                    <div class="seasons-carousel__item {{ $s == 0 ? 'active' : 'close-next' }}">
                                        <img src="{{ $sr }}" alt="">
                                    </div>
                                @endforeach

                            </div>


                        @endforeach


                    </div>
                    <div class="seasons-navigation">
                        <div class="seasons-nav-arrows">
                            <button class="season-prev-img btn-circle"><i class="i-prev"></i></button>
                            <button class="season-next-img btn-circle"><i class="i-next"></i></button>
                        </div>

                        <div class="seasons-year-selector">
                            <button class="season-prev-year btn-circle small"><i class="i-prev"></i></button>
                            <div class="current-year-text">

                                @foreach ($projects->children as $k => $projectYear)
                                    <button
                                        class="year-label {{ $k == 0 ? 'active' : 'next' }}">{{sectionValue($projectYear, 'title')}}</button>

                                @endforeach

                            </div>
                            <button class="season-next-year btn-circle small"><i class="i-next"></i></button>
                        </div>
                    </div>
                </div>
                <script>
                    (function () {
                        'use strict';

                        // Projects Seasons Carousel Logic
                        const seasonsCarousels = document.querySelectorAll('.seasons-carousel');
                        const yearLabels = document.querySelectorAll('.year-label');
                        const prevYearBtn = document.querySelector('.season-prev-year');
                        const nextYearBtn = document.querySelector('.season-next-year');
                        const prevImgBtn = document.querySelector('.season-prev-img');
                        const nextImgBtn = document.querySelector('.season-next-img');

                          let currentSeasonIndex = 0; // Start with the active season (2023)
                        let currentImageIndices = new Array(seasonsCarousels.length).fill(0); // Track image index for each season

                        // Update image positions within a carousel
                        function updateImagePositions(carouselIndex) {
                            const carousel = seasonsCarousels[carouselIndex];
                            if (!carousel) return;

                            const items = carousel.querySelectorAll('.seasons-carousel__item');
                            const currentIndex = currentImageIndices[carouselIndex];
                            const totalItems = items.length;

                            items.forEach((item, index) => {
                                // Remove all position classes
                                item.classList.remove('far-prev', 'close-prev', 'active', 'close-next', 'far-next');

                                // Calculate relative position from current active item
                                const relativePosition = (index - currentIndex + totalItems) % totalItems;

                                // Assign appropriate class based on relative position
                                if (relativePosition === 0) {
                                    item.classList.add('active');
                                } else if (relativePosition === 1) {
                                    item.classList.add('close-next');
                                } else if (relativePosition === 2) {
                                    item.classList.add('far-next');
                                } else if (relativePosition === totalItems - 1) {
                                    item.classList.add('close-prev');
                                } else if (relativePosition === totalItems - 2) {
                                    item.classList.add('far-prev');
                                }
                            });
                        }

                        // Initialize carousel state
                        function initCarousel() {
                            // Initialize image positions for all carousels
                            seasonsCarousels.forEach((carousel, index) => {
                                updateImagePositions(index);
                            });
                            updateSeasonDisplay();
                            updateYearLabels();
                        }

                        // Update which season carousel is visible
                        function updateSeasonDisplay() {
                            seasonsCarousels.forEach((carousel, index) => {
                                carousel.classList.remove('active');
                                if (index === currentSeasonIndex) {
                                    carousel.classList.add('active');
                                }
                            });
                        }

                        // Update year labels styling with carousel positioning
                        function updateYearLabels() {
                            const totalYears = yearLabels.length;

                            yearLabels.forEach((label, index) => {
                                label.classList.remove('active', 'close-prev', 'close-next', 'far-prev', 'far-next');

                                const relativePosition = (index - currentSeasonIndex + totalYears) % totalYears;

                                if (relativePosition === 0) {
                                    label.classList.add('active');
                                } else if (relativePosition === 1) {
                                    label.classList.add('close-next');
                                } else if (relativePosition === 2) {
                                    label.classList.add('far-next');
                                } else if (relativePosition === totalYears - 1) {
                                    label.classList.add('close-prev');
                                } else if (relativePosition === totalYears - 2) {
                                    label.classList.add('far-prev');
                                }
                            });
                        }

                        // Navigate to previous season/year (infinite loop)
                        function goToPrevSeason() {
                            currentSeasonIndex = (currentSeasonIndex - 1 + seasonsCarousels.length) % seasonsCarousels.length;
                            updateSeasonDisplay();
                            updateYearLabels();
                        }

                        // Navigate to next season/year (infinite loop)
                        function goToNextSeason() {
                            currentSeasonIndex = (currentSeasonIndex + 1) % seasonsCarousels.length;
                            updateSeasonDisplay();
                            updateYearLabels();
                        }

                        // Navigate to previous image in current season
                        function goToPrevImage() {
                            const carousel = seasonsCarousels[currentSeasonIndex];
                            const items = carousel.querySelectorAll('.seasons-carousel__item');
                            const totalItems = items.length;

                            currentImageIndices[currentSeasonIndex] =
                                (currentImageIndices[currentSeasonIndex] - 1 + totalItems) % totalItems;

                            updateImagePositions(currentSeasonIndex);
                        }

                        // Navigate to next image in current season
                        function goToNextImage() {
                            const carousel = seasonsCarousels[currentSeasonIndex];
                            const items = carousel.querySelectorAll('.seasons-carousel__item');
                            const totalItems = items.length;

                            currentImageIndices[currentSeasonIndex] =
                                (currentImageIndices[currentSeasonIndex] + 1) % totalItems;

                            updateImagePositions(currentSeasonIndex);
                        }

                        // Navigate to specific season by clicking year label
                        function goToSeason(index) {
                            if (index >= 0 && index < seasonsCarousels.length) {
                                currentSeasonIndex = index;
                                updateSeasonDisplay();
                                updateYearLabels();
                            }
                        }

                        // Event listeners
                        if (prevYearBtn) {
                            prevYearBtn.addEventListener('click', goToPrevSeason);
                        }

                        if (nextYearBtn) {
                            nextYearBtn.addEventListener('click', goToNextSeason);
                        }

                        if (prevImgBtn) {
                            prevImgBtn.addEventListener('click', goToPrevImage);
                        }

                        if (nextImgBtn) {
                            nextImgBtn.addEventListener('click', goToNextImage);
                        }

                        // Year label click events
                        yearLabels.forEach((label, index) => {
                            label.addEventListener('click', () => goToSeason(index));
                        });

                        // Keyboard navigation
                        document.addEventListener('keydown', (e) => {
                            if (e.key === 'ArrowLeft') {
                                goToPrevImage();
                            } else if (e.key === 'ArrowRight') {
                                goToNextImage();
                            } else if (e.key === 'ArrowUp') {
                                goToPrevSeason();
                            } else if (e.key === 'ArrowDown') {
                                goToNextSeason();
                            }
                        });

                        // Touch/swipe and mouse drag support
                        let touchStartX = 0;
                        let touchEndX = 0;
                        let touchStartY = 0;
                        let touchEndY = 0;
                        let isDragging = false;

                        const seasonCarouselsContainer = document.querySelector('.season-carousels');

                        if (seasonCarouselsContainer) {
                            // Touch events for mobile
                            seasonCarouselsContainer.addEventListener('touchstart', (e) => {
                                touchStartX = e.changedTouches[0].clientX;
                                touchStartY = e.changedTouches[0].clientY;
                            }, { passive: true });

                            seasonCarouselsContainer.addEventListener('touchmove', (e) => {
                                touchEndX = e.changedTouches[0].clientX;
                                touchEndY = e.changedTouches[0].clientY;
                            }, { passive: true });

                            seasonCarouselsContainer.addEventListener('touchend', (e) => {
                                handleSwipe();
                            }, { passive: true });

                            // Mouse events for desktop drag
                            seasonCarouselsContainer.addEventListener('mousedown', (e) => {
                                isDragging = true;
                                touchStartX = e.clientX;
                                touchStartY = e.clientY;
                                seasonCarouselsContainer.style.cursor = 'grabbing';
                            });

                            seasonCarouselsContainer.addEventListener('mousemove', (e) => {
                                if (isDragging) {
                                    touchEndX = e.clientX;
                                    touchEndY = e.clientY;
                                }
                            });

                            seasonCarouselsContainer.addEventListener('mouseup', (e) => {
                                if (isDragging) {
                                    handleSwipe();
                                    isDragging = false;
                                    seasonCarouselsContainer.style.cursor = 'grab';
                                }
                            });

                            seasonCarouselsContainer.addEventListener('mouseleave', (e) => {
                                if (isDragging) {
                                    handleSwipe();
                                    isDragging = false;
                                    seasonCarouselsContainer.style.cursor = 'grab';
                                }
                            });

                            // Set initial cursor
                            seasonCarouselsContainer.style.cursor = 'grab';
                        }

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
                        seasonCarouselsContainer.addEventListener('mouseenter', stopAutoPlay);
                        seasonCarouselsContainer.addEventListener('mouseleave', () => startAutoPlay());
                        */

                    })();
                </script>
            </div> {{-- layout-content --}}
            @include('front.components.sidebar')
        </div> {{-- container --}}
    </div> {{-- layout --}}
@endsection