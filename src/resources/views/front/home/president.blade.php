<section class="president">
    <div class="container">
        @php
            $presidentSections = menuSections(4, 1);
            $item = $presidentSections->first(); 
        @endphp
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