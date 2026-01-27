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
                        <h2 class="content-header-title float-left mb-0">Социальные сети</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="{{ route('admin.index') }}">Главная</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-header-right text-md-right col-md-3 col-12 d-md-block">
                <div class="form-group breadcrum-right">
                    <a href="{{ route('social_links.create') }}"
                        class="btn btn-primary pull-right waves-effect waves-light">
                        <i class="icon-plus-sign icon-white"></i>
                        <span>Добавить</span>
                    </a>
                </div>
            </div>
        </div>

        <div class="content-body">

            @include('admin.components.error')

            <div class="row" id="table-hover-animation">
                <div class="col-12">
                    <div class="card">

                        <div class="card-content">
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-hover-animation mb-0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Название</th>
                                                <th class="text-right">Действия</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            @foreach($socialLinks as $link)
                                            <tr>
                                                <th>{{ $link->id }}</th>
                                                <td>{{ $link->name }}</td>

                                                {{-- ДЕЙСТВИЯ --}}
                                                <td class="text-right fx align-items-center justify-content-end">
                                                    {{-- EDIT --}}
                                                    <a href="{{ route('social_links.edit', $link) }}"
                                                        class="btn btn-small btn-info">
                                                        <i class="feather icon-edit icon-white"></i>
                                                    </a>

                                                    {{-- STATUS --}}
                                                    <div
                                                        class="custom-control custom-switch custom-control-inline mx-2  ">
                                                        <input type="checkbox" name="status"
                                                            class="custom-control-input lang-status-switch"
                                                            id="statusSwitch{{ $link->id }}" data-id="{{ $link->id }}"
                                                            @if($link->status) checked @endif>
                                                        <label class="custom-control-label"
                                                            for="statusSwitch{{ $link->id }}"></label>
                                                    </div>

                                                    {{-- DELETE --}}
                                                    <a href="#" class="btn btn-small btn-danger delete-btn"
                                                        data-url="{{ route('social_links.destroy', $link) }}">
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

{{-- DELETE MODAL --}}
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <form id="deleteForm" method="POST">
            @csrf
            @method('DELETE')

            <div class="modal-content small">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">Подтвердите удаление</h5>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>

                <div class="modal-body">
                    Вы действительно хотите удалить этот раздел?
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Назад</button>
                    <button type="submit" class="btn btn-danger">Удалить</button>
                </div>
            </div>
        </form>
    </div>
</div>

@endsection


@section('script')

<script>
    // DELETE MODAL
    $(document).on('click', '.delete-btn', function (e) {
        e.preventDefault();
        let url = $(this).data('url');
        $('#deleteForm').attr('action', url);
        $('#deleteModal').modal('show');
    });

    document.querySelectorAll('.lang-status-switch').forEach(el => {
        el.addEventListener('change', function () {

            const id = this.dataset.id;
            const status = this.checked ? 1 : 0;

            const url = "{{ route('social_links.update-status', ':id') }}".replace(':id', id);

            fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({ status: status })
            })
                .then(res => res.json())
                .then(data => {
                    if (!data.success) {
                        this.checked = !this.checked;
                    }
                })
                .catch(() => {
                    this.checked = !this.checked;
                });
        });
    });
</script>

@endsection