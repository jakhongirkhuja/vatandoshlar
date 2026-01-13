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
                                <li class="breadcrumb-item"><a href="{{route('admin.pages.section.index',['slug'=>$slug,'id'=>$id])}}">Секция</a>
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

            @php $isEdit = isset($section); @endphp
            <input type="hidden" id="deleteRoute" value="{{request()->root()}}">
            <section class="langs-edit">
                @php
                $params1 = $isEdit ? ['slug'=>$slug, 'id'=>$id,'section_id'=>$section->id] : null;
                $params2 = ['slug'=>$slug, 'id'=>$id];
                if ($parent_id && $category_slug) {
                $params1['parent_id'] = $parent_id;
                $params2['parent_id'] = $parent_id;
                $params1['category_slug'] = $category_slug;
                $params2['category_slug'] = $category_slug;
                }

                @endphp
                <form
                    action="{{ $isEdit ? route('admin.pages.section.update', $params1) : route('admin.pages.section.store',$params2) }}"
                    method="POST" enctype="multipart/form-data">
                    @csrf
                    @if($isEdit)
                    @method('PUT')
                    @endif

                    @if($parent_id && count($settings)>0)
                    <input type="hidden" name="category_name" value="{{$settings[0]->category}}">
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
                                    $translation = $isEdit ? $section->translations->firstWhere('locale', $language->code) : null;
                                    $data = $translation ? json_decode($translation->data, true) : [];
                                    $value = old('fields.' . $language->code . '.' . $setting->key, $data[$setting->key] ?? '');
                                    @endphp
                                    <div class="form-group">

                                        <label>{{ $setting->label }} ({{ $language->code }})</label>
                                         @if($setting->type=='textarea' || $setting->type=='textarea-editor')
                                        <textarea class="form-control {{$setting->type=='textarea-editor'? 'summernote' : ''}}"
                                        name="fields[{{ $language->code }}][{{ $setting->key }}]">{{ $value }}</textarea>
                                          @elseif($setting->type == 'datetime-local')
                                              <input type="datetime-local"
           class="form-control"
           name="fields[{{ $language->code }}][{{ $setting->key }}]"  value="2025-06-01T13:30">
                                        @else
                                        @php $type = $setting->type=='text'? 'text' : 'number' @endphp
                                        <input
                                            type="{{$type}}"
                                            class="form-control {{$setting->key=='title'? 'title' : ''}}"
                                            name="fields[{{ $language->code }}][{{ $setting->key }}]"
                                            value="{{ $value }}">
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
                            $nonTranslatableTranslations = $isEdit ? $section->translations->where('locale', null) : collect();
                            $nonTranslatableData = [];
                            foreach($nonTranslatableTranslations as $trans) {
                            if(!empty($trans->data)) {
                            $decoded = json_decode($trans->data, true) ?? [];
                            $nonTranslatableData = array_merge($nonTranslatableData, $decoded);
                            }
                            }
                            @endphp

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
                                     @elseif($setting->type == 'datetime-local')
                                              <input type="datetime-local"
           class="form-control"
           name="fields[{{ $setting->key }}]"  value="2025-06-01T13:30" >
                                   @else
                                @php $type = $setting->type=='text'? 'text' : 'number' @endphp
                                <input
                                    type="{{$type}}"
                                    class="form-control {{$setting->key=='title'? 'title' : ''}}"
                                    name="fields[{{ $setting->key }}]"
                                    value="{{$value2 }}">
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
                                {{-- <div class="col-12">--}}
                                {{-- <div class="form-group">--}}
                                {{-- <label>Категория</label>--}}
                                {{-- <select name="parent_id" class="form-control">--}}
                                {{-- <option value="">Выбрать категорию</option>--}}

                                {{-- @foreach($pageSections as $parent)--}}
                                {{-- <option--}}
                                {{-- value="{{ $parent->id }}" {{ old('parent_id', $section->parent_id ?? '') == $parent->id ? 'selected' : '' }}>--}}
                                {{-- {{ $parent->getTitle($parent->translations) }}--}}
                                {{-- </option>--}}

                                {{-- @endforeach--}}

                                {{-- </select>--}}
                                {{-- </div>--}}
                                {{-- </div>--}}






                                <div class="col-12 mb-1">

                                    <a href="#myModal" role="button" class="btn btn-info waves-effect waves-light" data-toggle="modal"><i class="feather icon-image"></i> Фото</a>
                                </div>


                                <div class="col-12 mb-1">
                                    <label for="">Время создания</label>
                                    <input
                                        type="datetime-local"
                                        class="form-control "
                                        name="publish_at"
                                        placeholder="Время создания"
                                        value="{{ old('publish_at', $section->publish_at ?? now()) }}">
                                </div>
                                <div class="col-12 mb-1">
                                    <label for="">Slug</label>
                                    <input
                                        type="text"
                                        class="form-control slug"
                                        name="slug"
                                        placeholder="slug"
                                        value="{{ old('slug', $section->slug ?? '') }}">
                                </div>

                                <div class="col-12">
                                    <div class="form-check">
                                        <div class="custom-control custom-switch custom-switch-success mr-2 mb-1">
                                            <p class="mb-0">Status</p>
                                            <input type="checkbox" class="custom-control-input"
                                                name="status"
                                                {{ old('status', $section->status ?? true) ? 'checked' : '' }}
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
                    <?php $menu = $isEdit ? $section : null ?>
                    <input type="hidden" id="delete-route" value="{{ route('admin.menu_main.imageDelete') }}">
                    <input type="hidden" id="slug" value="section">
                    @include('admin.components.modal')
                </form>
            </section>
        </div>
    </div>
</div>


<script>
    document.addEventListener('DOMContentLoaded', () => {
        const titleInput = document.querySelector('input.title');
        const slugInput = document.querySelector('input.slug');

        if (!titleInput || !slugInput) return;

        titleInput.addEventListener('input', e => {
            let slug = e.target.value
                .toLowerCase()
                .trim()
                .replace(/[\s\W-]+/g, '-') // spaces & non-words → -
                .replace(/^-+|-+$/g, ''); // trim - from start/end

            slugInput.value = slug;
        });
    });
    document.addEventListener('input', function(e) {
        if (e.target.classList.contains('slug')) {
            e.target.value = e.target.value
                .replace(/\s+/g, '-')
                .replace(/[^a-zA-Z0-9_?#]/g, '-');

        }


    });
</script>
@endsection
