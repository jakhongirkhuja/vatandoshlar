@extends('front.layouts.layout')
@section('body')
@php
$heroSection = menuSections(35, 1)->first();
$heroVideo = null;
$heroVideo = null;
if ($heroSection) {
$heroVideo = sectionImages($heroSection, true) ?? null;
$heroVideoMobile = sectionImages($heroSection, false)[0] ?? null;
}



@endphp
<div class="loader-wrapper">
    <div class="loader"></div>
</div>
<style>
    .loader-wrapper {
        position: fixed;
        inset: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        background: #fff;
        z-index: 9999;
        transition: opacity 0.5s ease;
    }

    .loader {
        height: 80px;
        aspect-ratio: 1;
        padding: 10px;
        border-radius: 50%;
        box-sizing: border-box;
        position: relative;
        mask: conic-gradient(#000 0 0) content-box exclude, conic-gradient(#000 0 0);
        filter: blur(12px);
    }

    .loader:before {
        content: "";
        position: absolute;
        inset: 0;
        background: repeating-conic-gradient(#0000 5% 5%, #002266, #0000 30% 50%);
        animation: l2 1.5s linear infinite;
    }

    @keyframes l2 {
        to {
            rotate: 1turn
        }
    }
</style>
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
@if ($heroSection)
<section class="hero">
    <div id="heroVideoSlot" class="hero__bg"></div>

    <script>
        const slot = document.getElementById('heroVideoSlot')
        function mountVideo() {
            if (window.innerWidth < 1024 && !slot.firstChild) {
                slot.innerHTML = '<video class="hero__video" muted loop autoplay playsinline src="{{$heroVideoMobile}}"></video>'
            }
            if (window.innerWidth >= 1024 && slot.firstChild) {
                slot.innerHTML = ''
            }
        }
        mountVideo()
        window.addEventListener('resize', mountVideo)
    </script>

    <div class="hero__content container">
        <h1 class="hero__title">
            {{ sectionValue($heroSection, 'title') }}
            <span class="hero-span">&nbsp;</span>
        </h1>

        <a href="{{url(app()->getLocale() . '/' . staticValue('more', 'url'))}}" class="hero__btn">
            <i class="i-arrow"></i>
            <span>{{staticValue('more')}}</span>

        </a>
    </div>
</section>

<script>

    const words = ["{{ sectionValue($heroSection, 'word1') }}", "{{ sectionValue($heroSection, 'word2') }}", "{{ sectionValue($heroSection, 'word3') }}"];
    const target = document.querySelector(".hero-span");
    let wordIndex = 0;
    let charIndex = 0;
    let isDeleting = false;

    const typeSpeed = 50;
    const deleteSpeed = 40;
    const pauseAfterType = 1500;
    const pauseAfterDelete = 300;

    function typeLoop() {
        const currentWord = words[wordIndex];

        if (!isDeleting) {
            charIndex++;
            target.textContent = currentWord.substring(0, charIndex);
            if (charIndex === currentWord.length) {
                isDeleting = true;
                return setTimeout(typeLoop, pauseAfterType);
            }
            return setTimeout(typeLoop, typeSpeed);
        }

        charIndex--;
        target.textContent = currentWord.substring(0, charIndex);
        if (charIndex === 0) {
            isDeleting = false;
            wordIndex = (wordIndex + 1) % words.length;
            return setTimeout(typeLoop, pauseAfterDelete);
        }
        return setTimeout(typeLoop, deleteSpeed);
    }

    typeLoop();
</script>
@endif

<div class="layout-index">

    @php
    $data = menuSections(2, 1);
    @endphp

    <section class="about-section">
        <div class="container">
            <ul class="about-section__left">
                @foreach(linkData() as $link)
                <li class="about-section__left-item">
                    <a class="about-section__left--link" href="{{ $link->url }}" target="_blank" rel="noopener noreferrer">

                        <i class="{{ $link->icon }}"></i>

                    </a>
                </li>
                @endforeach
            </ul>
            <div class="about-section__middle">
                <div class="about-section__middle--logo">
                    <img src="{{ asset('front') }}/images/logo.png" alt="">
                    <h2>{!! sectionValue($data[0], 'title')!!}</h2>
                </div>
                <div class="about-section__middle--content">
                    <p class="about-section__middle--content-text">{{sectionValue($data[0], 'description')}}
                    </p>

                    <div class="about-section__middle--content-video">
                        <a href="{{$heroVideo}}" target="_blank" rel="noopener noreferrer" data-fancybox>
                            @if($heroVideo)
                            <video class="hero-video" src="{{$heroVideo}}" loop autoplay muted></video>
                            @endif
                        </a>
                        <img src="{{ asset('front') }}/images/play2.svg" class="i-play about__play--button" alt="">
                    </div>
                </div>
            </div>
            <ul class="about-section__right">
                <li class="about-section__right--item">
                    <a href="{{ route('home', ['locale' => app()->getlocale(), 'flag']) }}" class="about-section__right--link">
                        <img src="{{ asset('front') }}/images/uz-flag.png" alt="">
                    </a>
                </li>
                <li class="about-section__right--item">
                    <a href="{{ route('home', ['locale' => app()->getlocale(), 'emblem']) }}" class="about-section__right--link">
                        <img src="{{ asset('front') }}/images/uz-emblem.png" alt="">
                    </a>
                </li>
                <li class="about-section__right--item">
                    <a href="{{ route('home', ['locale' => app()->getlocale(), 'hymn']) }}" class="about-section__right--link">
                        <img src="{{ asset('front') }}/images/uz-hymn.png" alt="">
                    </a>
                </li>

            </ul>
        </div>
    </section>

    <script>
        const video = document.querySelector('.hero-video');
        const aboutSection = document.querySelector('.about-section');
        const playButton = document.querySelector('.about__play--button');

        if (!video || !aboutSection || !playButton) {
            console.warn('Video animation elements not found');
        } else {
            const anim = video.animate(
                [{
                    width: '100vw',
                    height: '100dvh',
                    maxWidth: '100vw',
                    maxHeight: '100dvh',
                    bottom: '0px',
                    top: 'auto',
                    borderRadius: '0px'
                },
                {
                    transform: 'translate(-65%, 0)',
                },
                {
                    width: '400px',
                    height: 'auto',
                    bottom: '150px',
                    top: 'auto',
                    maxWidth: 'calc(100vw - 64px)',
                    maxHeight: '250px',
                    borderRadius: '20px'
                }
                ], {
                duration: 1000,
                easing: 'linear',
                fill: 'both'
            }
            );

            anim.pause();

            function setProgress(p) {
                const clamped = Math.max(0, Math.min(1, p));
                anim.currentTime = clamped * 1000;
            }

            let lastScrollY = window.scrollY;
            let lastDirection = 'down';
            let isAutoScrolling = false;
            let ticking = false;
            const minWidth = 1024;

            function isEnabled() {
                return window.innerWidth >= minWidth;
            }

            function resetVideoStyles() {
                video.style.position = 'static';
                video.style.transform = 'none';
                video.style.filter = 'none';
                video.style.left = '';
                video.style.right = '';
                video.style.bottom = '';
                video.style.width = '';
                video.style.height = '';
                playButton.style.display = 'flex';
                video.pause();
                setProgress(0);
                anim.cancel();
            }

            function snapScroll(sectionTop, sectionHeight, direction) {
                if (isAutoScrolling || !isEnabled()) return;

                const endTop = sectionTop + sectionHeight - window.innerHeight;
                const targetTop = direction === 'down' ? endTop : sectionTop;

                isAutoScrolling = true;
                window.scrollTo({
                    top: targetTop,
                    behavior: 'smooth'
                });
                setTimeout(() => {
                    isAutoScrolling = false;
                }, 360);
            }

            function updateVideoAnimation() {
                if (!isEnabled()) {
                    resetVideoStyles();
                    ticking = false;
                    return;
                }

                const sectionTop = aboutSection.offsetTop;
                const sectionHeight = aboutSection.clientHeight;
                const viewportHeight = window.innerHeight;
                const scrollFraction = (window.scrollY - sectionTop) / (sectionHeight - viewportHeight);
                const clampedFraction = Math.min(Math.max(scrollFraction, 0), 1);

                setProgress(clampedFraction);

                const currentY = window.scrollY;
                if (currentY !== lastScrollY) {
                    lastDirection = currentY > lastScrollY ? 'down' : 'up';
                    lastScrollY = currentY;
                }

                // Make video static when animation completes
                if (scrollFraction >= 1) {
                    video.style.position = 'static';
                    video.style.transform = 'none';
                    video.style.left = '';
                    video.pause();
                    playButton.style.display = 'flex';
                    video.style.filter = "opacity(0.5) saturation(0.5)";
                } else if (scrollFraction >= 0) {
                    video.style.position = 'fixed';
                    video.style.left = '50%';
                    video.style.transform = 'translate(-50%, 0)';
                    video.play().catch(() => { });
                    playButton.style.display = 'none';
                    video.style.filter = "none";
                }

                if (clampedFraction > 0.05 && clampedFraction < 0.95) {
                    snapScroll(sectionTop, sectionHeight, lastDirection);
                }

                ticking = false;
            }

            window.addEventListener('scroll', () => {
                if (ticking) return;
                ticking = true;
                requestAnimationFrame(updateVideoAnimation);
            });

            window.addEventListener('resize', () => {
                if (!isEnabled()) {
                    resetVideoStyles();
                } else {
                    // Recalculate on resize for enabled state
                    if (!ticking) {
                        ticking = true;
                        requestAnimationFrame(updateVideoAnimation);
                    }
                }
            });

            // Initial check
            if (!isEnabled()) {
                resetVideoStyles();
            }
        }
    </script>

    @php
    $menuItself = menuSection(26);
    $newsSections = menuSections(26, 4, false);
    @endphp

    <section class="news-section">
        <div class="container">
            <div class="section-top">
                <p>{{staticValue('news')}}</p>
                <a href="{{ route('home', ['locale' => app()->getlocale(), 'any' => $menuItself->slug]) }}">{{staticValue('all')}}
                    <i class="i-link"></i></a>

            </div>

            <div class="news-section__wrapper">
                {{-- MAIN NEWS --}}
                @if($newsSections->first())
                @php
                $main = $newsSections->first();
                $mainImage = sectionImages($main, true);
                if (!$mainImage) {
                $mainImage = asset('front/images/news_fallback.png');
                }
                @endphp
                <a href="{{ route('home', ['locale' => app()->getlocale(), 'any' => $menuItself->slug, 'inside' => $main->slug]) }}" class="news-section__item main" data-aos="fade-up" data-aos-delay="100">
                    @if($mainImage)
                    <img src="{{ $mainImage }}" alt="{{ sectionValue($main, 'title') }}">
                    @endif

                    <div class="news-section__item--content">
                        <h3 class="news-section__item--content-title line-clamp-2 no-tooltip">
                            {{ sectionValue($main, 'title') }}
                        </h3>

                        <div class="news-section__item--content-date">
                            {{ date('d.m.Y', strtotime($main->publish_at)) }}
                        </div>
                    </div>
                </a>
                @endif

                {{-- SIDE NEWS --}}
                <div class="news-section__list" data-aos="fade-up" data-aos-delay="200">
                    @foreach($newsSections->skip(1) as $i => $news)
                    @php
                    $img = sectionImages($news, true);
                    if (!$img) {
                    $img = asset('front/images/news_fallback.png');
                    }
                    @endphp

                    <a href="{{ route('home', ['locale' => app()->getlocale(), 'any' => $menuItself->slug, 'inside' => $news->slug]) }}" class="news-section__item" data-aos="fade-up" data-aos-delay="{{100 + $i * 100}}">
                        @if($img)
                        <div class="news-section__item--img">
                            <img src="{{ $img }}" alt="{{ sectionValue($news, 'title') }}">
                        </div>
                        @endif

                        <div class="news-section__item--content">
                            <h3 class="news-section__item--content-title line-clamp-2 no-tooltip">
                                {{ sectionValue($news, 'title') }}
                            </h3>

                            <div class="news-section__item--content-date">
                                {{ date('d.m.Y', strtotime($news->publish_at)) }}
                            </div>
                        </div>
                    </a>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
    <section class="projects" id="projects">
        <div class="container">
            <div class="section-top">
                <p>{{staticValue('projects')}}</p>
                @php
                $projectItself = menuSection(38);
                $projects = menuSections(38, 6, true, true);
                @endphp
                <a href="{{route('home', ['locale' => app()->getLocale(), 'any' => $projectItself->slug])}}">{{staticValue('all')}}
                    <i class="i-link"></i>
                </a>
            </div>

            <div class="projects__grid">
                @foreach ($projects as $i => $project)
                <a data-status="{{$project->modal_status}}" href="{{ route('home', ['locale' => app()->getLocale(), 'any' => $projectItself->slug, 'inside' => $project->slug]) }}" class="projects__grid--item" data-aos="fade-up"
                    data-aos-delay="{{100 + $i * 100}}">
                    <div class="projects__grid--item-img">
                        @php
                        $src = sectionImages($project, true);
                        @endphp
                        <img src="{{$src}}" alt="">
                    </div>
                    <h3 class="projects__grid--item-title">
                        {{ sectionValue($project, 'title') }}
                    </h3>
                </a>
                @endforeach
            </div>
        </div>
    </section>

    @php
    $newsp = menuSection(46);
    $newspapers = menuSections(46, 3, false);
    @endphp
    @if(count($newspapers) > 0)
    <section class="press-section">
        <div class="container">
            <div class="press-section__wrapper">
                <div class="press-section__left">
                    <div class="section-top">
                        <p>{{staticValue('newspapers')}}</p>
                        <a href="{{route('home', ['locale' => app()->getLocale(), 'any' => $newsp->slug])}}">{{staticValue('all')}}
                            <i class="i-link"></i></a>
                    </div>
                    <div class="press-section__left--wrapper">
                        @foreach ($newspapers as $i => $newspaper)
                        <a href="{{route('home', ['locale' => app()->getLocale(), 'any' => $newsp->slug, 'inside' => $newspaper->slug])}}" class="press-section__left--item" data-aos="zoom-in" data-aos-delay="{{100 + $i * 100}}">
                            <div class="press-section__left--item-img">
                                <img src="{{ sectionImages($newspaper, true) }}" alt="">
                            </div>
                            <div class="press-section__left--item-content">
                                <p>{{sectionValue($newspaper, 'title')}}</p>
                                <span>{{staticValue('more')}} <i class="i-link"></i></span>
                            </div>
                        </a>
                        @endforeach
                    </div>
                </div>
                <a href="{{staticValue('newspapers', 'url')}}" target="_blank" class=" press-section__right" data-aos="zoom-in" data-aos-delay="100">
                    <div class="section-top">
                        <p>{{staticValue('newspapers', 'content')}}</p>
                        <p class="link"">{{staticValue('all')}}
                            <i class=" i-link"></i>
                        </p>
                    </div>
                    <div class="press-section__right--wrapper">
                        <img class="journal-main" src="{{ staticImages('newspapers', true) }}" alt="">
                        <p>{{staticValue('newspapers', 'short_description')}}</p>
                        <p class="link">{{staticValue('all')}}<i class="i-link"></i></p>
                    </div>
                </a>

            </div>
    </section>
    @endif
    <section class="stats">
        <div class="container">
            <div class="section-top">
                <p>{{staticValue('statisctic')}} </p>
            </div>

            <div class="stats__grid">
                @foreach(menuSections(3, 6, false) as $i => $stat)
                <div class="stats__grid--item" data-aos="fade-in-up" data-aos-delay="{{100 + $i * 100}}">
                    <div class="stats__grid--item-img">
                        <img src="{{ sectionValue($stat, 'image')
                        ? Storage::url(sectionValue($stat, 'image'))
                        : asset('front/images/stats-img-' . ($i + 1) . '.svg') }}" alt="{{ sectionValue($stat, 'title') }}">
                    </div>
                    <h3 class="stats__grid--item-title" data-count="{{ sectionValue($stat, 'number', 0) }}">
                        0+
                    </h3>
                    <p class="stats__grid--item-subtitle">
                        {{ sectionValue($stat, 'title', 'Qatnashgan vatandoshlar soni') }}
                    </p>
                </div>
                @endforeach
            </div>
        </div>
    </section>
    @php
    $volunteers = menuSections(45, 9, false, true); // hammasini oling
    $vol1 = $volunteers->get(0);
    $vol2 = $volunteers->get(1);
    $vol3 = $volunteers->get(2);
    $vol4 = $volunteers->get(3);
    $vol5 = $volunteers->get(4);
    $vol6 = $volunteers->get(5);
    $vol7 = $volunteers->get(6);
    $vol8 = $volunteers->get(7);
    $vol9 = $volunteers->get(8);
    @endphp
    @if ($volunteers->count() > 0)
    <section class="volunteers">
        <div class="container">
            <div class="section-top">
                <p>{{ staticValue('volunteers') }}</p>
                <a href="#">{{ staticValue('all') }}<i class="i-link"></i></a>
            </div>

            <div class="volunteers__wrapper">
                <div class="volunteers__left">
                    <div class="volunteers__left-left">
                        <div class="item">
                            <img src="{{ sectionImages($vol1, true) }}" alt="">
                        </div>
                        <div class="volunteers__left-left-bottom">
                            <div class="item">
                                <img src="{{ sectionImages($vol2, true) }}" alt="" data-aos="zoom-in" data-aos-delay="100">
                            </div>
                            <div class="item">
                                <img src="{{ sectionImages($vol3, true) }}" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <img src="{{ sectionImages($vol4, true) }}" alt="">
                    </div>
                </div>

                <div class="volunteers__right">
                    <div class="volunteers__right-left">
                        <div class="item">
                            <img src="{{ sectionImages($vol5, true) }}" alt="">
                        </div>
                        <div class="item">
                            <img src="{{ sectionImages($vol6, true) }}" alt="">
                        </div>
                    </div>

                    <div class="volunteers__right-right">
                        <div class="volunteers__right-right-top">
                            <div class="item">
                                <img src="{{ sectionImages($vol7, true) }}" alt="">
                            </div>
                            <div class="item">
                                <img src="{{ sectionImages($vol8, true) }}" alt="">
                            </div>
                        </div>

                        <div class="item">
                            <img src="{{ sectionImages($vol9, true) }}" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    @endif
    @php
    $presidentSections = menuSections(4, 1);
    $item = $presidentSections->first();

    @endphp
    @if ($presidentSections->count() > 0)

    <section class="president">
        <div class="container">

            <div class="section-top">
                <p> “{{ sectionValue($item, 'title') }}” </p>
            </div>
            <div class="president__wrapper">
                @if($item)
                <div class="president__right">
                    <p class="president__right--text">
                        “{{ sectionValue($item, 'content') }}”
                    </p>
                    <p class="president__right--name">
                        — {{ sectionValue($item, 'description') }}
                    </p>
                    <span class="president__right--position">
                        {{ sectionValue($item, 'content1') }}
                    </span>
                </div>
                <div class="president__left">
                    <img src="{{ sectionImages($item, true) }}" width="520" alt="{{ sectionValue($item, 'title') }}">
                </div>
                @endif
            </div>
        </div>
    </section>
    @endif


    <section class="links">
        <div class="container">
            <div class="section-top">
                <p>{{ staticValue('podcasts') }}</p>
                <!-- <a href="#">{{ staticValue('all') }}<i class="i-link"></i></a> -->
            </div>
        </div>

        <div class="links__carousel owl-carousel">
            @php
            $podcasts = menuSections(52, 4);
            @endphp

            @foreach($podcasts as $podcast)
            @php
            $images = sectionImages($podcast); // array kutiladi
            @endphp

            <a class="slide" href="{{ sectionValue($podcast, 'url') }}" target="_blank">
                <div class="slide__images">
                    @if(isset($images[0]))
                    <img class="active" src="{{ $images[0] }}" alt="{{ sectionValue($podcast, 'title') }}">
                    @endif

                    @if(isset($images[1]))
                    <img class="after" src="{{ $images[1] }}" alt="{{ sectionValue($podcast, 'title') }}">
                    @endif

                    @if(isset($images[2]))
                    <img class="before" src="{{ $images[2] }}" alt="{{ sectionValue($podcast, 'title') }}">
                    @endif
                </div>

                <div class="wrapper">
                    <p class="title">{{ sectionValue($podcast, 'title') }}</p>
                    <span>{{ sectionValue($podcast, 'description') }}</span>
                </div>
            </a>
            @endforeach
        </div>
    </section>

    <section class="library__section">
        <div class="container">
            <div class="library__section--wrapper">
                <div class="library__section--left">
                    <div class="library__section--logo">
                        @php
                        $library = menuSections(51)->first();
                        $images = sectionImages($library);
                        @endphp

                        @if($library && is_array($images))
                        @foreach($images as $image)
                        <img src="{{ $image }}" alt="{{ sectionValue($library, 'title') }}">
                        @endforeach
                        @endif
                    </div>
                    <h4 class="library__section--title">{!! sectionValue($library, 'title') !!}</h4>
                    <p class="library__section--text">
                        {{ sectionValue($library, 'description') }}
                    </p>
                    <a class="button library__section--link" href="{{ sectionValue($library, 'url') }}" target="_blank">{{ sectionValue($library, 'url_title') }}</a>
                </div>
                @php
                $libraryBooks = menuSections(50, 3, false);
                @endphp
                <div class="library__section--right">
                    {{-- Carousel 1 --}}
                    <div class="carousel library-carousel1">
                        @for($i = 0; $i < 2; $i++) @foreach($libraryBooks as $item) @php $image=sectionImages($item, true); @endphp <img src="{{$image }}" alt="">
                            @endforeach
                            @endfor
                    </div>

                    {{-- Carousel 2 --}}
                    <div class="carousel library-carousel2">
                        @for($i = 0; $i < 2; $i++) @foreach($libraryBooks as $item) @php $image=sectionImages($item, true); @endphp <img src="{{$image }}" alt="">
                            @endforeach
                            @endfor
                    </div>

                    {{-- Carousel 3 --}}
                    <div class="carousel library-carousel3">
                        @for($i = 0; $i < 2; $i++) @foreach($libraryBooks as $item) @php $image=sectionImages($item, true); @endphp <img src="{{$image }}" alt="">
                            @endforeach
                            @endfor
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        const setCarouselVars = () => {
            document.querySelectorAll(".library__section--right").forEach(c => {
                c.style.setProperty("--c-width", `${c.offsetWidth}px`)
                // console.log(c.offsetWidth);
            })
        }
        setCarouselVars();
        window.addEventListener("DOMContentLoaded", setCarouselVars)
        window.addEventListener("resize", setCarouselVars)
        document.addEventListener("DOMContentLoaded", () => {
            const contactLeft = document.querySelector(".contacts__left");
            const contactMainImg = document.querySelector(".contacts__left--img img");
            const contactImg = document.querySelector(".contacts__left img");

            // Journal main image 3D effect
            const journalWrapper = document.querySelector(".press-section__right--wrapper");
            const journalImg = document.querySelector(".journal-main");

            if (journalWrapper && journalImg) {
                gsap.set(journalWrapper, {
                    perspective: 1000,
                    transformStyle: "preserve-3d"
                });

                gsap.set(journalImg, {
                    transformStyle: "preserve-3d",
                    transformOrigin: "center center"
                });

                const journalRX = gsap.quickTo(journalImg, "rotationX", { duration: 0.6, ease: "power2.out" });
                const journalRY = gsap.quickTo(journalImg, "rotationY", { duration: 0.6, ease: "power2.out" });
                const journalZ = gsap.quickTo(journalImg, "z", { duration: 0.6, ease: "power2.out" });
                const journalScale = gsap.quickTo(journalImg, "scale", { duration: 0.4, ease: "power2.out" });

                journalWrapper.addEventListener("pointermove", (e) => {
                    const rect = journalWrapper.getBoundingClientRect();
                    const centerX = (e.clientX - rect.left) / rect.width - 0.5;
                    const centerY = (e.clientY - rect.top) / rect.height - 0.5;

                    journalRY(centerX * 24);
                    journalRX(-centerY * 24);
                    journalZ(30);
                    journalScale(1.05);
                });

                journalWrapper.addEventListener("pointerleave", () => {
                    journalRX(0);
                    journalRY(0);
                    journalZ(0);
                    journalScale(1);
                });
            }

            if (!contactLeft || !contactMainImg || !contactImg) return;

            // Set 3D perspective on parent
            gsap.set(contactLeft, {
                perspective: 1000,
                transformStyle: "preserve-3d"
            });

            gsap.set([contactMainImg, contactImg], {
                transformStyle: "preserve-3d",
                transformOrigin: "center center"
            });

            // Create smooth quickTo animations forcontactMain image
            const contactMainRX = gsap.quickTo(contactMainImg, "rotationX", {
                duration: 0.6,
                ease: "power2.out"
            });
            const contactMainRY = gsap.quickTo(contactMainImg, "rotationY", {
                duration: 0.6,
                ease: "power2.out"
            });
            const contactMainZ = gsap.quickTo(contactMainImg, "z", {
                duration: 0.6,
                ease: "power2.out"
            });
            const contactMainScale = gsap.quickTo(contactMainImg, "scale", {
                duration: 0.4,
                ease: "power2.out"
            });

            // Create smooth quickTo animations for contact image (with different intensity)
            const contactRX = gsap.quickTo(contactImg, "rotationX", {
                duration: 0.8,
                ease: "power2.out"
            });
            const contactRY = gsap.quickTo(contactImg, "rotationY", {
                duration: 0.8,
                ease: "power2.out"
            });
            const contactZ = gsap.quickTo(contactImg, "z", {
                duration: 0.8,
                ease: "power2.out"
            });
            const contactX = gsap.quickTo(contactImg, "x", {
                duration: 0.8,
                ease: "power2.out"
            });
            const contactY = gsap.quickTo(contactImg, "y", {
                duration: 0.8,
                ease: "power2.out"
            });

            contactLeft.addEventListener("pointermove", (e) => {
                const rect = contactLeft.getBoundingClientRect();
                const x = (e.clientX - rect.left) / rect.width;
                const y = (e.clientY - rect.top) / rect.height;

                // Center-based coordinates (-0.5 to 0.5)
                const centerX = x - 0.5;
                const centerY = y - 0.5;

                // contactMain image - stronger 3D effect
                contactMainRY(centerX * 20);
                contactMainRX(-centerY * 20);
                contactMainZ(30);
                contactMainScale(1.05);

                // contact image - subtle parallax effect (moves in opposite direction)
                contactRY(centerX * 5);
                contactRX(-centerY * 5);
                contactZ(-20);
                contactX(centerX * 40);
                contactY(centerY * 40);
            });

            contactLeft.addEventListener("pointerleave", () => {
                // Reset contactMain image
                contactMainRX(0);
                contactMainRY(0);
                contactMainZ(0);
                contactMainScale(1);

                // Reset contact image
                contactRX(0);
                contactRY(0);
                contactZ(0);
                contactX(0);
                contactY(0);
            });
        });
    </script>
    <section class="contacts">
        <div class="container">
            <div class="contacts__wrapper">
                <div class="contacts__right">
                    <h5>{{staticValue('platform')}}</h5>
                    <p>{{staticValue('platform', 'content')}}</p>
                    <div class="contacts__right--wrapper">
                        @if(staticValue('button1'))
                        <a class="button" target="_blank" href="https://murojaat.vatandoshlar.uz/">{{staticValue('button1')}}</a>
                        @endif
                    </div>
                </div>
                <div class="contacts__left">
                    <div class="contacts__left--img">
                        <img src="{{ asset('front') }}/images/contact-main.png" width="520" alt="">
                    </div>
                    <img src="{{ asset('front') }}/images/contacts-pattern.svg" alt="">
                </div>
            </div>
            <script>
                Fancybox.bind("[data-fancybox]", {
                    thumbs: false
                });
            </script>
    </section>
    @php
    $join_us = menuSections(53, 2);
    $join_us1 = $join_us->first();
    $join_us2 = $join_us->last();
    $images = sectionImages($join_us1);
    @endphp
    @if ($join_us->count() > 0)
    <section class="social">
        <div class="container">
            <div class="section-top">
                <p>{{staticValue('knowledge')}} </p>
            </div>
            @php
            $socials = menuSections(47, 2);
            $social1 = isset($socials[0]) ? $socials[0] : null;
            $social2 = isset($socials[1]) ? $socials[1] : null;
            @endphp

            <div class="social__wrapper">
                @if($social1)
                <div class="social__card" data-aos="fade-right" data-aos-delay="100">
                    <div class="social__card--content">

                        <h6>{{sectionValue($social1, 'title')}}</h6>
                        <p>{{sectionValue($social1, 'description')}}</p>
                        <div class="d-flex align-items-center gap-2">
                            <a class="link" href="{{sectionValue($social1, 'link1')}}" target="_blank"><img src="{{ asset('front') }}/images/appstore.svg" alt=""></a>
                            <a class="link" href="{{sectionValue($social1, 'link2')}}" target="_blank"><img src="{{ asset('front') }}/images/googleplay.svg" alt=""></a>
                        </div>
                    </div>
                    <div class="social__card--img">
                        @php
                        $image = sectionImages($social1, true);
                        @endphp
                        <img src="{{ $image}}" width="280" alt="">
                    </div>
                </div>
                @endif
                @if($social2)
                <div class="social__card" data-aos="fade-left" data-aos-delay="100">
                    <div class="social__card--content">
                        <h6>{{sectionValue($social2, 'title')}}</h6>
                        <p>{{sectionValue($social2, 'description')}}</p>
                        <a class="button" href="{{sectionValue($social2, 'link1')}}" target="_blank">{{staticValue('keyboard')}}</a>
                    </div>
                    <div class="social__card--img">
                        @php
                        $imagesFalse = sectionImages($social2, true);

                        @endphp
                        <img src="{{$imagesFalse }}" width="280" alt="">
                    </div>
                </div>
                @endif
            </div>
    </section>
    @php
    $partners = menuSections(59);
    @endphp
    @if($partners->count())
    <section class="partners pb-5">
        <div class="container pb-0  ">
            <div class="section-top">
                <p>{{staticValue('partners')}}</p>
            </div>
        </div>
        <div class="partners__wrapper">
            <div class="partners__carousel owl-carousel">
                @foreach($partners as $k => $partner)
                <a class="partners__carousel--item {{$k == 0 ? 'active' : ''}}" href="{{ sectionValue($partner, 'link') }}" target="_blank" data-aos="zoom-in" data-aos-delay="{{100 + $k * 100}}">
                    <img src="{{sectionImages($partner, true)}}" alt="Partners">
                </a>
                @endforeach
            </div>
        </div>

    </section>

    @endif
    <section class="join-us">
        <div class="container">
            <div class="join-us__img join-us__img--left">

                @foreach($images as $i => $image)
                <div class="join-us__img--item" data-aos="zoom-in-left" data-aos-delay="{{100 + $i * 100}}">
                    <img src="{{ $image }}">
                </div>
                @endforeach
            </div>
            <div class="join-us__content">
                <h2>{{ staticValue('vatandosh') }}</h2>
                <p>{{ staticValue('vatandosh1') }}</p>

                @if(staticValue('button1'))
                <a class="join-us__content--btn" href="{{ route('home', ['locale' => app()->getlocale(), 'any' => 'application']) }}">
                    {{ staticValue('button1') }}
                </a>
                @endif
            </div>
            <div class="join-us__img join-us__img--right">
                @php
                $images = sectionImages($join_us2);
                @endphp

                @foreach($images as $i => $image)
                <div class="join-us__img--item" data-aos="zoom-in-right" data-aos-delay="{{100 + $i * 150}}">
                    <img src="{{ $image }}">
                </div>
                @endforeach
            </div>
        </div>
    </section>
    @endif

