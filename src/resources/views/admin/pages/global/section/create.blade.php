@extends('admin.layouts.layouts')

@section('body')

<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper ">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 ">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Добавить / Изменить</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.index') }}">Главная</a></li>
                                <li class="breadcrumb-item"><a href="{{route('admin.pages.section.index',['slug'=>$slug,'id'=>$id])}}">Раздел</a>
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
                        <div class="col-12 mt-1">
                            <ul class="nav nav-tabs " role="tablist">
                                @foreach($languages as $k => $language)
                                <li class="nav-item fx align-items-center">
                                    <a class="nav-link {{ $k == 0 ? 'active' : '' }}" data-toggle="tab"
                                        href="#lang{{ $language->code }}">
                                        <img src="{{ sectionImages($language, true) }}"
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

                                    <a href="#myModal" role="button" class="btn btn-info waves-effect waves-light" data-toggle="modal"><i class="feather icon-image"></i> Rasm</a>
                                </div>

                                @php
                                    date_default_timezone_set('Asia/Tashkent');
                                @endphp


                                <div class="col-12 mb-1 {{!in_array($id, $settingValues)? 'd-none' : ''}}">
                                    <label for="">Дата</label>
                                    <input
                                        type="text"
                                        class="form-control pickadate"
                                        name="publish_at"
                                        value="{{ old(
                                    'publish_at',
                                    isset($section->publish_at)
                                        ? \Carbon\Carbon::parse($section->publish_at)->format('Y-m-d')
                                        : now()->format('Y-m-d')
                                ) }}">
                                </div>
                                <div class="col-12 mb-1">
                                    <label for="">Alias</label>
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
                                            <p class="mb-0">Статус</p>
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
                        <div class="col-6 d-flex justify-content-start align-items-center gap-2">


                            <button type="button"
                                    class="btn btn-secondary px-4"
                                    onclick="history.back()">
                                Назад
                            </button>

                        </div>
                        <div class="col-6 d-flex justify-content-end align-items-center gap-2">

                            <button type="submit"
                                    class="btn btn-primary px-4 mr-1">
                                Сохранить
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
