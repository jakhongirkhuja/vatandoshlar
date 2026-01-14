<?php $__env->startSection('body'); ?>

    <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <div class="layout">
        <div class="container">
            <div class="layout-content">
                <div class="content">
                    <div class="content__text">
                        <?php echo sectionValue($items[0], 'title'); ?>

                    </div>
                    <div class="tab-navigation international-partnership__navigation">
                        <button data-tab-system="1" class="tab-button active">
                            Xarita ko'rinishida
                        </button>
                        <button data-tab-system="1" class="tab-button">
                            Grid ko'rinishida
                        </button>
                    </div>
                    <div class="tab-panels international-partnership__panels">
                        <div data-tab-system="1" class="tab-panel">
                            <div id="vmap"></div>
                        </div>
                        <div data-tab-system="1" class="tab-panel">
                            <div class="associations__grid">
                                <?php
                                    $items = menuSections(23, null, true, true);
                                ?>
                                <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $country): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <a href="<?php echo e(route('home', ['locale' => app()->getlocale(), 'any' => request()->route('any'), 'inside' => $country->slug])); ?>"
                                       class="associations__grid--item">
                                        <div class="associations__grid--item-img">
                                            <?php
                                                $mainImage = sectionImages($country, true);
                                            ?>
                                            <?php if($mainImage): ?>
                                                <img src="<?php echo e($mainImage); ?>" alt="<?php echo e(sectionValue($country, 'title')); ?>">
                                            <?php endif; ?>
                                        </div>
                                        <p><?php echo e(sectionValue($country, 'title')); ?></p>
                                    </a>

                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
        </div>
    </div>
    <link href="<?php echo e(asset('front/location2/jqvmap.css')); ?>" rel="stylesheet"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<?php echo e(asset('front/location2/jquery.vmap.min.js')); ?>"></script>
    <script src="<?php echo e(asset('front/location2/jquery.vmap.world.js')); ?>"></script>
    <script src="<?php echo e(asset('front/location2/jquery.vmap.sampledata.js')); ?>"></script>
    <script src="<?php echo e(asset('front/location2/locales.json')); ?>"></script>

    <script>
        $(document).ready(function () {

            var currentLang = "<?php echo e(app()->getLocale()); ?>";

            var jsonPath = "<?php echo e(asset('front/location2/locales.json')); ?>";
            var selectedCountries = [
                <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $country): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    "<?php echo e(sectionValue($country, 'code')); ?>"<?php if(!$loop->last): ?>,<?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            ];
            window.countryRoutes = {
                <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $country): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                "<?php echo e(sectionValue($country, 'code')); ?>": "<?php echo e(route('home', [
                'locale' => app()->getLocale(),
                'any' => request()->route('any'),
                'inside' => $country->slug
            ])); ?>",
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            };


            var mapLabels;
            $.getJSON(jsonPath, function(data) {
                mapLabels = data[currentLang];
            }).fail(function() {
                console.error("Could not load locales.json. Check the file path.");
            });




            makeMap();
            function makeMap(details, colors) {
                $('#vmap').vectorMap({
                    map: 'world_en',
                    backgroundColor: '',
                    labels: mapLabels,
                    borderColor: '#0A1F44',
                    color: '#D5EBFF',
                    selectedColor: '#1d3a6bff',
                    hoverColor: '#233a63ff',
                    enableZoom: true,
                    showTooltip: true,
                    selectedRegions: selectedCountries,
                    // scaleColors: ['#e2ebfb', '#cfdcf7'],
                    // values: sample_data,
                    normalizeFunction: 'polynomial',

                    onLabelShow: function(event, label, code) {

                        if(mapLabels[code.toUpperCase()]) {
                            label.text(mapLabels[code.toUpperCase()]);

                        }
                    },
                    onRegionClick: function (element, code, region) {
                        code = code.toUpperCase();
                        if (window.countryRoutes[code]) {
                            window.location.href = window.countryRoutes[code];
                        } else {
                            // No country page → block click
                            event.preventDefault();
                            return false;
                        }
                    },
                });
            }

            var $tooltip = $('.jqvmap-label');
            $('#vmap').on('mousemove', function (e) {
                $tooltip.css({
                    left: e.clientX + 15 + 'px',
                    top: e.clientY + 15 + 'px'
                });
            });

        });
    </script>
    <style>
        #vmap {
            position: relative;
            width: 90%;
            height: auto;
            display: flex;
            margin: 95px auto;
            min-height: 500px;
        }

        #vmap svg {
            width: 100%;
            height: 100%;
        }

        @media (max-width: 768px) {
            #vmap {
                /* min-height: 400px;  */
                width: 100%;
                margin: 50px 0;
            }

            #vmap svg {
                padding-top: 50px;
            }
        }

        @media (max-width: 575px) {
            #vmap {
                min-height: 300px;
                margin: 30px 0;
            }
        }

        .map_block {
            position: relative;
        }

        .jqvmap-label {
            position: fixed !important;
            z-index: 9999;
        }
    </style>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/associations/index.blade.php ENDPATH**/ ?>