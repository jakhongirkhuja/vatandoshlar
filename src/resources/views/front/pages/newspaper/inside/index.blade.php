@extends('front.layouts.layout')

@section('body')
    <div class="" style="height: calc(var(--height-header) + 16px);"></div>
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="press-view content">
                    @foreach ($items as $item)
                        <strong class="content-title">
                            {{ sectionValue($item, 'title') }}
                        </strong>
                        @if (sectionValue($item, 'description'))
                            <p>
                                {{ sectionValue($item, 'description') }}
                            </p>
                        @endif

                        @php
                            $file = sectionImages($item, false);
                        @endphp
                        @if(!empty($file))
                            <iframe src="{{$file[0]}}" height="500" width="100%" frameborder="0"></iframe>
                        @endif
                    @endforeach
                    <div class="iframe-text mt-3">
                        <style>
                            .custom_style_p {
                                display: flex;
                                align-items: center;
                                color: #98a2b3;
                                font-size: 16px;
                                font-weight: 500;
                                gap: 4px;
                            }
                        </style>

                        <div class="iframe-text--link">
                            <p class="custom_style_p">
                                <i class="i-calendar"></i>
                                {{ date('d.m.Y', strtotime($item->publish_at)) }}

                            </p>
                            <p class="custom_style_p">
                                <i class="i-eye"></i>{{ $item->views()->count() }}
                            </p>

                            <div class="divider"></div>
                            <button class="button" onclick="fullscreen()">
                                <svg width="24" height="24" viewBox="0 0 17 17" xmlns="http://www.w3.org/2000/svg">
                                    <path fill="#fff"
                                        d="M15.996 11.352 16 16l-4.649-.004.001-1 2.94.003L8.5 9.208 2.708 15l2.94-.003.001 1L1 16l.004-4.649 1 .001-.003 2.939L7.793 8.5 2.001 2.708l.003 2.939-1 .001L1 1l4.649.004-.001 1-2.94-.003L8.5 7.793l5.792-5.792-2.94.003-.001-1L16 1l-.004 4.649-1-.001.003-2.939L9.207 8.5l5.792 5.792-.003-2.939z" />
                                </svg>
                                {{ staticValue('fullScreen') }}
                            </button>
                            <script>
                                function fullscreen() {
                                    const iframe = document.querySelector('.press-view iframe');
                                    if (iframe.requestFullscreen) {
                                        iframe.requestFullscreen();
                                    } else if (iframe.mozRequestFullScreen) { /* Firefox */
                                        iframe.mozRequestFullScreen();
                                    } else if (iframe.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
                                        iframe.webkitRequestFullscreen();
                                    } else if (iframe.msRequestFullscreen) { /* IE/Edge */
                                        iframe.msRequestFullscreen();
                                    }
                                }
                            </script>
                        </div>

                        <div class="iframe-text--line"></div>

                        <div class="iframe-text--copy">
                            <label for="share" class="share-link" id="share-label" style="cursor:pointer;">
                                <script>
                                    const patchYandexButton = () => {
                                        const moreBtn = document.querySelector('.ya-share2__badge.ya-share2__badge_more');
                                        const innerLink = document.querySelector('.ya-share2__link.ya-share2__link_more.ya-share2__link_more-button-type_short');

                                        if (!moreBtn || !innerLink) return false;

                                        innerLink.style.padding = '0';
                                        moreBtn.classList.add(".share")
                                        moreBtn.style.cssText = 'background: var(--white);  border: 0; outline: 0;display: flex; align-items: center; gap: 5px;   border-radius: 4px;';
                                        moreBtn.innerHTML = `<span>{{staticValue('share')}}</span><i class="i-link"></i>`;

                                        return true;
                                    };

                                    const startPatch = () => {
                                        if (patchYandexButton()) return;

                                        const observer = new MutationObserver(() => {
                                            if (patchYandexButton()) observer.disconnect();
                                        });

                                        observer.observe(document.body, { childList: true, subtree: true });
                                        setTimeout(() => observer.disconnect(), 10000);
                                    };

                                    const script = document.createElement('script');
                                    script.src = 'https://yastatic.net/share2/share.js';
                                    script.onload = startPatch;
                                    document.head.appendChild(script);
                                </script>


                                <div id="share" class="ya-share2 share-link" data-curtain data-limit="0" data-more-button-type="short" data-services="telegram,twitter,whatsapp,linkedin">
                                </div>


                            </label>
                            <div class="copy-flex">
                                <a href="{{$file[0]}}" target="_blank" download="" class="btn-copy">
                                    <i class="i-download"></i>{{staticValue('downloadNow')}}
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @include('front.components.sidebar')
        </div>
    </div>
@endsection