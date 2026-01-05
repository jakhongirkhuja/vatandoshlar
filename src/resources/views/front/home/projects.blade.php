<section class="projects">
    <div class="container">
        <div class="section-top">
            <p>{{staticValue('projects')}}</p>
                    @php
                    $projectItself = menuSection(38);
                     $projects = menuSections(38,6,true,true);
                    @endphp
            <a href="{{route('home',[
                            'locale' => app()->getLocale(),
                            'any' => $projectItself->slug])}}">{{staticValue('all')}}</a>
        </div>

        <div class="projects__grid">
                 @foreach ($projects as $project )
                 
                 <a href="{{ route('home', [
                                 'locale' => app()->getLocale(),
                                 'any' => $projectItself->slug,
                                 'inside' => $project->slug
                             ]) }}" class="projects__grid--item">
                     <div class="projects__grid--item-img">
                         @php
                         $src = sectionImages($project,true);
                         @endphp
                         <img src="{{$src}}" alt="">
                     </div>
                     <h3 class="projects__grid--item-title">{{  sectionValue($project, 'title') }}
                     </h3>
                 </a>
                 @endforeach
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/gsap@3.14.1/dist/gsap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/gsap@3.14.1/dist/ScrollTrigger.min.js"></script>
