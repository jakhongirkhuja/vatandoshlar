<?php $__env->startSection('body'); ?>

<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-6 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0"><?php echo e($menu->title); ?> <?php echo e($categoryName && $categoryName->category? '| '.$categoryName?->category : ''); ?></h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<?php echo e(route('admin.index')); ?>">Главная</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-header-right text-md-right col-md-6 col-12 d-md-block">

                <div class="form-group breadcrumb-right ">
                    <?php
                    $parameters = ['slug'=>$slug,'id'=>$menu->id];
                    $parameters2= ['slug'=>$slug,'id'=>$menu->id];
                    if($parent_id && $category_slug){
                        $parameters['parent_id'] = $parent_id;
                        $parameters['category_slug'] = $category_slug;
                        $parameters2['parent_id'] = $parent_id;
                        $parameters2['category_slug']= $category_slug;
                    }
                    ?>

                    <a href="<?php echo e(route('admin.pages.section.create', $parameters)); ?>"
                        class="btn btn-primary pull-right waves-effect waves-light" type="button">
                        <i class="feather icon-plus icon-white"></i>
                        <span>Добавить</span>
                    </a>
                    <a href="<?php echo e(route('admin.pages.section.settings.create',$parameters2)); ?>"
                        class="btn btn-outline-primary pull-right waves-effect waves-light mr-2" type="button">
                        <i class="feather icon-settings  icon-white"></i>
                        <span>Настройки</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="content-body">
            <?php echo $__env->make('admin.components.error', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
            <div class="row" id="table-hover-animation">
                <div class="col-5"></div>

                <div class="col-7">
                    <?php echo $__env->make('admin.components.perPage', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                </div>
                <table class="table data-list-view dataTable">
                    <thead>
                        <tr>
                            <th scope="col" width="100">Order</th>
                            <th scope="col">Childs</th>
                            <th scope="col">Title</th>

                            <th scope="col" class="action-col"></th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php $__currentLoopData = $sections; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $section): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                        <tr role="row" class="odd">
                            <td width="100">
                                <?php echo $__env->make('admin.components.sort-form', ['menu' => $section,'route' => route('admin.pages.section.update-sort', ['slug'=>$slug,'id' => $id,'section_id'=>$section->id])], array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                            </td>
                            <td width="100">
                                <?php $__currentLoopData = $section->children->groupBy('category_slug'); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category=>$child): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                                <a href="<?php echo e(route('admin.pages.section.index', ['slug'=>$slug,'id'=>$menu->id, 'parent_id'=>$section->id, 'category_slug'=>$category])); ?>" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title data-original-title="Под категорию"><?php echo e(isset($child[0])? $child[0]->category: 'empty'); ?></a>

                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <a href="<?php echo e(route('admin.pages.section.settings.create', ['slug'=>$slug,'id'=>$menu->id, 'parent_id'=>$section->id])); ?>" class="btn btn-secondary" style="display: none;" data-toggle="tooltip" data-placement="top" title data-original-title="Добавить под категорию"><i class="feather icon-plus icon-white"></i></a>
                            </td>
                            <td>
                               <?php echo e(\Illuminate\Support\Str::limit($section->getTitle($section->translations), 40)); ?>

                            </td>



                            <td class="fx align-items-center">
                                <?php
                                $parameters = ['slug'=>$slug,'id'=>$id , 'section_id'=>$section->id,];

                                if($parent_id && $category_slug){
                                $parameters['parent_id'] = $parent_id;
                                $parameters['category_slug'] = $category_slug;

                                }
                                ?>
                                <a href="<?php echo e(route('admin.pages.section.edit',$parameters)); ?>" class="btn btn-small btn-info mr-1">
                                    <i class="feather icon-edit icon-white"></i>
                                </a>
                                <div class="custom-control custom-switch custom-control-inline">
                                    <input
                                        type="checkbox"
                                        name="status"
                                        class="custom-control-input lang-status-switch"
                                        id="customSwitch<?php echo e($section->id); ?>"
                                        data-id="<?php echo e($section->id); ?>"
                                        <?php if($section->status): ?> checked <?php endif; ?>
                                    >
                                    <label class="custom-control-label" for="customSwitch<?php echo e($section->id); ?>"></label>
                                </div>
                                <a href="#"
                                    class="btn btn-small btn-danger ml-2 delete-btn"
                                    data-id="<?php echo e($section->id); ?>"
                                    data-url="<?php echo e(route('pages.delete',$section->id)); ?>">
                                    <i class="feather icon-trash icon-white"></i>
                                </a>

                            </td>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>



                    </tbody>
                </table>
                <?php echo e($sections->withQueryString()->links('pagination::bootstrap-5')); ?>

            </div>

        </div>
    </div>
</div>
<!-- Delete Modal -->
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

<?php $__env->stopSection(); ?>
<?php $__env->startSection('script'); ?>

<script>
    $(document).on('click', '.delete-btn', function(e) {
        e.preventDefault();

        let url = $(this).data('url');

        $('#deleteForm').attr('action', url);
        $('#deleteModal').modal('show');
    });

    document.addEventListener('DOMContentLoaded', function() {
        const switches = document.querySelectorAll('.lang-status-switch');

        switches.forEach(switchEl => {
            switchEl.addEventListener('change', function() {
                const langId = this.dataset.id;
                const url = "<?php echo e(route('admin.pages.section.index',['slug'=>$slug,'id' => $id])); ?>/update-status/" + langId;

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

<?php echo $__env->make('admin.layouts.layouts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/admin/pages/global/section/index.blade.php ENDPATH**/ ?>