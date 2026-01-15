<div class="row">
    <div class="col-4">

        <?php if(in_array($id, $settings)): ?>

        <fieldset class="form-group">

            <select class="form-control round text-center" name="sorting" id="basicSelect2" onchange="updateSorting(this)">
                <option value="sort_order_asc" <?php echo e(request('sorting') == 'sort_order_asc' ? 'selected' : ''); ?>>Сортировать по порядку (возрастание)</option>
                <option value="sort_order_desc" <?php echo e(request('sorting') == 'sort_order_desc' ? 'selected' : ''); ?>>Сортировать по порядку (убывание)</option>
                <option value="created_at_desc" <?php echo e(request('sorting') == 'created_at_desc' ? 'selected' : ''); ?>>Сортировать по дате создания (новые сначала)</option>
                <option value="created_at_asc" <?php echo e(request('sorting') == 'created_at_asc' ? 'selected' : ''); ?>>Сортировать по дате создания (старые сначала)</option>
                <option value="time_desc" <?php echo e(request('sorting') == 'time_desc' ? 'selected' : ''); ?>>Сортировать по времени (позже — раньше)</option>
                <option value="time_asc" <?php echo e(request('sorting') == 'time_asc' ? 'selected' : ''); ?>>Сортировать по времени (раньше — позже)</option>
                <option value="random" <?php echo e(request('sorting') == 'random' ? 'selected' : ''); ?>>Случайный порядок</option>
            </select>
        </fieldset>
            <?php endif; ?>
    </div>
    <div class="col-2">
        <fieldset class="form-group">
            <?php
                $options = [10, 20, 30, 50, 80, 100, 300, 500];
                $selectedPerPage = request('per_page', 20); // default to 20 if null
            ?>
            <select class="form-control round text-center" name="per_page" id="basicSelect" onchange="updatePerPage(this)">
                <?php $__currentLoopData = $options; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $option): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($option); ?>" <?php echo e($selectedPerPage == $option ? 'selected' : ''); ?>>
                        <?php echo e($option); ?>

                    </option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
        </fieldset>
        <script >

            function updatePerPage(select) {
                const perPage = select.value;
                const url = new URL(window.location.href);
                url.searchParams.set('per_page', perPage); // add or update per_page param
                url.searchParams.set('page', 1); // optional: reset to first page
                window.location.href = url.toString(); // reload page
            }

            function updateSorting(select) {
                const selectedvalue = select.value;
                const url = new URL(window.location.href);
                url.searchParams.set('sorting', selectedvalue);
                url.searchParams.set('sort_trigger', 1);
                window.location.href = url.toString();
            }

        </script>
    </div>
    <div class="col-6">
        <form  method="GET">
            <div class="input-group">
                <input type="text" class="form-control round" placeholder="Поиск" name="s" value="<?php echo e(request()->s); ?>">
                <button class="btn btn-primary" type="submit">
                    <i class="feather icon-search"></i>
                </button>
            </div>
        </form>
    </div>
</div>
<?php /**PATH /var/www/html/resources/views/admin/components/perPage.blade.php ENDPATH**/ ?>