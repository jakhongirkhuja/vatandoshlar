<?php $__env->startSection('body'); ?>
    <div class="layout">
        <div class="container">
            <div class="projects__apply  w-100">

                <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                <div class="projects__apply-wrapper content">

                    <?php echo $__env->make('front.components.error', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

                    <form class="apply-form" action="<?php echo e(route('support.create')); ?>" id="myForm" method="post">
                        <input type="hidden" name="type" value="application">
                        <?php echo csrf_field(); ?>
                        <div class="form-row form-row--name-date">
                            <div class="form-field">
                                <label for="fullname"><?php echo e(staticValue('pleasure')); ?></label>
                                <input type="text" id="fullname" name="data[name]" class="form-control" placeholder="<?php echo e(staticValue('info-add')); ?>"
                                       required>
                            </div>

                            <div class="form-field">
                                <label for="birthdate"><?php echo e(staticValue('birthdate')); ?></label>
                                <input type="date" id="birthdate" name="data[birthdate]" class="form-control" required>
                            </div>
                        </div>
                        <?php
                            $jobs= contentSection('job');

                        ?>
                        <div class="form-field">
                            <label for="specialization"><?php echo e(staticValue('Specialization:')); ?></label>
                            <select name="data[job]" id="specialization" class="form-control" required>
                                <option value=""><?php echo e(staticValue('select_spec')); ?></option>
                                <?php $__currentLoopData = $jobs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $job): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e(sectionValue($job,'title')); ?>">
                                        <?php echo e(sectionValue($job,'title')); ?>

                                    </option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>

                        <div class="form-field">
                            <label for="address"><?php echo e(staticValue('turar-joy')); ?></label>
                            <input type="text" id="address" name="data[address]" class="form-control"
                                   placeholder="<?php echo e(staticValue('the_address')); ?>" required>
                        </div>

                        <div class="form-field">
                            <label for="extra_info"><?php echo e(staticValue('add-info')); ?></label>
                            <input type="text" id="extra_info" name="data[extra_info]" class="form-control"
                                   placeholder="<?php echo e(staticValue('contact-info')); ?>" required>
                        </div>
                        <div class="form-field">
                            <label for="description"><?php echo e(staticValue('taklif')); ?></label>
                            <input type="text" id="description" name="data[description]" class="form-control" placeholder="<?php echo e(staticValue('info-add')); ?>"
                                   required>
                        </div>
                        <div id="recaptcha-container" style="display: none"></div>
                        <button id="submitBtn"  type="button" class="btn btn-primary" ><?php echo e(staticValue('request')); ?></button>
                    </form>
                </div>
            </div>
        </div>
        <?php if(session('success')): ?>
            
            <div class="modal fade" id="supportResponseModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title"><?php echo e(staticValue('info')); ?></h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center py-4">
                            <h4 class="text-primary mb-2"><?php echo e(staticValue('thanks')); ?></h4>
                            <p class="mb-0"><?php echo e(session('success')); ?></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal"><?php echo e(staticValue('close')); ?></button>
                        </div>
                    </div>
                </div>
            </div>

            
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var myModal = new bootstrap.Modal(document.getElementById('supportResponseModal'));
                    myModal.show();
                });
            </script>
        <?php endif; ?>
    </div>
    <script src="<?php echo e(asset('front/')); ?>/assets/js/imask.js"></script>
    <style>
        .breadcrumbs-wrapper{
            width: 100%;
        }
        .projects__apply-wrapper{
            max-width: initial;
        }
    </style>



    <script>

        function datePicker(selector) {
            flatpickr.localize({
                weekdays: {
                    shorthand: ['Yak', 'Du', 'Se', 'Ch', 'Pa', 'Ju', 'Sha'],
                    longhand: ['Yakshanba', 'Dushanba', 'Seshanba', 'Chorshanba', 'Payshanba', 'Juma', 'Shanba']
                },
                months: {
                    shorthand: ['Yan', 'Fev', 'Mar', 'Apr', 'May', 'Iyn', 'Iyl', 'Avg', 'Sen', 'Okt', 'Noy', 'Dek'],
                    longhand: ['Yanvar', 'Fevral', 'Mart', 'Aprel', 'May', 'Iyun', 'Iyul', 'Avgust', 'Sentabr', 'Oktabr', 'Noyabr', 'Dekabr']
                },
                firstDayOfWeek: 1,
                rangeSeparator: ' — ',
                weekAbbreviation: 'Hafta',
                scrollTitle: 'O‘zgartirish uchun aylantiring',
                toggleTitle: 'Ochiq/Yopiq'
            })

            flatpickr(selector, {
                mode: "single",
                dateFormat: "d-m-Y",
                position: "below",
                placeholder: "DD-MM-YYYY",
            })
        }

        // datePicker("#birthdate");

    </script>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('script'); ?>

    asdasdasda
    <?php echo $__env->make('front.components.recaptchaHandler', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/application/index.blade.php ENDPATH**/ ?>