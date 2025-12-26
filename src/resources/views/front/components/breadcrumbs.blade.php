
<div class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-wrapper">
            <ul class="breadcrumbs__list">
                @foreach($breadcrumbs as $menu)
                    @php
                        $locale = app()->getLocale();
                        $link = match($menu->type) {
                            'page' => url($locale.'/'.$menu->slug),
                            'category', 'section' => '#',
                            default => '#',
                        };
                    @endphp
                    
                    <li class="breadcrumbs__list--item">
                        <a href="{{ $link }}" class="breadcrumbs__link">
                            {{ $menu->title }}
                        </a>
                    </li>
                    
                    @if(!$loop->last)
                        <li class="breadcrumbs__list--item">
                            <i class="i-dropdown"></i>
                        </li>
                    @endif
                @endforeach
            </ul>
            @if(count($breadcrumbs) > 0)
                <h1 class="breadcrumbs__title">
                    {{ $breadcrumbs[count($breadcrumbs) - 1]->title }}
                </h1>
            @endif
        </div>
    </div>
</div>