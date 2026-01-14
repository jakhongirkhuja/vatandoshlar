<?php $__env->startSection('body'); ?>

    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">Языки</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="<?php echo e(route('admin.index')); ?>">Главная</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-header-right text-md-right col-md-3 col-12 d-md-block">
                    <div class="form-group breadcrum-right">
                        <a href="<?php echo e(route('langs.create')); ?>"
                           class="btn btn-primary pull-right waves-effect waves-light" type="button">
                            <i class="icon-plus-sign icon-white"></i>
                            <span>Добавить</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <div class="row" id="table-hover-animation">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">

                            </div>
                            <div class="card-content">
                                <div class="card-body">

                                    <div class="table-responsive">
                                        <table class="table table-hover-animation mb-0">
                                            <thead>
                                            <tr>
                                                <th scope="col">Order</th>
                                                <th scope="col">Code</th>
                                                <th scope="col">Name</th>
                                                <th scope="col" class="action-col"></th>
                                                <th scope="col" class="action-col"></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php $__currentLoopData = $langs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $lang): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <th scope="row"> <?php echo e($lang->sort_order); ?></th>
                                                <td><?php echo e($lang->code); ?></td>
                                                <td><?php echo e($lang->name); ?></td>

                                                <td class="action-col">

                                                    <a href="<?php echo e(route('langs.show', $lang)); ?>"
                                                       class="btn btn-small btn-info">
                                                        <i class="feather icon-edit icon-white"></i>
                                                    </a>
                                                </td>
                                                <td class="action-col">
                                                    <div class="custom-control custom-switch custom-control-inline">
                                                        <input
                                                            type="checkbox"
                                                            name="status"
                                                            class="custom-control-input lang-status-switch"
                                                            id="customSwitch<?php echo e($lang->id); ?>"
                                                            data-id="<?php echo e($lang->id); ?>"
                                                            <?php if($lang->status): ?> checked <?php endif; ?>
                                                        >
                                                        <label class="custom-control-label" for="customSwitch<?php echo e($lang->id); ?>"></label>
                                                    </div>
                                                </td>


                                            </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            </tbody>
                                        </table>
                                    </div>



                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const switches = document.querySelectorAll('.lang-status-switch');

            switches.forEach(switchEl => {
                switchEl.addEventListener('change', function() {
                    const langId = this.dataset.id;
                    const url = "<?php echo e(url('admin/langs-status')); ?>/" + langId;

                    fetch(url, {
                        method: 'GET',
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest',
                            'X-CSRF-TOKEN': '<?php echo e(csrf_token()); ?>'
                        },
                    })
                        .then(response => response.json())
                        .then(data => {
                            console.log(data.message); // Optional: show toast
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            // Optionally revert the checkbox if failed
                            this.checked = !this.checked;
                        });
                });
            });
        });
    </script>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/admin/pages/langs/index.blade.php ENDPATH**/ ?>