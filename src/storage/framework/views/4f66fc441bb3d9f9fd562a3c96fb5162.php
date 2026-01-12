<section class="president">
    <div class="container">
        <?php
            $presidentSections = menuSections(4, 1);
            $item = $presidentSections->first(); 
        ?>
        <div class="section-top">
            <p> “<?php echo e(sectionValue($item, 'title')); ?>” </p>
        </div>
        <div class="president__wrapper">
            <?php if($item): ?>
                <div class="president__right">
                    <p class="president__right--text">
                        “<?php echo e(sectionValue($item, 'content')); ?>”
                    </p>
                    <p class="president__right--name">
                        — <?php echo e(sectionValue($item, 'description')); ?>

                    </p>
                    <span class="president__right--position">
                        <?php echo e(sectionValue($item, 'content1')); ?>

                    </span>
                </div>
                <div class="president__left">
                    <img src="<?php echo e(sectionImages($item, true)); ?>" width="520" alt="<?php echo e(sectionValue($item, 'title')); ?>">
                </div>
            <?php endif; ?>
        </div>
    </div>
</section><?php /**PATH /var/www/html/resources/views/front/home/president.blade.php ENDPATH**/ ?>