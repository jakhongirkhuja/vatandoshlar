<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Медиа</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body drop-zone" id="dropZone">
                <input type="file" id="fileInput" hidden multiple>
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
                    <input name="category" type="hidden" value="{{request('category')}}">
                        @if(request('slug') == 'menu')
    <input name="post_id" type="hidden" value="{{ request()->route('menu_main_id') }}">
@elseif(request('slug') == 'content')
    <input name="post_id" type="hidden" value="{{ request()->route('content_id') }}">
@else
    {{-- Agar boshqa holat bo'lsa, standart post_id --}}
    <input name="post_id" type="hidden" value="{{ request()->route('section_id') }}">
@endif
                </div>

                <div id="reset" class="media-block">
                    <ul class="thumbnails list-unstyled ui-sortable" id="media_list">
                        @if(isset($menu))
                            @foreach($menu->images as $image)
                                <li class="thumb {{ $image->main ? 'main' : '' }}" data-id="{{ $image->id }}">
                                    @php
                                        $fileExtension = pathinfo($image->image, PATHINFO_EXTENSION);
                                        $videoExtensions = ['mp4', 'webm', 'ogg', 'mov', 'avi', 'mkv'];
                                        $isVideo = in_array(strtolower($fileExtension), $videoExtensions);
                                    @endphp
                                    @if($isVideo)
                                        <a href="{{ asset('storage/' . $image->image) }}" class="thumbnail fancybox tooltips"
                                            rel="group">
                                            <video style="width: 180px; height: 180px; object-fit: cover;" controls>
                                                <source src="{{ asset('storage/' . $image->image) }}"
                                                    type="video/{{ $fileExtension }}">
                                                Your browser does not support the video tag.
                                            </video>
                                        </a>
                                    @else
                                        <a href="{{ asset('storage/' . $image->image) }}" class="thumbnail fancybox tooltips"
                                            rel="group">
                                            <img src="{{ asset('storage/' . $image->image) }}"
                                                style="width: 180px; height: 180px; object-fit: cover;">
                                        </a>
                                    @endif
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
    const dropZone = document.getElementById('dropZone');
    const uploadFile = document.getElementById('fileInput');

    let files = null; // shared variable

    /* Drag events */
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
        uploadImage();
    });

    /* Select files */
    uploadFile.addEventListener('change', e => {
        files = e.target.files;
        uploadImage();
    });

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
    const routeCreateImage = "{{ route('createImage', ['id' => (request()->route('slug') ?? '')]) }}";
</script>
<script>
    const fileInput = document.getElementById('file');
    const mediaList = document.getElementById('media_list');
    const mainInput = document.getElementById('main_image_input');

    let storedFiles = new DataTransfer();
    let imageToDelete = null; // modal uchun
    let deleteImageId = null;
    /* ================== SET MAIN IMAGE ================== */
    function attachThumbEvents(li) {
        li.querySelector('.ajax_set_main')?.addEventListener('click', function (e) {
            e.preventDefault();

            mediaList.querySelectorAll('.thumb').forEach(t => t.classList.remove('main'));
            mediaList.querySelectorAll('.ajax_set_main').forEach(btn => btn.classList.remove('btn-info'));

            li.classList.add('main');
            this.classList.add('btn-info');

            mainInput.value = li.dataset.name || li.dataset.id;
        });
    }

    /* ================== DELETE (ONLY MODAL) ================== */
    function attachDeleteEvent(li) {
        li.querySelector('.btn-delete')?.addEventListener('click', function (e) {
            e.preventDefault();
            imageToDelete = li;
            $('#deleteImageModal').modal('show');
        });
    }

    /* ================== CONFIRM DELETE ================== */

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
    });



    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('#media_list .thumb').forEach(li => {
            attachThumbEvents(li);
            attachDeleteEvent(li);
        });
    });
 const filepart = document.getElementById('file');
const media = document.getElementById('media_list');

filepart.addEventListener('change', function (event) {

    [...event.target.files].forEach(file => {

        // 1. PREVIEW (darhol ko‘rinadi)
        const li = document.createElement('li');
        li.className = 'thumb uploading';

        const reader = new FileReader();
        reader.onload = function (e) {

            const isVideo = file.type.startsWith('video/');
            const preview = isVideo
                ? `<video src="${e.target.result}" width="180" height="180" controls></video>`
                : `<img src="${e.target.result}" width="180" height="180">`;

            li.innerHTML = `
                <a class="thumbnail">${preview}</a>
                <div class="toolbar">
                   <div class="btn-group">
                      <a class="btn btn-mini move ui-sortable-handle center" href="#" title="Перемещать">
                            <i class="fa fa-arrows"></i>
                        </a>
                        <a class="btn btn-mini ajax_set_main"><i class="fa fa-arrow-up"></i></a>
                        <a class="btn btn-mini btn-delete ajax_delete"><i class="fa fa-trash-o"></i></a>
                    </div>
                </div>
            `;

            media.appendChild(li);
        };
        reader.readAsDataURL(file);

        // 2. DARHOL SERVERGA SAVE
        const formData = new FormData();
       
formData.append('files[]', file);  // request rules da files[] ishlatiladi
formData.append('_token', document.querySelector('meta[name="csrf-token"]').content);
fetch(routeCreateImage, {
    method: 'POST',
    body: formData,
    credentials: 'same-origin',
})
.then(res => res.json())
        .then(data => {
             
            if (!data.status) {
                li.remove();
                alert('Upload xato');
                return;
            }

            // 3. TEMP → REAL
            li.classList.remove('uploading');
            li.dataset.id = data.id;

            const mediaTag = data.type === 'video'
                ? `<video src="${data.url}" width="180" height="180" controls></video>`
                : `<img src="${data.url}" width="180" height="180">`;

            li.innerHTML = `
                <a class="thumbnail fancybox" href="${data.url}">
                    ${mediaTag}
                </a>
                <div class="toolbar">
                    <div class="btn-group">
                      <a class="btn btn-mini move ui-sortable-handle center" href="#" title="Перемещать">
                            <i class="fa fa-arrows"></i>
                        </a>
                        <a class="btn btn-mini ajax_set_main"><i class="fa fa-arrow-up"></i></a>
                        <a class="btn btn-mini btn-delete ajax_delete"><i class="fa fa-trash-o"></i></a>
                    </div>
                </div>
            `;

            attachThumbEvents(li);
            attachDeleteEvent(li);
        })
        .catch(() => {
            li.remove();
            alert('Server bilan aloqa yo‘q');
        });
    });

    fileInput.value = '';
});

 </script>

<div class="modal fade" id="deleteImageModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content small">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title">Подтвердить удаление</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <p class="mb-0">Вы уверены, что хотите удалить выбранные изображения?</p>
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
@section('script')
    <script>
        let buttonId;
        $(document).on('click', '.btn-delete', function (e) {
            e.preventDefault();

            imageToDelete = this.closest('li');
            deleteImageId = imageToDelete.dataset.id;
            $('#deleteImageModal').modal('show');

        });
    </script>
@endsection