</div>
@if(staticValue("project-popup"))
<div class="modal fade projects-requirement" id="ReqModel" tabindex="-1" aria-labelledby="ReqModelLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl ">
        <div class="modal-content projects-requirement__wrapper">
            <div class="projects-requirement__wrapper--inner">
                <div class="projects-requirement__content">
                    <h5 class="projects-requirement__content--title">{{staticValue("project-popup", "title")}}</h5>
                    <div class="projects-requirement__content--text mb-4">
                        {!!staticValue("project-popup", "editor")!!}
                    </div>

                    <div class="projects-requirement__content--buttons">
                        <a class="button" href="{{ staticValue('project-popup', 'url') }}">{{staticValue('more')}}</a>
                        <button class=" button" data-bs-dismiss="modal">{{staticValue('cancel')}}</button>
                    </div>
                </div>
                <div class="projects-requirement__img">
                    <img src="{{staticImages('project-popup', true)}}" alt="">
                </div>
            </div>
            <button class="floating-close" data-bs-dismiss="modal">
                <i class="i-close"></i>
            </button>
        </div>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        let m = document.getElementById("ReqModel"), p = document.getElementById("projects");
        if (!m || !p || sessionStorage.getItem("projectsModalShown")) return;
        let modal = new bootstrap.Modal(m);
        let o = new IntersectionObserver(e => {
            if (e[0].isIntersecting) {
                modal.show();
                sessionStorage.setItem("projectsModalShown", "1");
                o.disconnect();
            }
        }, { threshold: .4 });
        o.observe(p);
    });
</script>
@endif
@endsection
