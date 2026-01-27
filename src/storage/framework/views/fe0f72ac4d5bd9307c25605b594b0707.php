<?php $__env->startSection('body'); ?>

<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-5 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Ro'yhat
                        </h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<?php echo e(route('admin.index')); ?>">Uy</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <form method="GET">
                    <div class="input-group">
                        <input type="text" class="form-control round" placeholder="Поиск" name="s" value="<?php echo e(request()->s); ?>">
                        <button class="btn btn-primary" type="submit">
                            <i class="feather icon-search"></i>
                        </button>
                    </div>
                </form>
            </div>






            <div class="content-header-right text-md-right col-md-3 d-md-block">

                <div class="form-group breadcrum-right ">

                    <a href="<?php echo e(route('admin.content.create', ['category' => request()->route('category')])); ?>"
                        class="btn btn-primary pull-right waves-effect waves-light" type="button">
                        <i class="feather icon-plus icon-white"></i>
                        <span>Qo'shish</span>
                    </a>
                    <a href="<?php echo e(route('admin.content.settings', ['category' => request()->route('category')])); ?>"
                        class="btn btn-primary pull-right waves-effect waves-light mr-2" type="button">
                        <i class="feather icon-settings  icon-white"></i>
                        <span>Sozlamalar</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="content-body">
            <?php echo $__env->make('admin.components.error', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
            <div class="row" id="table-hover-animation">
                <table class="table data-list-view dataTable">
                    <thead>
                        <tr>
                            <th scope="col">Nomi</th>
                            <?php if(request()->route('category') == 'list'): ?>
                            <th scope="col">Kalit</th>
                            <?php endif; ?>
                            <th scope="col" class="action-col"></th>
                        </tr>
                    </thead>
                    <tbody id="sortable">
                        <?php $__currentLoopData = $contents; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $content): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr data-id="<?php echo e($content->id); ?>">
                            <td>
                                <?php echo e(sectionValue($content, 'title')); ?>

                            </td>

                            <?php if(request()->route('category') == 'list'): ?>
                            <td>
                                <code><?php echo e(sectionValue($content, 'key')); ?></code>
                            </td>
                            <?php endif; ?>

                            <td class="fx align-items-center">
                                <a href="<?php echo e(route('admin.content.edit', ['id' => $content->id, 'category' => request()->route('category')])); ?>"
                                    class="btn btn-small btn-info mr-1">
                                    <i class="feather icon-edit icon-white"></i>
                                </a>

                                <div class="custom-control custom-switch custom-control-inline">
                                    <input type="checkbox" name="status" class="custom-control-input lang-status-switch"
                                        id="customSwitch<?php echo e($content->id); ?>" data-id="<?php echo e($content->id); ?>"
                                        <?php if($content->status): echo 'checked'; endif; ?>>
                                    <label class="custom-control-label" for="customSwitch<?php echo e($content->id); ?>"></label>
                                </div>

                                <a href="#" class="btn btn-small btn-danger ml-2 delete-btn"
                                    data-id="<?php echo e($content->id); ?>"
                                    data-url="<?php echo e(route('admin.content.delete', [$content->id, 'category' => request()->route('category')])); ?>">
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
<script>
    document.querySelectorAll('.lang-status-switch').forEach(el => {
        el.addEventListener('change', function () {
            const id = this.dataset.id;
            const status = this.checked ? 1 : 0;

            fetch(`/admin/update-status/${id}`, {
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
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <form id="deleteForm" method="POST">
            <?php echo csrf_field(); ?>
            <?php echo method_field('DELETE'); ?>

            <div class="modal-content small">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">O'chirishni tasdiqlang</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        ×
                    </button>
                </div>

                <div class="modal-body">
                    Haqiqatan ham ushbu bo'limni o'chirmoqchimisiz?
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Orqaga</button>

                    <button type="submit" class="btn btn-danger">
                        O'chirish
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

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
<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/admin/pages/content/index.blade.php ENDPATH**/ ?>