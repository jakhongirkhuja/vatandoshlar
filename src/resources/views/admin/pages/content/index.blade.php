@extends('admin.layouts.layouts')

@section('body')

<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-4 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Список
                        </h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{route('admin.index')}}">Главная</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content-header-right text-md-right col-md-8 col-12 d-md-block">

                <div class="form-group breadcrum-right ">

                    <a href="{{route('admin.content.create')}}"
                        class="btn btn-primary pull-right waves-effect waves-light" type="button">
                        <i class="feather icon-plus icon-white"></i>
                        <span>Добавить</span>
                    </a>
                    <a href="{{route('admin.content.settings')}}"
                        class="btn btn-primary pull-right waves-effect waves-light mr-2" type="button">
                        <i class="feather icon-settings  icon-white"></i>
                        <span>Настройки</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="content-body">
            @include('admin.components.error')
            <div class="row" id="table-hover-animation">
                <table class="table data-list-view dataTable">
                    <thead>
                        <tr>
                            <th scope="col">Title</th>
                            <th scope="col">Key</th>
                            <th scope="col" class="action-col"></th>
                        </tr>
                    </thead>
                    <tbody id="sortable">
                        @foreach($contents as $content)
                        <tr data-id="{{ $content->id }}">
                            <td>
                                {{ sectionValue($content, 'title') }}
                            </td>
                            <td>
                                <code>
                                    {{ sectionValue($content, 'key') }}
                                </code>
                            </td>
                            <td class="fx align-items-center">
                                <a href="{{ route('admin.content.edit', $content->id) }}" class="btn btn-small btn-info mr-1">
                                    <i class="feather icon-edit icon-white"></i>
                                </a>
                                <div class="custom-control custom-switch custom-control-inline">
                                    <input type="checkbox" name="status" class="custom-control-input lang-status-switch"
                                        id="customSwitch{{ $content->id }}" data-id="{{ $content->id }}"
                                        @if($content->status) checked @endif>
                                    <label class="custom-control-label" for="customSwitch{{ $content->id }}"></label>
                                </div>
                                <a href="#" class="btn btn-small btn-danger ml-2 delete-btn"
                                    data-id="{{ $content->id }}"
                                    data-url="{{ route('admin.content.delete', $content->id) }}">
                                    <i class="feather icon-trash icon-white"></i>
                                </a>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <form id="deleteForm" method="POST">
            @csrf
            @method('DELETE')

            <div class="modal-content small">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">Подтвердить удаление</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        ×
                    </button>
                </div>

                <div class="modal-body">
                    Вы уверены, что хотите удалить этот раздел?
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                        data-dismiss="modal">Отмена</button>

                    <button type="submit" class="btn btn-danger">
                        Удалить
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

@endsection
@section('script')
<script>
    $(document).on('click', '.delete-btn', function(e) {
        e.preventDefault();

        let url = $(this).data('url');

        $('#deleteForm').attr('action', url);
        $('#deleteModal').modal('show');
    });
</script>
@endsection