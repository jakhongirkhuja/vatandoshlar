@extends('front.layouts.layout')

@section('body')
  <div class="layout">
        <div class="container">
<div class="search-page">
    <div class="search-header">
        <div class="container">
           

            {{-- Title --}}
            <h1 class="search-title">Qidiruv</h1>
        </div>
    </div>

    {{-- Search Form Section --}}
    <div class="search-content">
        <div class="container">
            <div class="search-box">
                <form action="{{ route('search', ['locale'=> app()->getLocale()]) }}" method="GET" class="search-form">
                    <div class="input-group">
                        <span class="search-icon">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                                <path d="M21 21L15 15M17 10C17 13.866 13.866 17 10 17C6.13401 17 3 13.866 3 10C3 6.13401 6.13401 3 10 3C13.866 3 17 6.13401 17 10Z" 
                                      stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                            </svg>
                        </span>
                        <input 
                            type="text" 
                            name="search" 
                            class="search-input" 
                            placeholder="Qidiruv so'zingizni kiriting"
                            value="{{ $search ?? '' }}"
                            required
                        >
                        <button type="submit" class="search-btn">IZLASH</button>
                    </div>
                </form>
              
                {{-- Results Count --}}
                @if(isset($results))
                <div class="results-info">
                    <p>
                        «<strong>{{ $search }}</strong>» qidiruv bo'yicha, 
                        <strong>{{ $count }}</strong> ta natija topildi:
                    </p>
                </div>
                @endif
            </div>
            @if(isset($results) && $results->count() > 0)
            <div class="results-list">
                @foreach($results as $result)
                        @php
                            foreach($menus as $menu){
                                if($result->menu_main_id ==$menu->id){
                                        $slug = $menu->slug;
                                        break;
                                }
                            }
                            
                        @endphp
                        <a href="{{route('home',['locale'=>app()->getLocale(),'any' => $slug,'inside' => $result->slug])}}">
                            <div class="result-item">
                                <h3 class="result-title">
                                    {{ sectionValue($result,'title')}}
                                </h3>
                            </div>
                        </a>
                @endforeach
            </div>
            @elseif(isset($results) && $results->count() == 0)
            <div class="no-results">
                <p>Hech qanday natija topilmadi</p>
            </div>
            @endif
        </div>
    </div>
</div>
</div>
</div>
@endsection