@extends('front.layouts.layout')

@section('body')
    <div class="layout">
        <div class="container">
            <div class="search-page w-100" style="margin-top: 8rem;">

                <div class="search-header">

                </div>
                <div class="search-content">

                    <div class="search-box">
                        <form action="{{ route('search', ['locale' => app()->getLocale()]) }}" method="GET"
                              class="search-form">
                            <div class="input-group w-100">
                                <div class="row w-100">
                                    <div class="col-md-10">
                                        <input type="text" name="search" class="form-control"
                                               placeholder="Qidiruv so'zingizni kiriting" value="{{ $search ?? '' }}"
                                               required>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="submit"
                                                class="btn btn-secondary">{{staticValue('search')}}</button>
                                    </div>
                                </div>


                            </div>
                        </form>

                    </div>
                    @if($results->count() > 0)
                        <div class="results-list mt-3">
                            @foreach($results as $result)

                                @php
                                    $menu = $menus->firstWhere('id', $result->menu_main_id);
//                                    $check = [];
////                                    dd($result,$menu);
//                                    if($result->parent_id && $menu->parent_id){
//                                        $d['any']= $menu->parent?->slug;
//                                    }else{
//                                        $d['any'] = $menu->slug;
//                                    }
//
//
//                                    if($result->parent_id){
//                                        $d['inside'] = $result->parent?->slug;
//                                    }else{
//                                        $d['detail'] = $result->slug;
//                                    }
//                                    dd($d,$results);
                                    if ($menu && $menu->parent) {
                                        $parentSlug = $menu->parent->slug;
                                        $childSlug = $menu->slug;
                                    } else {
                                        $parentSlug = $menu?->slug;
                                        $childSlug = null;
                                    }

                                    if($childSlug){
                                         $routes = [
                                                'locale' => app()->getLocale(),
                                                 'any' => $parentSlug,
                                                 'inside' => $childSlug,
                                                  'detail' => $result->slug
                                                ];
                                    }else{
                                        $routes = [
                                                'locale' => app()->getLocale(),
                                                 'any' => $parentSlug,

                                                  'detail' => $result->slug
                                                ];
                                    }


                                @endphp



                                <a href="{{ route('home', $routes) }}" class="p-2 " >
                                    <div class="result-item ">
                                        <h5 class="result-title">
                                            {{ sectionValue($result, 'title') }}
                                        </h5>
                                    </div>
                                </a>
                            @endforeach
                        </div>
                        <div class="results-info mt-3">
                            <p>
                                «<strong>{{ $search }}</strong>» qidiruv bo'yicha,
                                <strong>{{ $count }}</strong> ta natija topildi:
                            </p>
                        </div>
                    @else
                        <div class="no-results">
                            <p>Hech qanday natija topilmadi</p>
                        </div>
                    @endif


                </div>
            </div>
        </div>
    </div>
@endsection
