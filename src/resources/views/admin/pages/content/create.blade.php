@extends('admin.layouts.layouts')

@section('body')
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-9 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="col-12">
                            <h2 class="content-header-title float-left mb-0">Qo'shish / O'zgartirish</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="{{ route('admin.index') }}">Uy</a></li>
                                    <li class="breadcrumb-item">
                                        <a href="{{ route('admin.content.index',['category' => request()->route('category')]) }}">Kontent</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-body">
                @include('admin.components.error')
                @php $isEdit = isset($content); @endphp

                <section class="langs-edit">
                    <form action="{{ $isEdit ? route('admin.content.update', ['id'=>$content->id,'category' => request()->route('category') ]) : route('admin.content.store', ['category' => request()->route('category')]) }}"
                          method="POST" enctype="multipart/form-data">
                        @csrf
                        @if($isEdit) @method('PUT') @endif

                        <div class="card">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <ul class="nav nav-tabs mb-2" role="tablist">
                                                @foreach($languages as $k => $language)
                                                    <li class="nav-item">
                                                        <a class="nav-link {{ $k == 0 ? 'active' : '' }}" data-toggle="tab" href="#lang{{ $language->code }}">
                                                            <img src="{{ sectionImages($language, true) }}" class="mr-50" style="width:20px" alt="flag">
                                                            {{ $language->name }}
                                                        </a>
                                                    </li>
                                                @endforeach
                                            </ul>

                                            <div class="tab-content">
                                                @foreach($languages as $k => $language)
                                                    <div class="tab-pane {{ $k == 0 ? 'active' : '' }}" id="lang{{ $language->code }}">
                                                        @foreach($settings as $setting)
                                                            @if($setting->is_translatable)
                                                                @php
                                                                    $translation = $isEdit ? $content->translations->firstWhere('locale', $language->code) : null;
                                                                    $data = $translation ? json_decode($translation->data, true) : [];
                                                                    $value = old('fields.' . $language->code . '.' . $setting->key, $data[$setting->key] ?? '');
                                                                @endphp
                                                                <div class="form-group">
                                                                    <label>{{ $setting->label }} ({{ $language->code }})</label>
                                                                    @if($setting->type=='textarea')
                                                                        <textarea class="form-control moxiecut" name="fields[{{ $language->code }}][{{ $setting->key }}]">{{ $value }}</textarea>
                                                                    @else
                                                                        <input type="{{ $setting->type == 'number' ? 'number' : 'text' }}"
                                                                               class="form-control {{ $setting->key == 'slug' ? 'slug' : '' }}"
                                                                               name="fields[{{ $language->code }}][{{ $setting->key }}]" value="{{ $value }}">
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
                                            @php
                                                $nonTranslatableData = [];
                                                if($isEdit) {
                                                    $nonTransData = $content->translations->where('locale', null)->first();
                                                    $nonTranslatableData = $nonTransData ? json_decode($nonTransData->data, true) : [];
                                                }
                                            @endphp

                                            @foreach($settings as $setting)
                                                @if(!$setting->is_translatable)
                                                    <div class="form-group">
                                                        <label>{{ $setting->label }}</label>
                                                        @php $value2 = old('fields.'.$setting->key, $nonTranslatableData[$setting->key] ?? ''); @endphp

                                                        @if($setting->type=='textarea')
                                                            <textarea class="form-control moxiecut" name="fields[{{ $setting->key }}]">{{ $value2 }}</textarea>
                                                        @else
                                                            <input type="{{ $setting->type == 'number' ? 'number' : 'text' }}" class="form-control" name="fields[{{ $setting->key }}]" value="{{ $value2 }}">
                                                        @endif
                                                    </div>
                                                @endif
                                            @endforeach
                                        </div>
                                    </div>

                                    <div class="row mt-2">
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-outline-primary mb-1" data-toggle="modal" data-target="#myModal">
                                                <i class="feather icon-image"></i> Rasm tanlash
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-switch custom-switch-info">
                                                <p class="mb-0">Admin ko'rinishi</p>
                                                <input type="checkbox" class="custom-control-input" name="show_admin" id="show_admin" {{ old('show_admin', $content->show_admin ?? true) ? 'checked' : '' }}>
                                                <label class="custom-control-label" for="show_admin"></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-switch custom-switch-success">
                                                <p class="mb-0">Status (Aktiv)</p>
                                                <input type="checkbox" class="custom-control-input" name="status" id="status" {{ old('status', $content->status ?? true) ? 'checked' : '' }}>
                                                <label class="custom-control-label" for="status"></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-12 d-flex justify-content-between">
                                            <button type="button" class="btn btn-outline-secondary" onclick="history.back()">Orqaga</button>
                                            <button type="submit" class="btn btn-primary px-3">{{ $isEdit ? 'Yangilash' : 'Saqlash' }}</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <input type="file" style="display: none" multiple name="images[]">
                        <input type="hidden" name="main_image">
                        @include('admin.components.modal')
                    </form>
                </section>
            </div>
        </div>
    </div>
@endsection
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

                if (typeSelect.value === 'page') {
                    slugInput.value = value;
                } else {
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

            if (type === 'category' || type === 'section') {
                slugInput.style.display = 'none';
                urlInput.style.display = 'none';
            } else if (type === 'page') {
                slugInput.style.display = 'block';
                urlInput.style.display = 'none';
            } else if (type === 'url') {
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