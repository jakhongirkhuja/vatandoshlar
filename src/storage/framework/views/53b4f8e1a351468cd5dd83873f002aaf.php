<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Загрузки</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>

            </div>
            <style>
                #inside {
                    position: absolute;
                    left: 50%;
                    top: 50%;
                    transform: translate(-50%, -50%);
                    font-size: 15px;
                }

                #progress-bar {
                    width: 0%;
                    background: #4caf50;
                    transition: width 1s;
                    background-color: #5bc0de;
                    background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(0.25, rgba(255, 255, 255, 0.15)), color-stop(0.25, transparent), color-stop(0.5, transparent), color-stop(0.5, rgba(255, 255, 255, 0.15)), color-stop(0.75, rgba(255, 255, 255, 0.15)), color-stop(0.75, transparent), to(transparent));
                    background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
                    background-image: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
                    background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
                    background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
                    height: 30px;

                }
            </style>
            <div class="modal-body drop-zone" id="dropZone">
                <input type="file" id="fileInput" hidden multiple>
                <div class="media-header">
                    <div id="progress-container"
                        style="width: 100%; background: #f3f3f3; height: 30px;     position: relative; margin-bottom: 10px; ">
                        <div id="progress-bar" style=""> </div>
                        <div id="inside">0%</div>
                    </div>
                    <span class="btn btn-success fileinput-button">
                        <i class="fa fa-plus" aria-hidden="true"></i>
                        <span>Добавить</span>
                        <input type="hidden" id="main_image_input" name="main_image_input">
                        <input id="file" type="file" name="images[]" multiple
                            accept="image/jpeg,image/jpg,image/png,image/gif,image/svg+xml,video/mp4,video/webm,video/ogg,video/quicktime,video/x-msvideo">
                    </span>

                    <span class="btn btn-success fileinput-button delete_image" id="image-delete">
                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                        <span>Удалить все</span>
                    </span>

                    <span class="btn btn-success fileinput-button delete_image_select" id="image-delete-btn"
                        style="cursor: pointer;">
                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                        <span>Удалить выбранные</span>
                    </span>
                    <input name="category" type="hidden" value="<?php echo e(request('category')); ?>">
                    <?php if (request('slug') == 'menu'): ?>
                    <input name="post_id" type="hidden" value="<?php    echo e(request()->route('menu_main_id')); ?>">
                    <?php elseif (request('slug') == 'content'): ?>
                    <input name="post_id" type="hidden" value="<?php    echo e(request()->route('content_id')); ?>">
                    <?php else: ?>

                    <input name="post_id" type="hidden" value="<?php    echo e(request()->route('section_id')); ?>">
                    <?php endif; ?>
                </div>

                <div id="reset" class="media-block">
                    <ul class="thumbnails list-unstyled " id="media_list">
                        <?php if(isset($menu)): ?>

                            <?php $__currentLoopData = $menu->images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php
                                    $fileExtension = pathinfo($image->image, PATHINFO_EXTENSION);
                                    $videoExtensions = ['mp4', 'webm', 'ogg', 'mov', 'avi', 'mkv'];
                                    $isVideo = in_array(strtolower($fileExtension), $videoExtensions);
                                ?>

                                <li class="thumb <?php echo e($image->main ? 'main' : ''); ?>" data-id="<?php echo e($image->id); ?>">
                                    <?php if($isVideo): ?>
                                        <a href="<?php echo e(asset('storage/' . $image->image)); ?>" data-fancybox="gallery"
                                            class="thumbnail fancybox tooltips" rel="group">
                                            <video style="width: 180px; height: 180px; object-fit: cover;" controls>
                                                <source src="<?php echo e(asset('storage/' . $image->image)); ?>"
                                                    type="video/<?php echo e($fileExtension); ?>">
                                                Your browser does not support the video tag.
                                            </video>
                                        </a>
                                    <?php else: ?>
                                        <a href="<?php echo e(asset('storage/' . $image->image)); ?>" class="thumbnail fancybox tooltips"
                                            data-fancybox="gallery" rel="group">
                                            <img src="<?php echo e(asset('storage/' . $image->image)); ?>"
                                                style="width: 180px; height: 180px; object-fit: cover;">
                                        </a>
                                    <?php endif; ?>

                                    <div class="toolbar">
                                        <div class="btn-group">
                                            <a class="btn btn-mini move ui-sortable-handle center" href="#" title="Перемещать">
                                                <i class="fa fa-arrows"></i>
                                            </a>
                                            <a class="btn btn-mini ajax_set_main center <?php echo e($image->main ? 'btn-info' : ''); ?>"
                                                href="#" title="Сделать Главным">
                                                <i class="fa fa-arrow-up"></i>
                                            </a>
                                            <a class="btn btn-mini btn-delete ajax_delete center" href="#" title="Удалить">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </div>

                                        <div class="btn btn-mini check">
                                            <input type="checkbox" class="selected_images" value="<?php echo e($image->id); ?>"
                                                id="img_<?php echo e($image->id); ?>" name="img[]">
                                            <label for="img_<?php echo e($image->id); ?>"><span></span></label>
                                        </div>
                                    </div>
                                </li>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endif; ?>
                    </ul>
                </div>

            </div>
        </div>
    </div>
    <input id="updateMainButton_route" value="<?php echo e(route('updateMainButton')); ?>">
