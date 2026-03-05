    <script>
            document.addEventListener("DOMContentLoaded", () => {
                const pressLeft = document.querySelector(".press__left");
                const mainImg = document.querySelector(".press__left--img img");
                const patternImg = document.querySelector(".press__left > img");

                if (!pressLeft || !mainImg || !patternImg) return;

                // Set 3D perspective on parent
                gsap.set(pressLeft, {
                    perspective: 1000,
                    transformStyle: "preserve-3d"
                });

                gsap.set([mainImg, patternImg], {
                    transformStyle: "preserve-3d",
                    transformOrigin: "center center"
                });

                // Create smooth quickTo animations for main image
                const mainRX = gsap.quickTo(mainImg, "rotationX", { duration: 0.6, ease: "power2.out" });
                const mainRY = gsap.quickTo(mainImg, "rotationY", { duration: 0.6, ease: "power2.out" });
                const mainZ = gsap.quickTo(mainImg, "z", { duration: 0.6, ease: "power2.out" });
                const mainScale = gsap.quickTo(mainImg, "scale", { duration: 0.4, ease: "power2.out" });

                // Create smooth quickTo animations for pattern image (with different intensity)
                const patternRX = gsap.quickTo(patternImg, "rotationX", { duration: 0.8, ease: "power2.out" });
                const patternRY = gsap.quickTo(patternImg, "rotationY", { duration: 0.8, ease: "power2.out" });
                const patternZ = gsap.quickTo(patternImg, "z", { duration: 0.8, ease: "power2.out" });
                const patternX = gsap.quickTo(patternImg, "x", { duration: 0.8, ease: "power2.out" });
                const patternY = gsap.quickTo(patternImg, "y", { duration: 0.8, ease: "power2.out" });

                pressLeft.addEventListener("pointermove", (e) => {
                    const rect = pressLeft.getBoundingClientRect();
                    const x = (e.clientX - rect.left) / rect.width;
                    const y = (e.clientY - rect.top) / rect.height;

                    // Center-based coordinates (-0.5 to 0.5)
                    const centerX = x - 0.5;
                    const centerY = y - 0.5;

                    // Main image - stronger 3D effect
                    mainRY(centerX * 20);
                    mainRX(-centerY * 20);
                    mainZ(30);
                    mainScale(1.05);

                    // Pattern image - subtle parallax effect (moves in opposite direction)
                    patternRY(centerX * 5);
                    patternRX(-centerY * 5);
                    patternZ(-20);
                    patternX(centerX * 40);
                    patternY(centerY * 40);
                });

                pressLeft.addEventListener("pointerleave", () => {
                    // Reset main image
                    mainRX(0);
                    mainRY(0);
                    mainZ(0);
                    mainScale(1);

                    // Reset pattern image
                    patternRX(0);
                    patternRY(0);
                    patternZ(0);
                    patternX(0);
                    patternY(0);
                });
            });

        </script>

        <section class="press">
            <div class="container">
                <div class="section-top">
                    <p>{{staticValue('newspapers')}}</p>
                    @php
                    $newsp = menuSection(46);
                    $newspapers = menuSections(46,3,false)
                    @endphp
                    <a href="{{route('home',['locale' => app()->getLocale(),'any' => $newsp->slug])}}">{{staticValue('all')}}</a>
                </div>
                <div class="press__wrapper">
                    <div class="press__left">
                        <div class="press__left--img">
                            <img src="{{ asset('front') }}/images/press-main.jpg" width="330" alt="">
                        </div>
                        
                        <img src="{{ asset('front') }}/images/press-pattern.svg" alt="">
                    </div>
                    <div class="press__right">
                        @foreach ($newspapers as $newspaper)
                        <a href="{{route('home',['locale' =>  app()->getLocale(),'any' => $newsp->slug,'inside' => $newspaper->slug])}}" class="press__right--item">
                            <p>{{sectionValue($newspaper,'title')}}</p>
                            <span>Batafsil <i class="i-link"></i></span>
                        </a>
                        @endforeach
                        
                    </div>
                </div>
        </section>