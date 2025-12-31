    @if ($heroSection)
    <section class="hero">
        <div class="hero__bg">
           
            @if($heroVideo)
            
                 <video class="hero__video" width="100%" height="100%" muted loop autoplay src="{{$heroVideo}}"
                type="video/mp4"></video>
            @endif
        </div>

        <div class="hero__content container">
            <h1 class="hero__title">
                {{ sectionValue($heroSection, 'title') }}
            </h1>
    
            <button class="hero__btn">
                <i class="i-arrow"></i>
                <span>Batafsil</span>
            </button>
        </div>
    </section>
 @endif