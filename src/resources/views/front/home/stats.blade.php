<section class="stats">
    <div class="container">
        <div class="section-top">
            <p>{{staticValue('statisctic')}} </p>
        </div>

        <div class="stats__grid">
            @foreach(menuSections(3, 6, false) as $stat) 
                <div class="stats__grid--item">
                    <div class="stats__grid--item-img">
                        <img src="{{ sectionValue($stat, 'image') ? Storage::url(sectionValue($stat, 'image')) : asset('front/images/stats-img-1.svg') }}"
                            alt="{{ sectionValue($stat, 'title') }}">
                    </div>
                    <h3 class="stats__grid--item-title" data-count="{{ sectionValue($stat, 'number', 0) }}">
                        0+
                    </h3>
                    <p class="stats__grid--item-subtitle">{{ sectionValue($stat, 'title', 'Qatnashgan vatandoshlar soni') }}
                    </p>
                </div>
            @endforeach
        </div>
    </div>
</section>