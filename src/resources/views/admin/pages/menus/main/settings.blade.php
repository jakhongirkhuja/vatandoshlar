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
                                <li class="breadcrumb-item"><a href="{{route('admin.index')}}">Главная</a>
                                </li>
                                <li class="breadcrumb-item"><a href="{{route('admin.menu_main.index')}}">Меню</a>
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
                            <ul class="nav nav-tabs mb-3" role="tablist">

                                <li class="nav-item ">
                                    <a class="nav-link d-flex align-items-center active" id="account-tab"
                                        data-toggle="tab" href="#account" aria-controls="account" role="tab"
                                        aria-selected="true">
                                        <i class="feather icon-user mr-25"></i><span class="d-none d-sm-block">Menu sozlamalari</span>
                                    </a>
                                </li>


                            </ul>
                            <div class="container">

                                <form action="{{ route('admin.menu_main.settings.create') }}" method="post">
                                    @csrf


                                    <div id="fields-wrapper">


                                        @foreach($fields as $index => $f)

                                        <div class="card p-3 mb-3 field-item">
                                            <div class="d-flex justify-content-between">
                                                <h5>Field #{{ $index }}</h5>
                                                <button type="button"
                                                    class="btn btn-danger btn-sm remove-field">X
                                                </button>
                                            </div>
                                            <input type="hidden" name="fields[{{ $index }}][id]"
                                                value="{{ $f->id }}">

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <label>Key</label>
                                                    <input type="text" required name="fields[{{ $index }}][key]"
                                                        class="form-control" value="{{ $f->key }}">
                                                </div>
                                                <div class="col-md-12 mb-2">
                                                    <label>Label</label>
                                                    <input type="text" required name="fields[{{ $index }}][label]"
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
                                                        <option value="number" {{ $f->type=='number'?'selected':'' }}>Integer</option>
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
                                                            Select-Option
                                                        </option>

                                                    </select>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-3 mb-2">
                                                    <div class="custom-control custom-switch mr-2 mb-1">
                                                        <p class="mb-0">Обязательно</p>
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
                                                            name="fields[{{ $index }}][is_translatable]"
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
                                                <div class="col-md-12 mb-2">
                                                    <label>Relation (DB table name)</label>
                                                    <input type="text" name="fields[{{ $index }}][relation]" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        @endforeach
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <button type="button" class="btn btn-primary rounded mb-3"
                                                id="add-field"><i class="feather icon-plus  icon-white"></i>
                                            </button>
                                        </div>
                                        <div class="col">
                                            <button class="btn btn-success">Сохранить настройки</button>
                                        </div>
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
    document.addEventListener('input', function(e) {
        if (e.target.classList.contains('keys')) {
            // Replace spaces and non-alphanumeric characters with _
            e.target.value = e.target.value.replace(/[^a-zA-Z0-9]/g, '_');
        }
    });
    let index = <?= isset($fields) ? count($fields) : 0 ?>;

    document.getElementById('add-field').addEventListener('click', function() {
        let template = document.getElementById('setting-template').innerHTML;

        // Replace placeholders
        let html = template.replace(/__INDEX__/g, index);

        // Insert into wrapper
        document.getElementById('fields-wrapper').insertAdjacentHTML('beforeend', html);

        index++;
        document.addEventListener('input', function(e) {
            if (e.target.classList.contains('keys')) {
                // Replace spaces and non-alphanumeric characters with _
                e.target.value = e.target.value.replace(/[^a-zA-Z0-9]/g, '_');
            }
        });
    });

    // Remove field
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('remove-field')) {
            e.target.closest('.field-item').remove();
        }
    });
</script>
@endsection