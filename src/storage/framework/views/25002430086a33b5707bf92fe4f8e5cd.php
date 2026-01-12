<section class="projects">
    <div class="container">
        <div class="section-top">
            <p><?php echo e(staticValue('projects')); ?></p>
                    <?php
                    $projectItself = menuSection(38);
                     $projects = menuSections(38,6,true,true);
                    ?>
            <a href="<?php echo e(route('home',[
                            'locale' => app()->getLocale(),
                            'any' => $projectItself->slug])); ?>"><?php echo e(staticValue('all')); ?></a>
        </div>

        <div class="projects__grid">
                 <?php $__currentLoopData = $projects; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $project): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                 
                 <a href="<?php echo e(route('home', [
                                 'locale' => app()->getLocale(),
                                 'any' => $projectItself->slug,
                                 'inside' => $project->slug
                             ])); ?>" class="projects__grid--item">
                     <div class="projects__grid--item-img">
                         <?php
                         $src = sectionImages($project,true);
                         ?>
                         <img src="<?php echo e($src); ?>" alt="">
                     </div>
                     <h3 class="projects__grid--item-title"><?php echo e(sectionValue($project, 'title')); ?>

                     </h3>
                 </a>
                 <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/gsap@3.14.1/dist/gsap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/gsap@3.14.1/dist/ScrollTrigger.min.js"></script>
<?php /**PATH /var/www/html/resources/views/front/home/projects.blade.php ENDPATH**/ ?>