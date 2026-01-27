<?php $__env->startSection('body'); ?>
<?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
<div class="layout">
    <div class="container">
        <div class="layout-content">
            <div class="content">
                <div class="content__title"><?php echo e(sectionValue($items[0], 'title')); ?></div>
                <div class="content__text">
                    <?php echo e(sectionValue($items[0], 'description')); ?>

                </div>
                <div class="locations">
                    <div class="select-wrapper">
                        <select name="regions" id="regions">
                            <option value="" selected disabled>Barcha viloyatlar</option>
                            <?php
                            $locations = menuSections(33,null,true,true);

                            ?>
                            <?php $__currentLoopData = $locations; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $region): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e(sectionValue($region, 'code')); ?>" data-link="<?php echo e($region->slug); ?>">
                                <?php echo e(sectionValue($region, 'title')); ?>

                            </option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                        <script>
                            const select = document.getElementById('regions');
                            select.selectedIndex = 0;

                            select.addEventListener('change', function () {
                                const link = this.options[this.selectedIndex].getAttribute('data-link');
                                if (link) window.location.href = window.location.pathname.replace(/\/$/, '') + '/' + link;
                            });
                        </script>
                    </div>
                    <svg class="map" xmlns="http://www.w3.org/2000/svg" id="map" width="729" height="475" fill="none"
                        viewBox="0 0 729 475">
                        <?php $__currentLoopData = $locations; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $region): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <g id="<?php echo e(sectionValue($region, 'code')); ?>" class="available"
                            data-id="<?php echo e(sectionValue($region, 'id')); ?>" data-slug="<?php echo e($region->slug); ?>"
                            data-name="<?php echo e(sectionValue($region, 'title')); ?>"
                            data-offset="<?php echo e(sectionValue($region, 'offset')); ?>">
                            <path stroke="#BFC3D7" stroke-width=".8" d="<?php echo e(sectionValue($region, 'path')); ?>" />
                        </g>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>


                    </svg>
                    <template id="pinpoint">
                        <div class="map-marker"></div>
                    </template>

                    <style>
                        .map-point {
                            pointer-events: none !important;
                        }
                    </style>
                    <script>
                        const svgGroups = document.querySelectorAll('#map g.available');
                        const mapSvg = document.querySelector('#map');
                        const BASE_URL = "<?php echo e(route('home', ['locale' => app()->getLocale(), 'any' => request()->route('any')])); ?>";
                        function addMapPoint(group) {
                            const path = group.querySelector('path');
                            const centroid = findVisualCenter(path);
                            const regionName = group.getAttribute('data-name') || group.getAttribute('title') || group.id;
                            const offset = group.getAttribute('data-offset') || '0,0';
                            const [offsetX, offsetY] = offset.split(',').map(v => parseFloat(v.trim()) || 0);
                            const dataId = group.getAttribute('data-id');

                            const div = document.createElement('div');
                            div.classList.add('pinpoint');
                            div.textContent = regionName;
                            div.style.position = 'absolute';

                            const tempDiv = document.createElement('div');
                            tempDiv.style.visibility = 'hidden';
                            tempDiv.style.position = 'absolute';
                            tempDiv.className = div.className;
                            tempDiv.textContent = div.textContent;
                            document.body.appendChild(tempDiv);
                            const width = tempDiv.offsetWidth;
                            const height = tempDiv.offsetHeight;
                            document.body.removeChild(tempDiv);

                            const foreignObject = document.createElementNS('http://www.w3.org/2000/svg', 'foreignObject');
                            foreignObject.classList.add('map-point');
                            foreignObject.setAttribute('data-region', group.id);
                            foreignObject.setAttribute('data-id', dataId);
                            foreignObject.setAttribute('x', centroid.x - (width / 2) + offsetX);
                            foreignObject.setAttribute('y', centroid.y - (height / 2) + offsetY);
                            foreignObject.setAttribute('width', width);
                            foreignObject.setAttribute('height', height);
                            foreignObject.style.cursor = 'pointer';

                            foreignObject.addEventListener('click', (e) => {
                                e.stopPropagation();
                                const slug = group.dataset.slug;
                                if (dataId) {
                                    const currentPath = window.location.pathname;
                                    // window.location.href = `${currentPath}/${dataId}`;
                                    window.location.href = `${BASE_URL}/${slug}`;
                                }
                            });

                            foreignObject.appendChild(div);
                            mapSvg.appendChild(foreignObject);
                        }

                        function addAllMapPoints() {
                            document.querySelectorAll('.map-point').forEach(el => el.remove());
                            svgGroups.forEach(group => {
                                addMapPoint(group);
                            });
                        }

                        function findVisualCenter(path) {
                            const bbox = path.getBBox();
                            const gridSize = 10;
                            const stepX = bbox.width / gridSize;
                            const stepY = bbox.height / gridSize;

                            let totalX = 0;
                            let totalY = 0;
                            let pointCount = 0;
                            for (let i = 0; i <= gridSize; i++) {
                                for (let j = 0; j <= gridSize; j++) {
                                    const testX = bbox.x + (i * stepX);
                                    const testY = bbox.y + (j * stepY);

                                    const point = mapSvg.createSVGPoint();
                                    point.x = testX;
                                    point.y = testY;

                                    if (path.isPointInFill(point)) {
                                        totalX += testX;
                                        totalY += testY;
                                        pointCount++;
                                    }
                                }
                            }

                            if (pointCount === 0) {
                                return {
                                    x: bbox.x + (bbox.width / 2),
                                    y: bbox.y + (bbox.height / 2)
                                };
                            }

                            return {
                                x: totalX / pointCount,
                                y: totalY / pointCount
                            };
                        }


                        svgGroups.forEach(g => {
                            g.addEventListener('click', (e) => {
                                e.preventDefault();
                                const slug = g.dataset.slug;
                                if (slug) {
                                    window.location.href = `${BASE_URL}/${slug}`;
                                } else {
                                    console.warn('Region data-id or slug not found.');
                                }
                            });
                            g.addEventListener('mouseleave', () => {
                                g.style.opacity = '';
                            });
                        });


                        if (svgGroups.length) {
                            addAllMapPoints();
                        }
                    </script>
                </div>
            </div>
        </div>
        <?php echo $__env->make('front.components.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/pages/location/index.blade.php ENDPATH**/ ?>