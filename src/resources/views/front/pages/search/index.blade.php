@extends('front.layouts.layout')

@section('body')
<div class="layout">
    <div class="container">
        <div class="search">
            {{-- Search Form Section --}}
            <div class="search__wrapper">
                <div class="search__sidebar">
                    <form action="{{ route('search', ['locale' => app()->getLocale(),'search' => request()->route()]) }}" method="POST"
                        class="search__form">
            @csrf

                        <div class="search-wrapper">
                            <input type="text" name="search" class="search-input"
                                placeholder="{{staticValue('search')}}" value="{{ $search ?? '' }}" required>
                        </div>
                        <button type="submit" class="search__button button"> <i class="i-search"></i>
                        </button>

                    </form>

                    {{-- Results Count --}}
                    @if(isset($results))
                    <div class="results-info">
                        <p>
                            <strong>{{ $count }}</strong> {{staticValue('search-found')}}
                        </p>
                    </div>
                    @endif
                </div>
                @if(isset($results) && $results->count() > 0)
                <div class="search__results">
                    @foreach($results as $result)
                        @php

                            $menu = $menus->firstWhere('id', $result->menu_main_id);

                            $existingViews = [];
                            $urlSegments = [];

                            $parentSlug = null;
                            $childSlug = null;

                            // traverse menu hierarchy
                            while ($menu) {
                                $slug = $menu->slug;
                                array_unshift($urlSegments, $slug);
                                $basePath = 'front.pages.' . $slug;

                                $candidates = [
                                    'root'           => $basePath . '.index',
                                    'inside_detail' => $basePath . '.inside.detail.index',
                                    'inside'         => $basePath . '.inside.index',



                                ];
                                $d = null;
                                foreach ($candidates as $type => $view) {
                                      $d['locale'] =app()->getLocale();
                                    if (\View::exists($view)) {
                                        $existingViews[$type] = $view;

                                        // assign parent/child slug for route params

                                        if ($type === 'root') {
                                            $parentSlug = $slug;
                                            $d['any'] =$slug;

                                        }
                                        if ($type === 'inside') {
                                            if(isset($d['detail'])){
                                                $in = $result->parent?->slug;
                                                if($in){
                                                    $d['inside'] = $in;
                                                }


                                            }else{

                                                 $d['inside'] = $result->slug;
                                            }

                                            $childSlug = $slug;
                                        }
                                        if ($type === 'inside_detail') {
                                            $childSlug = $slug;
                                             $d['detail'] = $result->slug;
                                        }
                                    }
                                }

                                $menu = $menu->parent_id
                                    ? $menus->firstWhere('id', $menu->parent_id)
                                    : null;
                            }



                            $parentSlug = $parentSlug ?? ($urlSegments[0] ?? 'default');
                            $childSlug  = $childSlug ?? ($urlSegments[1] ?? null);

                            $routes = $d;
                             $url = '/' . implode('/', $routes);

                        @endphp
                    @php
//                    $menu = $menus->firstWhere('id', $result->menu_main_id);
//
//                    if ($menu && $menu->parent) {
//                    $childSlug = $menu->slug;
//                    } else {
//                    $childSlug = null;
//                    }
                    @endphp

                    @if($childSlug)
{{--                    <a href="{{ route('home', [--}}
{{--                                        'locale' => app()->getLocale(),--}}
{{--                                        'inside' => $childSlug,--}}
{{--                                        'detail' => $result->slug--}}
{{--                                    ]) }}" class="search__resuts--item">--}}
                        @else
{{--                        <a href="{{ route('home', [--}}
{{--                                            'locale' => app()->getLocale(),--}}
{{--                                            'inside' => $result->slug--}}
{{--                                        ]) }}">--}}
                            @endif
                        <a href="{{$url }}" >
                            @if(sectionValue($result, 'title'))
                            <p class="search__results--title">
                                {{ sectionValue($result, 'title') }}
                            </p>
                            @endif
                            @if(sectionValue($result, 'description'))
                            <div class="search__results--desc line-clamp-3 no-tooltip">
                                {!! sectionValue($result, 'description') !!}
                            </div>
                            @endif

                        </a>

                        @if(!$loop->last)
                        <hr class="result-separator">
                        @endif

                        @endforeach

                </div>
                @elseif(isset($results) && $results->count() == 0)
                <div class="no-results">
                    <p>{{staticValue('search-not-found')}}</p>
                </div>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection