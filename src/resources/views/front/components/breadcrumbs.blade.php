<div class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-wrapper">
            @php 
                    $currentPageImage = sectionImages($currentPage, true) 
            @endphp
            @if ($currentPageImage)
                <div class="overlay">
                    <img src="{{ sectionImages($currentPage, true) }}" alt="">
                </div>
            @endif
            <ul class="breadcrumbs__list">
                @php
                    $locale = app()->getLocale();
                    $menuPath = '';
                    $breadcrumbs = $breadcrumbs->unique(fn($item) => sectionValue($item, 'title'))->values();
                    $lastIndex = $breadcrumbs->count() - 1; // index of last item
                @endphp

                @foreach($breadcrumbs as $index => $menu)
                    @if($index !== $lastIndex) {{-- Skip last breadcrumb --}}
                    @php
                        if ($menu->getTable() === 'menu_mains') {
                            $menuPath = $menu->slug;
                            $link = match ($menu->type) {
                                'page' => url($locale . '/' . $menu->slug),
                                'category', 'section' => '#',
                                default => '#',
                            };
                        } elseif ($menu->getTable() === 'page_sections') {
                            $link = url($locale . '/' . $menuPath . '/' . $menu->slug);
                            $menuPath .= '/' . $menu->slug;
                        } else {
                            $link = '#';
                        }
                    @endphp

                    <li class="breadcrumbs__list--item">
                        <a href="{{ $link }}" class="breadcrumbs__link">
                            {{ sectionValue($menu, 'title') }}
                        </a>
                    </li>

                    @if($index !== $lastIndex - 1)
                        <li class="breadcrumbs__list--item">
                            <i class="i-dropdown"></i>
                        </li>
                    @endif
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