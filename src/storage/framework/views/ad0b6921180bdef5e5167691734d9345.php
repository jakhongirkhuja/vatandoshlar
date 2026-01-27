<?php if(session('success')): ?>
    
    <div class="modal customModal fade" id="supportResponseModal" data-bs-backdrop="static" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class=" img">
                    <i class="i-success"></i>
                    <!-- <i class="i-warning"></i> -->
                </div>
                <h4 class="title">
                    <?php echo e(staticValue('thanks')); ?>

                    <!-- <?php echo e(staticValue('somethingWentWrong')); ?> -->
                </h4>
                <h4 class="text">
                    <?php echo e(staticValue('ApplicationSent')); ?>

                    <!-- <?php echo e(staticValue('ApplicationNotSent')); ?> -->
                </h4>
                <!-- <p>
                                                                <?php echo e(session('success')); ?>

                                                            </p> -->
                <button class="close" data-bs-dismiss="modal"> <?php echo e(staticValue('close')); ?></button>
            </div>
        </div>
    </div>
<?php elseif(session('error')): ?>
    <div class="modal customModal fade" id="supportResponseModal" data-bs-backdrop="static" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class=" img">
                    <!-- <i class="i-success"></i> -->
                    <i class="i-warning"></i>
                </div>
                <h4 class="title">
                    <!-- <?php echo e(staticValue('thanks')); ?> -->
                    <?php echo e(staticValue('somethingWentWrong')); ?>

                </h4>
                <h4 class="text">
                    <!-- <?php echo e(staticValue('ApplicationSent')); ?>}-->
                    <?php echo e(staticValue('ApplicationNotSent')); ?>

                </h4>
                <!-- <p>
                                                                <?php echo e(session('success')); ?>

                                                            </p> -->
                <button class="close" data-bs-dismiss="modal"> <?php echo e(staticValue('close')); ?></button>
            </div>
        </div>
    </div>
    <?php endif; ?>
    
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var myModal = new bootstrap.Modal(document.getElementById('supportResponseModal'));
            myModal.show();
        });
    </script>
<?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/components/modal.blade.php ENDPATH**/ ?>