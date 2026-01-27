<?php $__env->startSection('body'); ?>
<div class="layout">
    <div class="container">
        <div class="projects__apply  w-100">

            <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
            <div class="projects__apply-wrapper content">

                <form class="apply-form" action="<?php echo e(route('support.create')); ?>" id="myForm" method="post">
                    <input type="hidden" name="type" value="application">
                    <?php echo csrf_field(); ?>
                    <input type="hidden" name="chat_id" value="<?php echo e(staticValue('telegram_participation_chat_id','description')); ?>">
                    <div class="form-row form-row--name-date">
                        <div class="form-field">
                            <label for="fullname"><?php echo e(staticValue('pleasure')); ?></label>
                            <input type="text" id="fullname" name="data[name]" class="form-control"
                                placeholder="<?php echo e(staticValue('info-add')); ?>" required>
                        </div>

                        <div class="form-field">
                            <label for="birthdate"><?php echo e(staticValue('birthdate')); ?></label>
                            <input type="date" id="birthdate" placeholder="DD-MM-YYYY" name="data[birthdate]"
                                class="form-control" required>
                        </div>
                    </div>
                    <?php
                    $jobs = contentSection('job');
                    ?>
                    <div class="form-field">
                        <label for="specialization"><?php echo e(staticValue('Specialization:')); ?></label>
                        <select name="data[job]" id="specialization" class="form-control" required>
                            <option value=""><?php echo e(staticValue('select_spec')); ?></option>
                            <?php $__currentLoopData = $jobs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $job): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e(sectionValue($job, 'title')); ?>">
                                <?php echo e(sectionValue($job, 'title')); ?>

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
                        <input type="text" id="description" name="data[description]" class="form-control"
                            placeholder="<?php echo e(staticValue('info-add')); ?>" required>
                    </div>
                    <div id="recaptcha-container" style="display: none"></div>
                    <div class="form-actions">
                        <button type="submit" id="submitBtn" class="submit-btn">
                            <img src="<?php echo e(asset('front')); ?>/images/send.svg" alt="Send icon">
                            <span><?php echo e(staticValue('request')); ?></span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <?php echo $__env->make('front.components.modal', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
</div>
<script src="<?php echo e(asset('front/')); ?>/assets/js/imask.js"></script>
<style>
    .breadcrumbs-wrapper {
        width: 100%;
    }

    .projects__apply-wrapper {
        max-width: initial;
    }
</style>





<script>

    function datePicker(selector) {
        const weekShorthand = "<?php echo e(setting('week_short')); ?>".split(', ');
        const weekLonghand = "<?php echo e(setting('week_long')); ?>".split(', ');
        const monthShorthand = "<?php echo e(setting('month_short')); ?>".split(', ');
        const monthLonghand = "<?php echo e(setting('month_long')); ?>".split(', ');
        flatpickr.localize({
            weekdays: {
                shorthand: weekShorthand,
                longhand: weekLonghand
            },
            months: {
                shorthand: monthShorthand,
                longhand: monthLonghand
            },
            firstDayOfWeek: 1,
            rangeSeparator: ' — ',
            weekAbbreviation: '<?php echo e(staticValue('week')); ?>',
            scrollTitle: '<?php echo e(staticValue('week','content')); ?>',
            toggleTitle: '<?php echo e(staticValue('week','short_description')); ?>'
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
<?php echo $__env->make('front.components.recaptchaHandler', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/application/index.blade.php ENDPATH**/ ?>