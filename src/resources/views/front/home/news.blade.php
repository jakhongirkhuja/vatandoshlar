@php
    $menuItself = menuSection(26);
    $newsSections = menuSections(26, 4, false);
@endphp

<section class="news-section">
    <div class="container">
        <div class="section-top">
            <p>Yangiliklar</p>
            <a href="{{ route('home', ['locale' => app()->getlocale(), 'any' => $menuItself->slug]) }}">Barchasi</a>

        </div>

        <div class="row">
            {{-- MAIN NEWS --}}
            @if($newsSections->first())
                @php
                    $main = $newsSections->first();
                    $mainImage = sectionImages($main, true);
                @endphp

                <div class="col-lg-6">
                    <a href="{{ route('home', ['locale' => app()->getlocale(), 'any' => $menuItself->slug, 'inside' => $main->slug]) }}"
                        class="news-section__item main">
                        @if($mainImage)
                            <img src="{{ $mainImage }}" alt="{{ sectionValue($main, 'title') }}">
                        @endif

                        <div class="news-section__item--content">
                            <h3 class="news-section__item--content-title line-clamp-2 no-tooltip">
                                {{ sectionValue($main, 'title') }}
                            </h3>

                            <div class="news-section__item--content-date">
                                {{ optional($main->created_at)->format('d F Y') }}
                            </div>
                        </div>
                    </a>
                </div>
            @endif

            {{-- SIDE NEWS --}}
            <div class="col-lg-6">
                <div class="news-section__wrapper">
                    @foreach($newsSections->skip(1) as $news)
                        @php
                            $img = sectionImages($news, true);
                        @endphp

                        <a href="{{ route('home', ['locale' => app()->getlocale(), 'any' => $menuItself->slug, 'inside' => $news->slug]) }}"
                            class="news-section__item">
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
                                    {{ optional($news->created_at)->format('d F Y') }}
                                </div>
                            </div>
                        </a>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>