</div>

<script>

    const dropZone = document.getElementById('dropZone');
    const uploadFile = document.getElementById('fileInput');
    const media = document.getElementById('media_list');

    let files = null;


    ['dragenter', 'dragover'].forEach(event => {

        dropZone.addEventListener(event, e => {


            e.preventDefault();
            dropZone.classList.add('dragover');
        });
    });

    ['dragleave', 'drop'].forEach(event => {
        dropZone.addEventListener(event, e => {
            e.preventDefault();
            dropZone.classList.remove('dragover');
        });
    });

    /* Drop files */
    dropZone.addEventListener('drop', e => {
        files = e.dataTransfer.files;
        const filesArray = [...e.dataTransfer.files];
        imageDropFiles(filesArray);
    });
    window.addEventListener("load", () => {
        document.querySelectorAll(".drop-zone, .drop-zone *")
            .forEach(el => el.draggable = false)
    })
    /* Select files */
    // uploadFile.addEventListener('change', e => {
    //     files = e.target.files;
    //     console.log('--');
    //     console.log(files);
    //     // uploadImage();
    // });

    /* Upload / preview function */
    function uploadImage() {
        if (!files || !files.length) return;

        const file = files[0];

        // Example: image preview
        const imgLink = URL.createObjectURL(file);
        console.log('Image URL:', imgLink);

        // Optional preview
        const img = document.createElement('img');
        img.src = imgLink;
        img.style.maxWidth = '200px';
        img.style.marginTop = '10px';

        dropZone.innerHTML = '';
        dropZone.appendChild(img);
    }
    function fetchMainImage(id) {
        if (!id) {
            console.log('id not found');
        }
        const metaTag = document.querySelector('input[name="_token"]');
        const csrfToken = metaTag ? metaTag.value : '';
        const updateMainButtonRoute = document.querySelector('#updateMainButton_route').value;
        const slugCheck = document.querySelector('#slug').value;
        fetch(updateMainButtonRoute, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': csrfToken
            },
            body: JSON.stringify({
                'id': id,
                '_token': csrfToken,
                'slug': slugCheck,
            })
        })
            .then(response => response.json())
            .then(data => {
                // if (!data.status) {
                //     alert('Server xatosi: ' + data.message);
                // }
            })
            .catch(() => {
                alert('Server bilan aloqa uzildi');
            });
    }
    function fetchData(part) {
        console.log('fetchData called with:', part);
        const tempIds = part.filter(id => id.startsWith('temp_'));
        const realids = part.filter(id => !id.startsWith('temp_'));
        part.forEach(id => {
            const item = document.querySelector(`li.thumb[data-id="${id}"]`);
            if (item) {
                item.remove();
            }
        });
        const metaTag = document.querySelector('input[name="_token"]');
        const csrfToken = metaTag ? metaTag.value : '';
        const deleteroute = document.querySelector('#delete-route').value;
        const nameslug = document.querySelector('#slug').value;
        fetch(deleteroute, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': csrfToken
            },
            body: JSON.stringify({
                slug: nameslug,
                img: realids
            })
        })
            .then(response => response.json())
            .then(data => {
                if (!data.status) {
                    alert('Server xatosi: ' + data.message);
                }
            })
            .catch(() => {
                alert('Server bilan aloqa uzildi');
            });
    }

    function fetchImage(tempIds) {
        const onlyTemp = tempIds.filter(id => id.startsWith('temp_'));
        if (!onlyTemp.length) return;
    }

    let selectedValues = [];
    document.querySelectorAll('input.selected_images').forEach(checkbox => {
        checkbox.addEventListener('change', function () {
            selectedValues = Array.from(document.querySelectorAll('input.selected_images:checked'))
                .map(cb => cb.value);
        });
    });
    let checkedButtonTriggerd = true;
    document.getElementById('image-delete-btn').addEventListener('click', function () {
        $('#deleteImageSelectionsModal').modal('show');
        checkedButtonTriggerd = true;


    });
    document.getElementById('image-delete').addEventListener('click', function () {
        $('#deleteImageSelectionsModal').modal('show');
        checkedButtonTriggerd = false;

    });
    !function () {
        var inp = document.getElementById('file');
        var ext = ['jpg', 'jpeg', 'png', 'gif', 'svg', 'mp4'];
        var mime = [
            'image/jpeg',
            'image/png',
            'image/gif',
            'image/svg+xml',
            'video/mp4'
        ];

        function check(files) {
            if (!files || !files.length) return 1;
            var bad = [];
            for (var i = 0; i < files.length; i++) {
                var f = files[i];
                var e = f.name.toLowerCase().split('.').pop();
                if (ext.indexOf(e) === -1 || (f.type && mime.indexOf(f.type.toLowerCase()) === -1)) {
                    bad.push(f.name);
                }
            }
            if (bad.length) {
                alert('Недопустимые файлы:\n' + bad.join('\n') + '\n\nРазрешены: jpeg, jpg, png, gif, svg, mp4, webm, ogg, mov, avi');
                return 0;
            }
            return 1;
        }

        inp.addEventListener('change', function (e) {
            if (!check(e.target.files)) {
                e.preventDefault();
                e.stopImmediatePropagation();
                e.target.value = '';
            }
        }, true);

        if (window.jQuery && jQuery.fn.fileupload) {
            jQuery('#file').on('fileuploadadd fileuploadsubmit', function (e, data) {
                if (!check(data.files || data.originalFiles)) {
                    e.stopImmediatePropagation();
                    jQuery(this).val('');
                    return false;
                }
            });
        }
    }();

    <?php
        if (isset($globaltype)) {
            if ($globaltype == 'menu' || $globaltype == 'content') {
                $id = request()->route('id');
            } elseif ($globaltype == 'section') {
                $id = request()->route('section_id');
            } elseif ($globaltype == 'settings') {
                $id = 1;
            } elseif ($globaltype == 'langs') {
                $id = request()->route('lang');

            }
        } else {
            $id = null;
        }
    ?>
    const routeCreateImage = "<?php echo e(route('createImage', ['id' => $id])); ?>";
    const fileInput = document.getElementById('file');
    const mediaList = document.getElementById('media_list');
    const mainInput = document.getElementById('main_image_input');

    let storedFiles = new DataTransfer();
    let imageToDelete = null; // modal uchun
    let deleteImageId = null;

    function attachThumbEvents(li) {
        li.querySelector('.ajax_set_main')?.addEventListener('click', function (e) {
            e.preventDefault();

            mediaList.querySelectorAll('.thumb').forEach(t => t.classList.remove('main'));
            mediaList.querySelectorAll('.ajax_set_main').forEach(btn => btn.classList.remove('btn-info'));

            li.classList.add('main');
            this.classList.add('btn-info');

            mainInput.value = li.dataset.name || li.dataset.id;
            <?php
                if ($id) {
            ?>
            fetchMainImage(li.dataset.id);
            <?php
                }
            ?>

        });
    }

    function attachDeleteEvent(li) {
        li.querySelector('.btn-delete')?.addEventListener('click', function (e) {
            e.preventDefault();
            imageToDelete = li;
            $('#deleteImageModal').modal('show');
        });
    }

    document.addEventListener('click', function (e) {
        if (e.target.id === 'confirmImageDelete') {


            if (!deleteImageId) return;

            fetchData([deleteImageId]);

            if (imageToDelete) {
                imageToDelete.remove();
            }

            deleteImageId = null;
            imageToDelete = null;
            $('#deleteImageModal').modal('hide');

        }
        if (e.target.id === 'confirmImageDeleteSelections') {
            if (checkedButtonTriggerd) {
                fetchData(Array.from(document.querySelectorAll('input.selected_images:checked'))
                    .map(cb => cb.value))
            } else {
                fetchData(Array.from(document.querySelectorAll('input.selected_images'))
                    .map(cb => cb.value))
            }
            $('#deleteImageSelectionsModal').modal('hide');
        }

    });
    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('#media_list .thumb').forEach(li => {
            attachThumbEvents(li);
            attachDeleteEvent(li);
        });
    });
    const filepart = document.getElementById('file');


    // new update function
    function imageDropFiles(takefiles) {
        const formData = new FormData();
        console.log(takefiles);
        takefiles.forEach(file => {
            formData.append('files[]', file);
            const li = document.createElement('li');
            li.className = 'thumb uploading';
            <?php
                if (!$id) {

            ?>  li.dataset.name = file.name; <?php
                }
            ?>

            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('progress-bar').style.width = 100 + '%';
                document.getElementById('inside').innerHTML = `100%`;

                const isVideo = file.type.startsWith('video/');
                const preview = isVideo
                    ? `<video src="${e.target.result}" width="180" height="180" controls></video>`
                    : `<img src="${e.target.result}" width="180" height="180">`;

                li.innerHTML = `
                <a class="thumbnail" data-fancybox="gallery">${preview}</a>
                <div class="toolbar">
                   <div class="btn-group">
                      <a class="btn btn-mini move ui-sortable-handle center" href="#" title="Перемещать">
                            <i class="fa fa-arrows"></i>
                        </a>
                        <a class="btn btn-mini ajax_set_main"><i class="fa fa-arrow-up"></i></a>
                        <a class="btn btn-mini btn-delete ajax_delete"><i class="fa fa-trash-o"></i></a>
                    </div>
                </div>
                <div class="btn btn-mini check">
                    <input type="checkbox" class="selected_images" value=""
                           id="img_" name="img[]"><label for="img_385"><span></span></label>

                </div>
            `;

                media.appendChild(li);
                attachThumbEvents(li);
                attachDeleteEvent(li);
                document.querySelectorAll(".drop-zone, .drop-zone *")
                    .forEach(el => el.draggable = false)
            };
            reader.readAsDataURL(file);
        });
        console.log(document.querySelector('meta[name="csrf-token"]').content);
        formData.append('_token', document.querySelector('meta[name="csrf-token"]').content);

        let newslug = document.querySelector('#slug').value;
        formData.append('slug', newslug);
        <?php

