<?php $__env->startSection('body'); ?>

    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">Роль</h2>
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
                        <a href="<?php echo e(route('admin.roles.create.view')); ?>"
                           class="btn btn-primary pull-right waves-effect waves-light" type="button">
                            <i class="icon-plus-sign icon-white"></i>
                            <span>Добавить</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="content-body">

                <?php if(session('success')): ?>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <p class="mb-0"><?php echo e(session('success')); ?></p>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <?php endif; ?>

                <?php if(session('error')): ?>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <p class="mb-0"><?php echo e(session('error')); ?></p>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <?php endif; ?>

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
                                                <th scope="col">ID</th>
                                                <th scope="col">Роль</th>
                                                <th scope="col" class="action-col"></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php $__currentLoopData = $roles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $role): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <th scope="row"><?php echo e($role->id); ?></th>
                                                <td><?php echo e($role->name); ?></td>
                                                <td class="action-col">
                                                    <a href="<?php echo e(route('admin.roles.edit', $role)); ?>"
                                                       class="btn btn-small btn-info">
                                                        <i class="feather icon-edit icon-white"></i>
                                                    </a>
                                                    <div class="custom-control custom-switch custom-control-inline" style="display: inline-block;     margin-left: 10px;">
                                                        <input type="checkbox" name="status" class="custom-control-input lang-status-switch"
                                                               id="customSwitch<?php echo e($role->id); ?>" data-id="<?php echo e($role->id); ?>"
                                                                <?php if($role->status): echo 'checked'; endif; ?>>
                                                        <label class="custom-control-label" for="customSwitch<?php echo e($role->id); ?>"></label>
                                                    </div>
                                                    <a href="#"
                                                       class="btn btn-small btn-danger ml-2 delete-btn"
                                                       data-id="<?php echo e($role->id); ?>"
                                                       data-url="<?php echo e(route('admin.roles.delete', $role)); ?>">
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
                        <h5 class="modal-title">Подтвердить удаление</h5>
                        <button type="button" class="close" data-dismiss="modal">
                            ×
                        </button>
                    </div>

                    <div class="modal-body">
                        Вы уверены, что хотите удалить этот раздел?
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                                data-dismiss="modal">Отмена</button>

                        <button type="submit" class="btn btn-danger">
                            Удалить
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script>
        document.querySelectorAll('.lang-status-switch').forEach(el => {
            el.addEventListener('change', function () {
                const id = this.dataset.id;
                const status = this.checked ? 1 : 0;

                fetch(`/admin/roles/update-status/${id}`, {
                    method: 'POST',
                    credentials: 'same-origin',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                    },
                    body: JSON.stringify({ status })
                });
            });
        });

    </script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>

    <script>
        $(document).on('click', '.delete-btn', function (e) {
            e.preventDefault();

            let url = $(this).data('url');

            $('#deleteForm').attr('action', url);
            $('#deleteModal').modal('show');
        });

        
        

        
        
        
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    </script>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/admin/pages/roles/index.blade.php ENDPATH**/ ?>