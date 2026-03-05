@extends('admin.layouts.layouts')

@section('body')

    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">Добавить / Изменить</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="{{route('admin.index')}}">Домой</a>
                                    </li>
                                    <li class="breadcrumb-item"><a
                                            href="{{route('admin.pages.section.index',['slug'=>$slug,'id'=>$menu->id])}}">Раздел</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#" onclick="history.go(-1)"> Назад</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                @include('admin.components.error')
                <section class="langs-edit">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <ul class="nav nav-tabs  " role="tablist">

                                    <li class="nav-item ">
                                        <a class="nav-link d-flex align-items-center active" id="account-tab"
                                           data-toggle="tab" href="#account" aria-controls="account" role="tab"
                                           aria-selected="true">
                                            <i class="feather icon-user "></i><span class="d-none d-sm-block"> Раздел настройки</span>
                                        </a>
                                    </li>


                                </ul>

                                @if($parent_id && count($fields)>0)

                                    <div class="row">
                                        <div class="col-12 text-right"><a
                                                href="{{route('admin.pages.section.create', ['slug'=>$slug,'id'=>$menu->id, 'parent_id'=>$parent_id,'category_slug'=>$fields[0]->category_slug])}}"
                                                class="btn bg-gradient-success">Создать Под секции</a></div>
                                    </div>
                                @endif
                                <div class=" ">

                                    @php
                                        $params = ['slug' => $slug, 'id' => $menu->id];
                                        if ($parent_id ) {
                                            $params['parent_id'] = $parent_id;
                                        }
                                        if($category_slug){
                                            $params['category_slug'] = $category_slug;
                                        }
                                    @endphp
                                    <form action="{{ route('admin.pages.section.settings.store', $params) }}"
                                          method="post">
                                        @csrf
                                        @if($parent_id)
                                        <div class="row mb-3">
                                            <div class="col-12">
                                                <label for="category">Категория</label>
                                                <input type="text" name="category" required id="category" placeholder="Категория" value="{{count($fields)>0? $fields[0]->category: ''}}" class="form-control">
                                            </div>
                                        </div>
                                        @endif

                                        <div id="fields-wrapper">


                                            @foreach($fields as $index => $f)

                                                <div class="card field-item">
                                                    <div class="d-flex justify-content-between">
                                                        <h5>Field #{{ $index }}</h5>
                                                        <button type="button"
                                                                class="btn btn-danger btn-sm remove-field" data-id="{{$f->id}}">X
                                                        </button>
                                                    </div>
                                                    <input type="hidden" name="fields[{{ $index }}][id]"
                                                           value="{{ $f->id }}">

                                                    <div class="row">
                                                        <div class="col-md-12 mb-2">
                                                            <label>Key</label>
                                                            <input type="text" name="fields[{{ $index }}][key]"
                                                                   class="form-control" value="{{ $f->key }}">
                                                        </div>
                                                        <div class="col-md-12 mb-2">
                                                            <label>Label</label>
                                                            <input type="text" name="fields[{{ $index }}][label]"
                                                                   class="form-control" value="{{ $f->label }}">
                                                        </div>
                                                        <div class="col-md-12 mb-2">
                                                            <label>Type</label>
                                                            <select name="fields[{{ $index }}][type]"
                                                                    class="form-control">
                                                                <option
                                                                    value="text" {{ $f->type=='text'?'selected':'' }}>
                                                                    Text
                                                                </option>
                                                                <option
                                                                    value="textarea" {{ $f->type=='textarea'?'selected':'' }}>
                                                                    Textarea
                                                                </option>
                                                                  <option
                                                                    value="textarea-editor" {{ $f->type=='textarea-editor'?'selected':'' }}>
                                                                    Textarea Editor
                                                                </option>
                                                                 <option
                                                                    value="datetime-local" {{ $f->type=='datetime-local'?'selected':'' }}>
                                                                    Date-time
                                                                </option>
                                                                <option
                                                                    value="select" {{ $f->type=='select'?'selected':'' }}>
                                                                    Select-Option
                                                                </option>
                                                                <option
                                                                    value="relation" {{ $f->type=='relation'?'selected':'' }}>
                                                                    Relation
                                                                </option>

                                                            </select>
                                                        </div>
                                                    </div>


                                                    <div class="row">
                                                        <div class="col-md-3 mb-2">
                                                            <div class="custom-control custom-switch mr-2 mb-1">
                                                                <p class="mb-0">Обязательность</p>
                                                                <input type="checkbox" class="custom-control-input"
                                                                       name="fields[{{ $index }}][required]"
                                                                       {{ $f->required?'checked':'' }} id="customSwitch2{{$index}}">
                                                                <label class="custom-control-label"
                                                                       for="customSwitch2{{$index}}"></label>
                                                            </div>

                                                        </div>
                                                        <div class="col-md-3 mb-2">
                                                            <div class="custom-control custom-switch mr-2 mb-1">
                                                                <p class="mb-0">Переводимый</p>
                                                                <input type="checkbox" class="custom-control-input"
                                                                       name="fields[{{ $index }}][is_translatable]" @if($f->type=='relation') disabled @endif
                                                                       {{ $f->is_translatable?'checked':'' }} id="customSwitch{{$index}}">
                                                                <label class="custom-control-label"
                                                                       for="customSwitch{{$index}}"></label>
                                                            </div>


                                                        </div>
                                                        <div class="col-md-12 mb-2">
                                                            <label>Sort Order</label>
                                                            <input type="number" name="fields[{{ $index }}][sort]"
                                                                   class="form-control" value="{{ $f->sort_order }}">
                                                        </div>
                                                        <div class="col-md-12 mb-2">
                                                            <label>Options (comma separated)</label>
                                                            <input type="text" name="fields[{{ $index }}][options]"
                                                                   class="form-control"
                                                                   value="{{ $f->options ? implode(',', json_decode($f->options, true)) : '' }}">
                                                        </div>
                                                        <div class="col-md-12 mb-2 relation-extra"
                                                             style="{{ $f->type == 'relation' ? '' : 'display:none;' }}">

                                                            <label>Relation Type</label>

                                                            <div>
                                                                <label>
                                                                    <input type="radio"
                                                                           name="fields[{{ $index }}][relation_table_name]"
                                                                           value="menu"
                                                                           class="relation-radio"
                                                                            {{ $f->relation_table_name == 'menu' ? 'checked' : '' }}>
                                                                    Menu
                                                                </label>

                                                                <label class="ml-3">
                                                                    <input type="radio"
                                                                           name="fields[{{ $index }}][relation_table_name]"
                                                                           value="content"
                                                                           class="relation-radio"
                                                                            {{ $f->relation_table_name == 'content' ? 'checked' : '' }}>
                                                                    Content
                                                                </label>
                                                            </div>

                                                            <div class="mt-1">
                                                                <label>Select Item</label>
                                                                <select name="fields[{{ $index }}][relation]"
                                                                        class="form-control relation-select"
                                                                        data-selected="{{ $f->relation }}">
                                                                </select>
                                                            </div>

                                                            <div class="mt-1">
                                                                <label>
                                                                    <input type="radio"
                                                                           name="fields[{{ $index }}][selection_type]"
                                                                           value="single"
                                                                            {{ $f->selection_type == 'single' ? 'checked' : '' }}>
                                                                    Single
                                                                </label>

                                                                <label class="ml-3">
                                                                    <input type="radio"
                                                                           name="fields[{{ $index }}][selection_type]"
                                                                           value="multiple"
                                                                            {{ $f->selection_type == 'multiple' ? 'checked' : '' }}>
                                                                    Multiple
                                                                </label>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center mt-3">
                                                <button type="button" class="btn btn-primary rounded mb-3"
                                                        id="add-field"><i class="feather icon-plus  icon-white"></i>
                                                </button>
                                                <button class="btn btn-success">Сохранить</button>
                                        </div>


                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>
                <!-- lang edit ends -->
            </div>

        </div>
    </div>
    <template id="setting-template">
        @include('admin.pages.menus.main.components.menu-setting-field')
    </template>

    <script>
        document.addEventListener('input', function (e) {
            if (e.target.classList.contains('keys')) {
                // Replace spaces and non-alphanumeric characters with _
                e.target.value = e.target.value.replace(/[^a-zA-Z0-9]/g, '_');
            }
        });
        let index = {{ count($fields) }};

        document.getElementById('add-field').addEventListener('click', function () {
            let template = document.getElementById('setting-template').innerHTML;

            // Replace placeholders
            let html = template.replace(/__INDEX__/g, index);

            // Insert into wrapper
            document.getElementById('fields-wrapper').insertAdjacentHTML('beforeend', html);

            index++;
            document.addEventListener('input', function (e) {
                if (e.target.classList.contains('keys')) {
                    // Replace spaces and non-alphanumeric characters with _
                    e.target.value = e.target.value.replace(/[^a-zA-Z0-9]/g, '_');
                }
            });
        });

        // Remove field
        document.addEventListener('click', function (e) {
            if (e.target.classList.contains('remove-field')) {
                let id = e.target.dataset.id;
                e.target.closest('.field-item').remove();
                deleteSettingsItem(id, e.target.closest('.field-item'));

            }
        });


        function deleteSettingsItem(id, element) {
            const metaTag = document.querySelector('input[name="_token"]');
            const csrfToken = metaTag ? metaTag.value : '';
            let url = "{{ route('admindeleteSettings') }}/"+id;

            fetch(url, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': csrfToken
                }
            })
                .then(response => response.json())
                .then(data => {

                })
                .catch(() => {
                   // console.log(data)
                });
        }
    </script>


    <script>
        document.addEventListener('change', function (e) {

            // TYPE o‘zgarganda relation blockni ko‘rsatish
            if (e.target.name && e.target.name.includes('[type]')) {

                let fieldItem = e.target.closest('.field-item');
                let relationExtra = fieldItem.querySelector('.relation-extra');

                if (!relationExtra) return;

                if (e.target.value === 'relation') {
                    relationExtra.style.display = 'block';
                } else {
                    relationExtra.style.display = 'none';
                }
            }

            if (e.target.classList.contains('relation-radio')) {

                let type = e.target.value;
                let fieldItem = e.target.closest('.field-item');
                let select = fieldItem.querySelector('.relation-select');

                let currentId = "{{ $menu->id }}";
                let url = "{{ route('relation.data', ['type' => '__TYPE__']) }}";
                url = url.replace('__TYPE__', type);
                url += '?current_id=' + currentId;

                fetch(url)
                    .then(res => res.json())
                    .then(data => {

                        select.innerHTML = '';

                        data.forEach(item => {
                            let value = '';
                            let text  = '';
                            if (type === 'menu') {
                                value = item.slug;
                                text  = item.slug;
                            } else {
                                value = item.category ?? item.id ?? '';
                                text  = item.category ?? item.title ?? '';
                            }
                            if(text?.length > 1) {
                                select.innerHTML += `
                           <option value="${value}">
                               ${text}
                          </option>
                            `;
                            }

                        });

                    });
            }

        });
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {

            document.querySelectorAll('.relation-radio:checked').forEach(function (radio) {

                let fieldItem = radio.closest('.field-item');
                let select = fieldItem.querySelector('.relation-select');
                if (!select) return;

                let type = radio.value;
                let selectedValue = select.dataset.selected;

                let currentId = "{{ $menu->id }}";
                let url = "{{ route('relation.data', ['type' => '__TYPE__']) }}";
                url = url.replace('__TYPE__', type);
                url += '?current_id=' + currentId;

                fetch(url)
                    .then(res => res.json())
                    .then(data => {

                        select.innerHTML = '';

                        data.forEach(item => {
                            let value = '';
                            let text  = '';
                            if (type === 'menu') {
                                value = item.slug;
                                text  = item.slug;
                            } else {
                                value = item.category ?? item.id ?? '';
                                text  = item.category ?? item.title ?? '';
                            }
                            if(text?.length > 1) {
                                select.innerHTML += `
                           <option value="${value}">
                              ${text}
                           </option>
                                `;
                            }

                        });

                        if (selectedValue) {
                            select.value = selectedValue;
                        }

                    });

            });

        });
    </script>
@endsection
