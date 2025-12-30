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
                            <h2 class="content-header-title float-left mb-0">Добавить / Редактирование</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="{{ route('admin.index') }}">Главная</a></li>
                                    <li class="breadcrumb-item"><a href="{{ route('admin.menu_main.index') }}">Menu</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="#" onclick="history.go(-1)">Назад</a></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-body">
                @include('admin.components.error')

                @php $isEdit = isset($menu); @endphp
                <input type="hidden" id="deleteRoute"  value="{{request()->root()}}">
                <section class="langs-edit">
                    <form
                        action="{{ $isEdit ? route('admin.menu_main.update', ['id'=>$menu->id]) : route('admin.menu_main.store') }}"
                        method="POST" enctype="multipart/form-data">
                        @csrf
                        @if($isEdit)
                            @method('PUT')
                        @endif

                        <div class="row">
                            <div class="col-12 mt-3">
                                <ul class="nav nav-tabs mb-2" role="tablist">
                                    @foreach($languages as $k => $language)
                                        <li class="nav-item fx align-items-center">
                                            <a class="nav-link {{ $k == 0 ? 'active' : '' }}" data-toggle="tab"
                                               href="#lang{{ $language->code }}">
                                                <img src="{{ asset('assets/'.$language->flag_icon) }}"
                                                     class="size_small" alt="flag">
                                                {{ $language->name }}
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>

                                <div class="tab-content">
                                    @foreach($languages as $k => $language)
                                        <div class="tab-pane {{ $k == 0 ? 'active' : '' }}"
                                             id="lang{{ $language->code }}">
                                          @foreach($settings as $setting)
                                                @if($setting->is_translatable)
                                                    @php
                                                        $translation = $isEdit ? $menu->translations->firstWhere('locale', $language->code) : null;
                                                        $data = $translation ? json_decode($translation->data, true) : [];
                                                        $value = old('fields.' . $language->code . '.' . $setting->key, $data[$setting->key] ?? '');
                                                    @endphp
                                                    <div class="form-group">

                                                        <label>{{ $setting->label }} ({{ $language->code }})</label>
                                                       @if($setting->type=='textarea' || $setting->type=='textarea-editor')
                                        <textarea class="form-control {{$setting->type=='textarea-editor'? 'summernote' : ''}}"
                                            name="fields[{{ $language->code }}][{{ $setting->key }}]">{{ $value }}</textarea>
                                        @else
                                                            @php $type = $setting->type=='text'? 'text' : 'number' @endphp
                                                            <input
                                                                type="{{$type}}"
                                                                class="form-control"
                                                                name="fields[{{ $language->code }}][{{ $setting->key }}]"
                                                                value="{{ $value }}"
                                                            >
                                                        @endif
                                                    </div>
                                                @endif
                                            @endforeach

                                        </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="col-12">
                                <hr>
                               @foreach($settings as $setting)
                                    @if(!$setting->is_translatable)
                                        @php
                                            $value2 = old('fields.' . $setting->key, $isEdit ? ($nonTranslatableData[$setting->key] ?? '') : '');

                                        @endphp
                                        <div class="form-group">
                                            <label>{{ $setting->label }}</label>
                                                                          @if($setting->type=='textarea' || $setting->type=='textarea-editor')
                                <textarea class="form-control {{$setting->type=='textarea-editor'? 'summernote' : ''}}"
                                    name="fields[{{ $setting->key }}]">{{ $value2 }}</textarea>
                                           @else

                                                @php $type = $setting->type=='text'? 'text' : 'number' @endphp
                                                <input
                                                    type="{{$type}}"
                                                    class="form-control"
                                                    name="fields[{{ $setting->key }}]"
                                                    value="{{$value2 }}"
                                                >
                                            @endif

                                        </div>
                                    @endif
                                @endforeach


                            </div>

                            <!-- Submit button -->


                        </div>

                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Категория</label>
                                            <select name="parent_id" class="form-control">
                                                <option value="">Выбрать категорию</option>

                                                @foreach($menus as $parent)
                                                    <option
                                                        value="{{ $parent->id }}" {{ old('parent_id', $menu->parent_id ?? '') == $parent->id ? 'selected' : '' }}>
                                                        {{ $parent->slug }}
                                                    </option>

                                                @endforeach

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Type</label>
                                            <select name="type" class="form-control" id="menu-type" required>
                                                @foreach(['page','category','section','url'] as $type)
                                                    <option
                                                        value="{{ $type }}" {{ old('type', $menu->type ?? '') == $type ? 'selected' : '' }}>{{ ucfirst($type) }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-12" id="menu-slug">
                                        <div class="form-group">
                                            <label>Slug</label>
                                            <input type="text" name="slug" class="form-control slug"
                                                   value="{{ old('slug', $menu->slug ?? '') }}">
                                        </div>
                                    </div>
                                    <div class="col-12" id="menu-url">
                                        <div class="form-group">
                                            <label>URL</label>
                                            <input type="text" name="url" class="form-control"
                                                   value="{{ old('url', $menu->url ?? '') }}">
                                        </div>
                                    </div>



                                    <div class="col-12 mb-1">
                                        <div class="form-group">
                                            <label>Icon</label>
                                            <input type="text" name="icon" class="form-control"
                                                   value="{{ old('icon', $menu->icon ?? '') }}">
                                        </div>

                                    </div>
                                    <div class="col-12 mb-1">

                                        <a href="#myModal" role="button" class="btn btn-info waves-effect waves-light" data-toggle="modal"><i class="feather icon-image"></i> Фото</a>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-check">
                                            <div class="custom-control custom-switch  mb-1">
                                                <p class="mb-0">Test</p>
                                                <input type="checkbox" class="custom-control-input"
                                                       name="test"
                                                       {{ old('test', isset($menu) ? $menu->test : false) ? 'checked' : '' }}
                                                       id="customSwitchTest">
                                                <label class="custom-control-label"
                                                       for="customSwitchTest"></label>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-check">
                                            <div class="custom-control custom-switch  mb-1">
                                                <p class="mb-0">Show Admin</p>
                                                <input type="checkbox" class="custom-control-input"
                                                       name="show_admin"
                                                       {{ old('show_admin', $menu->show_admin ?? true) ? 'checked' : '' }}
                                                       id="customSwitchShowAdmin">
                                                <label class="custom-control-label"
                                                       for="customSwitchShowAdmin"></label>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-check">
                                            <div class="custom-control custom-switch custom-switch-success mb-1">
                                                <p class="mb-0">Status</p>
                                                <input type="checkbox" class="custom-control-input"
                                                       name="status"
                                                       {{ old('status', $menu->status ?? true) ? 'checked' : '' }}
                                                       id="customSwitchStatus">
                                                <label class="custom-control-label"
                                                       for="customSwitchStatus"></label>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-12 d-flex flex-sm-row flex-column justify-content-end ">
                                <button type="submit" class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">
                                    {{ $isEdit ? 'Update' : 'Save' }}
                                </button>
                            </div>
                        </div>
                        <input type="file" style="display: none" multiple name="images[]">
                        <input type="hidden" multiple name="main_image">
                        <input type="hidden" id="delete-route" value="{{ route('admin.menu_main.imageDelete') }}">
                         <input type="hidden" id="slug" value="menu">
                        @include('admin.components.modal')
                    </form>
                </section>
            </div>
        </div>
    </div>


    @section('script')
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const firstInput = document.querySelector('.tab-content input');

            const slugInput = document.querySelector('#menu-slug input');
            if (firstInput && slugInput) {
                firstInput.addEventListener('input', function () {
                    let value = firstInput.value;
                    value = value.replace(/\s+/g, '-');
                    value = value.replace(/[^a-zA-Z0-9_?#]/g, '-').toLowerCase();

                    const typeSelect = document.getElementById('menu-type');

                    if(typeSelect.value==='page'){
                        slugInput.value = value;
                    }else{
                        slugInput.value = '';
                    }
                });
            }
        });
        document.addEventListener('input', function (e) {
            if (e.target.classList.contains('slug')) {
                e.target.value = e.target.value
                    .replace(/\s+/g, '_')
                    .replace(/[^a-zA-Z0-9_?#]/g, '_');

            }


        });
        document.addEventListener('DOMContentLoaded', function () {
            const typeSelect = document.getElementById('menu-type');
            const slugInput = document.getElementById('menu-slug');
            const urlInput = document.getElementById('menu-url');

            function toggleFields() {
                const type = typeSelect.value;

                if(type === 'category' || type ==='section') {
                    slugInput.style.display = 'none';
                    urlInput.style.display = 'none';
                } else if(type === 'page') {
                    slugInput.style.display = 'block';
                    urlInput.style.display = 'none';
                } else if(type === 'url') {
                    slugInput.style.display = 'none';
                    urlInput.style.display = 'block';
                }
            }

            typeSelect.addEventListener('change', toggleFields);

            // Call on page load
            toggleFields();
        });
    </script>
    @endsection
@endsection
