<div class="breadcrumbs mini">
    <div class="container">
        <ul class="breadcrumbs__list">
            {{-- Bosh sahifa linki --}}
            <li class="breadcrumbs__list--item">
                <a href="{{ url(app()->getLocale()) }}" class="breadcrumbs__link fs4">
                    {{ __('Asosiy') }}
                </a>
            </li>

            @foreach($breadcrumbs as $menu)
                {{-- Separator --}}
                <li class="breadcrumbs__list--item">
                    <i class="i-dropdown"></i>
                </li>

                @php
                    $locale = app()->getLocale();
                    $link = match ($menu->type) {
                        'page' => url($locale . '/' . $menu->slug),
                        'category', 'section' => 'javascript:void(0)',
                        default => 'javascript:void(0)',
                    };
                @endphp

                <li class="breadcrumbs__list--item">
                    <a href="{{ $link }}" class="breadcrumbs__link fs4 {{ $loop->last ? 'active' : '' }}">
                        {{ $menu->title }}
                    </a>
                </li>
            @endforeach
        </ul>

        {{-- Sahifa sarlavhasi --}}
        @if(count($breadcrumbs) > 0)
            <h1 class="breadcrumbs__title">
                {{ $breadcrumbs[count($breadcrumbs) - 1]->title }}
            </h1>
        @endif
    </div>
</div>