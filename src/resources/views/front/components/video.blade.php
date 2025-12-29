@php
    $heroSection = menuSections(35, 1, false);
@endphp

@if($heroSection)
    <section class="hero">
        <div class="hero__bg">
            @php 
            $heroImage = sectionImages($heroSection, true);
             @endphp
            @if($heroImage)
                <img src="{{ $heroImage }}" alt="">
            @endif
        </div>

        <div class="hero__content container">
            <h1 class="hero__title">
                {{ sectionValue($heroSection, 'title') }}
            </h1>

            <button class="hero__btn">
                <i class="i-arrow"></i>
                <span>Batafsil</span>
            </button>
        </div>
    </section>
@endif
