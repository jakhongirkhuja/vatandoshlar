<?php
     $volunteers = menuSections(45, 9, false, true); // hammasini oling
    $vol1 = $volunteers->get(0);
    $vol2 = $volunteers->get(1);
    $vol3 = $volunteers->get(2);
    $vol4 = $volunteers->get(3);
    $vol5 = $volunteers->get(4);
    $vol6 = $volunteers->get(5);
    $vol7 = $volunteers->get(6);
    $vol8 = $volunteers->get(7);
    $vol9 = $volunteers->get(8);
?>

<section class="volunteers">
    <div class="container">
        <div class="section-top">
            <p><?php echo e(staticValue('volunteers')); ?></p>
            <a href="#"><?php echo e(staticValue('all')); ?></a>
        </div>

        <div class="volunteers__wrapper">   
            <div class="volunteers__left">
                <div class="volunteers__left-left">
                    <div class="item">
                        <img src="<?php echo e(sectionImages($vol1, true)); ?>" alt="">
                    </div>
                    <div class="volunteers__left-left-bottom">
                        <div class="item">
                            <img src="<?php echo e(sectionImages($vol2, true)); ?>" alt="">
                        </div>
                        <div class="item">
                            <img src="<?php echo e(sectionImages($vol3, true)); ?>" alt="">
                        </div>
                    </div>
                </div>

                <div class="item">
                    <img src="<?php echo e(sectionImages($vol4, true)); ?>" alt="">
                </div>
            </div>

            <div class="volunteers__right">
                <div class="volunteers__right-left">
                    <div class="item">
                        <img src="<?php echo e(sectionImages($vol5, true)); ?>" alt="">
                    </div>
                    <div class="item">
                        <img src="<?php echo e(sectionImages($vol6, true)); ?>" alt="">
                    </div>
                </div>

                <div class="volunteers__right-right">
                    <div class="volunteers__right-right-top">
                        <div class="item">
                            <img src="<?php echo e(sectionImages($vol7, true)); ?>" alt="">
                        </div>
                        <div class="item">
                            <img src="<?php echo e(sectionImages($vol8, true)); ?>" alt="">
                        </div>
                    </div>

                    <div class="item">
                        <img src="<?php echo e(sectionImages($vol9, true)); ?>" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<?php /**PATH /var/www/html/resources/views/front/home/volunteers.blade.php ENDPATH**/ ?>