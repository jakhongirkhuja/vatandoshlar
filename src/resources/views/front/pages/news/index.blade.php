@extends('front.layouts.layout')

@section('body')
    @include('front.components.breadcrumbs')
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="news__page">
                    <div class="news__page--grid">
                        @foreach ($items as $item)
                        <a class="news__page--grid-item"  href="{{ route('home',['locale'=>app()->getlocale(), 'any'=>request()->route('any'),'inside'=>$item->slug]) }}">
                                <div class="news__page--grid-item-img">
                                    @php
                                        $mainImage = sectionImages($item, true);
                                    @endphp
                                    @if($mainImage)
                                        <img src="{{ $mainImage }}" alt="{{ sectionValue($item, 'title') }}">
                                    @endif
                                </div>
                                <div class="news__page--grid-item-text">
                                    <p class="line-clamp-3">{{ sectionValue($item, 'title') }}</p>
                                    <div class="news__page--grid-item-links">
                                        <div><i class="i-calendar"></i><span>{{ $item->created_at->toDateString() }}</span></div>
                                        <div><i class="i-eye"></i><span>{{ $item->views()->count()}}</span></div>
                                    </div>
                            </div>
                        </a>
                        @endforeach
                    </div>   
                    <div class="pagination">
{{-- Orqaga (Previous) tugmasi --}}
@if ($items->onFirstPage())
    <li><span><i class="i-prev"></i></span></li>
@else
    <li><a href="{{ $items->previousPageUrl() }}"><i class="i-prev"></i></a></li>
@endif

{{-- Sahifalar raqami --}}
@foreach ($items->getUrlRange(1, $items->lastPage()) as $page => $url)
    <li>
        <a href="{{ $url }}" 
           class="pagination-item {{ $page == $items->currentPage() ? 'active' : '' }}"
           data-ci-pagination-page="{{ $page }}">
            {{ $page }}
        </a>
    </li>
@endforeach

{{-- Oldinga (Next) tugmasi --}}
@if ($items->hasMorePages())
    <li><a href="{{ $items->nextPageUrl() }}"><i class="i-next"></i></a></li>
@else
    <li><span><i class="i-next"></i></span></li>
@endif
</div>
                </div>
            </div>
            @include('front.components.sidebar')
        </div>
    </div>
@endsection