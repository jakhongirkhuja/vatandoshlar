   <script>
            document.addEventListener("DOMContentLoaded", () => {
                const contactLeft = document.querySelector(".contacts__left");
                const contactMainImg = document.querySelector(".contacts__left--img img");
                const contactImg = document.querySelector(".contacts__left img");

                if (!contactLeft || !contactMainImg || !contactImg) return;

                // Set 3D perspective on parent
                gsap.set(contactLeft, {
                    perspective: 1000,
                    transformStyle: "preserve-3d"
                });

                gsap.set([contactMainImg, contactImg], {
                    transformStyle: "preserve-3d",
                    transformOrigin: "center center"
                });

                // Create smooth quickTo animations forcontactMain image
                const contactMainRX = gsap.quickTo(contactMainImg, "rotationX", { duration: 0.6, ease: "power2.out" });
                const contactMainRY = gsap.quickTo(contactMainImg, "rotationY", { duration: 0.6, ease: "power2.out" });
                const contactMainZ = gsap.quickTo(contactMainImg, "z", { duration: 0.6, ease: "power2.out" });
                const contactMainScale = gsap.quickTo(contactMainImg, "scale", { duration: 0.4, ease: "power2.out" });

                // Create smooth quickTo animations for contact image (with different intensity)
                const contactRX = gsap.quickTo(contactImg, "rotationX", { duration: 0.8, ease: "power2.out" });
                const contactRY = gsap.quickTo(contactImg, "rotationY", { duration: 0.8, ease: "power2.out" });
                const contactZ = gsap.quickTo(contactImg, "z", { duration: 0.8, ease: "power2.out" });
                const contactX = gsap.quickTo(contactImg, "x", { duration: 0.8, ease: "power2.out" });
                const contactY = gsap.quickTo(contactImg, "y", { duration: 0.8, ease: "power2.out" });

                contactLeft.addEventListener("pointermove", (e) => {
                    const rect = contactLeft.getBoundingClientRect();
                    const x = (e.clientX - rect.left) / rect.width;
                    const y = (e.clientY - rect.top) / rect.height;

                    // Center-based coordinates (-0.5 to 0.5)
                    const centerX = x - 0.5;
                    const centerY = y - 0.5;

                    // contactMain image - stronger 3D effect
                    contactMainRY(centerX * 20);
                    contactMainRX(-centerY * 20);
                    contactMainZ(30);
                    contactMainScale(1.05);

                    // contact image - subtle parallax effect (moves in opposite direction)
                    contactRY(centerX * 5);
                    contactRX(-centerY * 5);
                    contactZ(-20);
                    contactX(centerX * 40);
                    contactY(centerY * 40);
                });

                contactLeft.addEventListener("pointerleave", () => {
                    // Reset contactMain image
                    contactMainRX(0);
                    contactMainRY(0);
                    contactMainZ(0);
                    contactMainScale(1);

                    // Reset contact image
                    contactRX(0);
                    contactRY(0);
                    contactZ(0);
                    contactX(0);
                    contactY(0);
                });
            });

        </script>
        <section class="contacts">
            <div class="container">
                <div class="contacts__wrapper">
                    <div class="contacts__right">
                        <h5>Elektron murojaat yuborish platformasi</h5>
                        <p>Biz barcha sizni qiynayotga muammoga yo’l topaolamiz. Bizga murojat qiling</p>
                        <div class="contacts__right--wrapper">
                            <a class="button" href="{{route('support.createApp')}}">Murojaat yuborish</a>
                            <a class="link" href="#"><i class="i-play"></i><span>Video qo’llanma</span></a>
                        </div>
                    </div>
                    <div class="contacts__left">
                        <div class="contacts__left--img">
                            <img src="{{ asset('front') }}/images/contact-main.png" width="520" alt="">
                        </div>
                        <img src="{{ asset('front') }}/images/contacts-pattern.svg" alt="">
                    </div>
                </div>
        </section>