if ($id) {

            ?>

        const xhr = new XMLHttpRequest();

        // 1. Setup Progress Listener
        xhr.upload.addEventListener("progress", (event) => {
            console.log(event);
            if (event.lengthComputable) {
                // Calculate percentage
                const percentComplete = Math.round((event.loaded / event.total) * 100);
                requestAnimationFrame(() => {
                    document.getElementById('progress-bar').style.width = percentComplete + '%';
                    document.getElementById('inside').innerHTML = `${percentComplete}%`;
                });
                // Update your UI Progress Bar here

                console.log(`Actual bytes sent: ${event.loaded} of ${event.total}`);
            }
        });

        // 2. Setup Load/Success Listener
        xhr.addEventListener("load", () => {
            if (xhr.status >= 200 && xhr.status < 300) {
                try {
                    const data = JSON.parse(xhr.responseText);
                    console.log(data);

                    if (!data.success) {
                        return;
                    }

                    const uploadingItems = document.querySelectorAll('.thumb.uploading');

                    data.data.forEach((value, index) => {
                        let li = uploadingItems[index];

                        if (li) {
                            li.classList.remove('uploading');
                            li.dataset.id = value;

                            const input = li.querySelector('.selected_images');
                            if (input) {
                                input.id = `img_${value}`;
                                input.value = value;
                            }

                            const label = li.querySelector('label');
                            if (label) {
                                label.htmlFor = `img_${value}`;
                            }

                            // Attach events to the specific li
                            attachThumbEvents(li);
                            attachDeleteEvent(li);
                        }
                    });
                } catch (e) {
                    console.error("Error parsing JSON response", e);
                }
            } else {
                console.error("Server returned an error:", xhr.statusText);
            }
        });

        // 3. Setup Error Listener
        xhr.addEventListener("error", () => {
            console.log('Upload failed');
            alert('Error check console');
        });

        // 4. Open and Send
        xhr.open('POST', routeCreateImage);
        // If you are using Laravel or similar, you might need the CSRF token header:
        // xhr.setRequestHeader('X-CSRF-TOKEN', document.querySelector('meta[name="csrf-token"]').content);

        xhr.send(formData);


        //        fetch(routeCreateImage, {
        //            method: 'POST',
        //            body: formData
        //        })
        //            .then(res => res.json())
        //            .then(data => {
        //                console.log(data);
        //                if (!data.success) {
        //                    //li.remove();
        //                    // alert('Upload error check console');
        //                    return;
        //                }
        //                const uploadingItems = document.querySelectorAll('.thumb.uploading');
        //                let li = document.querySelectorAll('.thumb.uploading');
        //                data.data.forEach((value, index) => {
        //
        //                    li = uploadingItems[index];
        //
        //                    if (li) {
        //                        li.classList.remove('uploading');
        //                        li.dataset.id = value;
        //                        li.querySelector('.selected_images').id = `img_${value}`;
        //                        li.querySelector('.selected_images').value = value;
        //                        li.querySelector('label').htmlFor = `img_${value}`
        //                    }
        //                    attachThumbEvents(li);
        //                    attachDeleteEvent(li);
        //                });
        //            })
        //            .catch((error) => {
        //                console.log(error);
        //                alert('Error check console');
        //            });

        <?php
}

        ?>


    }

    filepart.addEventListener('change', function (event) {
        imageDropFiles([...event.target.files])
    });
    Fancybox.bind("[data-fancybox]", {
        thumbs: false
    });
</script>

<div class="modal  " id="deleteImageModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content small">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title">Подтвердите удаление</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <p class="mb-0">Вы действительно хотите удалить выбранные изображения?</p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                    Отмена
                </button>
                <button type="button" id="confirmImageDelete" class="btn btn-danger">
                    Удалить
                </button>
            </div>

        </div>
    </div>
</div>
<div class="modal  " id="deleteImageSelectionsModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content small">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title">Подтвердите удаление</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <p class="mb-0">Вы действительно хотите удалить выбранные изображения?</p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                    Отмена
                </button>
                <button type="button" id="confirmImageDeleteSelections" class="btn btn-danger">
                    Удалить
                </button>
            </div>
        </div>
    </div>
</div>
<?php $__env->startSection('script'); ?>
    <script>
        let buttonId;
        $(document).on('click', '.btn-delete', function (e) {
            e.preventDefault();

            imageToDelete = this.closest('li');
            deleteImageId = imageToDelete.dataset.id;
            $('#deleteImageModal').modal('show');

        });
    </script>
<?php $__env->stopSection(); ?><?php /**PATH /var/www/html/resources/views/admin/components/modal.blade.php ENDPATH**/ ?>