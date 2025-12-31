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
                            <h2 class="content-header-title float-left mb-0">Forms</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="{{route('admin.index')}}">Главная</a>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="content-body">
                <div class="row" id="table-hover-animation">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">

                            </div>
                            <div class="card-content">
                                <div class="card-body">

                                    <div class="table-responsive">
                                        <table class="table table-hover-animation mb-0">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Data</th>

                                                    <th scope="col" class="action-col"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($supports as $support)
                                                    <tr>
                                                        <td>
                                                            @php
                                                                $data = $support->data;

                                                            @endphp
                                                            {{ isset($data['name']) ? $data['name'] : 'no name' }}
                                                        </td>
                                                        <td class="action-col">
                                                            <a href="{{route('admin.supports.show', $support)}}"
                                                                class="btn btn-small btn-info">
                                                                <i class="feather icon-eye icon-white"></i>
                                                            </a>
                                                            <a href="#" class="btn btn-small btn-danger ml-2 delete-btn"
                                                                data-id="{{ $support->id }}"
                                                                data-url="{{ route('admin.supports.delete', $support) }}">
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
                    </div>
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
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>

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
        $(document).on('click', '.delete-btn', function (e) {
            e.preventDefault();

            let url = $(this).data('url');

            $('#deleteForm').attr('action', url);
            $('#deleteModal').modal('show');
        });
    </script>

@endsection