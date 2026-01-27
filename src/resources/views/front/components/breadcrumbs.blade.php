<div class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-wrapper">
            <ul class="breadcrumbs__list">
                @foreach($breadcrumbs as $menu)
                    @php
                        $locale = app()->getLocale();
                        $link = match ($menu->type) {
                            'page' => url($locale . '/' . $menu->slug),
                            'category', 'section' => '#',
                            default => '#',
                        };
                    @endphp

                    <li class="breadcrumbs__list--item">
                        <a href="{{ $link }}" class="breadcrumbs__link">
                            {{ sectionValue($menu, 'title') }}
                        </a>
                    </li>

                    @if(!$loop->last)
                        <li class="breadcrumbs__list--item">
                            <i class="i-dropdown"></i>
                        </li>
                    @endif
                @endforeach
            </ul>
            @if($breadcrumbs->count())
                <h1 class="breadcrumbs__title">
                    {{ sectionValue($breadcrumbs->last(), 'title') }}
                </h1>
            @endif
        </div>
    </div>
</div>