<?php $__env->startSection('body'); ?>

<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">

        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Социальные сети</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="<?php echo e(route('admin.index')); ?>">Главная</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-header-right text-md-right col-md-3 col-12 d-md-block">
                <div class="form-group breadcrum-right">
                    <a href="<?php echo e(route('social_links.create')); ?>"
                        class="btn btn-primary pull-right waves-effect waves-light">
                        <i class="icon-plus-sign icon-white"></i>
                        <span>Добавить</span>
                    </a>
                </div>
            </div>
        </div>

        <div class="content-body">

            <?php echo $__env->make('admin.components.error', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

            <div class="row" id="table-hover-animation">
                <div class="col-12">
                    <div class="card">

                        <div class="card-content">
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-hover-animation mb-0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Название</th>
                                                <th class="text-right">Действия</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php $__currentLoopData = $socialLinks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $link): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <th><?php echo e($link->id); ?></th>
                                                <td><?php echo e($link->name); ?></td>

                                                
                                                <td class="text-right fx align-items-center justify-content-end">
                                                    
                                                    <a href="<?php echo e(route('social_links.edit', $link)); ?>"
                                                        class="btn btn-small btn-info">
                                                        <i class="feather icon-edit icon-white"></i>
                                                    </a>

                                                    
                                                    <div
                                                        class="custom-control custom-switch custom-control-inline mx-2  ">
                                                        <input type="checkbox" name="status"
                                                            class="custom-control-input lang-status-switch"
                                                            id="statusSwitch<?php echo e($link->id); ?>" data-id="<?php echo e($link->id); ?>"
                                                            <?php if($link->status): ?> checked <?php endif; ?>>
                                                        <label class="custom-control-label"
                                                            for="statusSwitch<?php echo e($link->id); ?>"></label>
                                                    </div>

                                                    
                                                    <a href="#" class="btn btn-small btn-danger delete-btn"
                                                        data-url="<?php echo e(route('social_links.destroy', $link)); ?>">
                                                        <i class="feather icon-trash icon-white"></i>
                                                    </a>
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


<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <form id="deleteForm" method="POST">
            <?php echo csrf_field(); ?>
            <?php echo method_field('DELETE'); ?>

            <div class="modal-content small">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">Подтвердите удаление</h5>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>

                <div class="modal-body">
                    Вы действительно хотите удалить этот раздел?
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Назад</button>
                    <button type="submit" class="btn btn-danger">Удалить</button>
                </div>
            </div>
        </form>
    </div>
</div>

<?php $__env->stopSection(); ?>


<?php $__env->startSection('script'); ?>

<script>
    // DELETE MODAL
    $(document).on('click', '.delete-btn', function (e) {
        e.preventDefault();
        let url = $(this).data('url');
        $('#deleteForm').attr('action', url);
        $('#deleteModal').modal('show');
    });

    document.querySelectorAll('.lang-status-switch').forEach(el => {
        el.addEventListener('change', function () {

            const id = this.dataset.id;
            const status = this.checked ? 1 : 0;

            const url = "<?php echo e(route('social_links.update-status', ':id')); ?>".replace(':id', id);

            fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({ status: status })
            })
                .then(res => res.json())
                .then(data => {
                    if (!data.success) {
                        this.checked = !this.checked;
                    }
                })
                .catch(() => {
                    this.checked = !this.checked;
                });
        });
    });
</script>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/admin/pages/social_links/index.blade.php ENDPATH**/ ?>