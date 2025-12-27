<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Медиа</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="media-header">
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

                    <input name="category" type="hidden" value="structure_main">
                    <input name="post_id" type="hidden" value="1240">
                </div>

                <div id="reset" class="media-block">
                    <ul class="thumbnails list-unstyled ui-sortable" id="media_list">
                        @if(isset($menu))
                            @foreach($menu->images as $image)
                                <li class="thumb {{ $image->main ? 'main' : '' }}" data-id="{{ $image->id }}">
                                    <a href="{{ asset('storage/' . $image->image) }}" class="thumbnail fancybox tooltips"
                                        rel="group">
                                        <img src="{{ asset('storage/' . $image->image) }}" style="width: 180px; height: 180px;">
                                    </a>
                                    <div class="toolbar">
                                        <div class="btn-group">
                                            <a class="btn btn-mini move ui-sortable-handle center" href="#" title="Перемещать">
                                                <i class="fa fa-arrows"></i>
                                            </a>
                                            <a class="btn btn-mini ajax_set_main center {{ $image->main ? 'btn-info' : '' }}"
                                                href="#" title="Сделать Главным">
                                                <i class="fa fa-arrow-up"></i>
                                            </a>
                                            <a class="btn btn-mini btn-delete ajax_delete center" href="#" title="Удалить">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </div>
                                        <div class="btn btn-mini check">
                                            <input type="checkbox" class="selected_images" value="{{ $image->id }}"
                                                id="img_{{ $image->id }}" name="img[]">
                                            <label for="img_{{ $image->id }}"><span></span></label>
                                        </div>
                                    </div>
                                </li>
                            @endforeach
                        @endif
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function fetchData(part) {
        console.log('fetchData called with:', part);
        const tempIds = part.filter(id => id.startsWith('temp_'));
        const realids = part.filter(id => !id.startsWith('temp_'));
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
                if (data.status) {
                    data.deleted.forEach(id => {
                        const item = document.querySelector(`li.thumb[data-id="${id}"]`);
                        if (item) {
                            item.remove();
                        }
                    });
                } else {
                    alert('Xatolik: ' + data.message);
                }
            })

        tempIds.forEach(id => {
            const item = document.querySelector(`li.thumb[data-id="${id}"]`);
            item.remove();
        });
    }

    let selectedValues = [];
    document.querySelectorAll('input.selected_images').forEach(checkbox => {
        checkbox.addEventListener('change', function () {
            selectedValues = Array.from(document.querySelectorAll('input.selected_images:checked'))
                .map(cb => cb.value);
        });
    });
    document.getElementById('image-delete-btn').addEventListener('click', function () {

        fetchData(Array.from(document.querySelectorAll('input.selected_images:checked'))
            .map(cb => cb.value))

    });
    document.getElementById('image-delete').addEventListener('click', function () {

        fetchData(Array.from(document.querySelectorAll('input.selected_images'))
            .map(cb => cb.value))
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
</script>

<script>


    function attachThumbEvents(li) {
        const mediaList = document.getElementById('media_list');
        const mainInput = document.getElementById('main_image_input');

        li.querySelector('.ajax_set_main').addEventListener('click', function (e) {
            e.preventDefault();
            mediaList.querySelectorAll('.thumb').forEach(t => t.classList.remove('main'));
            mediaList.querySelectorAll('.ajax_set_main').forEach(btn => btn.classList.remove('btn-info'));
            console.log('edit');
            li.classList.add('main');
            li.querySelector('.ajax_set_main').classList.add('btn-info');
            const originalName = li.getAttribute('data-name') || li.getAttribute('data-id');
            mainInput.value = originalName;
        });

        li.querySelector('.ajax_delete').addEventListener('click', function (e) {
            e.preventDefault();
            if (li.classList.contains('main')) mainInput.value = '';
            li.remove();
            let isnum = /^\d+$/.test(li.dataset.id);
            if (isnum) {
                let ss = {};
                ss.img = [li.dataset.id];
                fetchData(ss.img);
            }
        });
    }
    function btnThumbEvents(li) {
        const deleteBtn = li.querySelector('.btn-delete');

        deleteBtn?.addEventListener('click', function (e) {
            e.preventDefault();

            const fileName = li.getAttribute('data-name');
            const fileSize = li.getAttribute('data-size');

            // Remove from storedFiles
            if (fileName && fileSize) {
                const newDT = new DataTransfer();
                [...storedFiles.files].forEach(f => {
                    if (!(f.name === fileName && f.size == fileSize)) {
                        newDT.items.add(f);
                    }
                });
                storedFiles = newDT;
                fileInput.files = storedFiles.files;
            }

            li.remove();
        });
    }
    const fileInput = document.getElementById('file');
    const mediaList = document.getElementById('media_list');
    let storedFiles = new DataTransfer();

    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('#media_list .thumb').forEach(li => attachThumbEvents(li));
    });

    fileInput.addEventListener('change', function (event) {
        [...event.target.files].forEach((file, index) => {
            if ([...storedFiles.files].some(f => f.name === file.name && f.size === file.size)) {
                return;
            }

            storedFiles.items.add(file);

            const reader = new FileReader();
            reader.onload = function (e) {
                const id = 'temp_' + Date.now() + '_' + Math.random().toString(36).slice(2);
                const li = document.createElement('li');
                li.classList.add('thumb');
                li.setAttribute('data-id', id);
                li.setAttribute('data-name', file.name);
                li.setAttribute('data-size', file.size);

                // Video yoki rasmni aniqlash
                const isVideo = file.type.startsWith('video/');
                const mediaElement = isVideo
                    ? `<video src="${e.target.result}" style="width: 180px; height: 180px; object-fit: cover;" controls></video>`
                    : `<img src="${e.target.result}" style="width: 180px; height: 180px; object-fit: cover;">`;

                li.innerHTML = `
                <a class="thumbnail fancybox tooltips" rel="group">
                    ${mediaElement}
                </a>
                <div class="toolbar">
                    <div class="btn-group">
                        <a class="btn btn-mini move ui-sortable-handle center" href="#" title="Перемещать">
                            <i class="fa fa-arrows"></i>
                        </a>
                        <a class="btn btn-mini ajax_set_main center" href="#" title="Сделать Главным">
                            <i class="fa fa-arrow-up"></i>
                        </a>
                        <a class="btn btn-mini btn-delete ajax_delete center" href="#" title="Удалить">
                            <i class="fa fa-trash-o"></i>
                        </a>
                    </div>
                    <div class="btn btn-mini check">
                        <input type="checkbox" class="selected_images" value="${id}" id="${id}" name="img[]">
                        <label for="${id}"><span></span></label>
                    </div>
                </div>
            `;

                mediaList.appendChild(li);
                btnThumbEvents(li);
                attachThumbEvents(li);
            };
            reader.readAsDataURL(file);
        });

        // Store all accumulated files
        fileInput.files = storedFiles.files;
    });

</script>