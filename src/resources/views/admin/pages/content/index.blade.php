@extends('admin.layouts.layouts')

@section('body')

<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-5 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Ro'yhat
                        </h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{route('admin.index')}}">Uy</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <form method="GET">
                    <div class="input-group">
                        <input type="text" class="form-control round" placeholder="Поиск" name="s" value="{{request()->s}}">
                        <button class="btn btn-primary" type="submit">
                            <i class="feather icon-search"></i>
                        </button>
                    </div>
                </form>
            </div>
{{--            <div class="col-5"></div>--}}

{{--            <div class="col-7">--}}
{{--                @include('admin.components.perPage')--}}
{{--            </div>--}}

            <div class="content-header-right text-md-right col-md-3 d-md-block">

                <div class="form-group breadcrum-right ">

                    <a href="{{route('admin.content.create', ['category' => request()->route('category')])}}"
                        class="btn btn-primary pull-right waves-effect waves-light" type="button">
                        <i class="feather icon-plus icon-white"></i>
                        <span>Qo'shish</span>
                    </a>
                    <a href="{{route('admin.content.settings', ['category' => request()->route('category')])}}"
                        class="btn btn-primary pull-right waves-effect waves-light mr-2" type="button">
                        <i class="feather icon-settings  icon-white"></i>
                        <span>Sozlamalar</span>
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
                            <th scope="col">Nomi</th>
                            @if(request()->route('category') == 'list')
                            <th scope="col">Kalit</th>
                            @endif
                            <th scope="col" class="action-col"></th>
                        </tr>
                    </thead>
                    <tbody id="sortable">
                        @foreach($contents as $content)
                        <tr data-id="{{ $content->id }}">
                            <td>
                                {{ sectionValue($content, 'title') }}
                            </td>

                            @if(request()->route('category') == 'list')
                            <td>
                                <code>{{ sectionValue($content, 'key') }}</code>
                            </td>
                            @endif

                            <td class="fx align-items-center">
                                <a href="{{ route('admin.content.edit', ['id' => $content->id, 'category' => request()->route('category')]) }}"
                                    class="btn btn-small btn-info mr-1">
                                    <i class="feather icon-edit icon-white"></i>
                                </a>

                                <div class="custom-control custom-switch custom-control-inline">
                                    <input type="checkbox" name="status" class="custom-control-input lang-status-switch"
                                        id="customSwitch{{ $content->id }}" data-id="{{ $content->id }}"
                                        @checked($content->status)>
                                    <label class="custom-control-label" for="customSwitch{{ $content->id }}"></label>
                                </div>

                                <a href="#" class="btn btn-small btn-danger ml-2 delete-btn"
                                    data-id="{{ $content->id }}"
                                    data-url="{{ route('admin.content.delete', [$content->id, 'category' => request()->route('category')]) }}">
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
<script>
    document.querySelectorAll('.lang-status-switch').forEach(el => {
        el.addEventListener('change', function () {
            const id = this.dataset.id;
            const status = this.checked ? 1 : 0;

            fetch(`/admin/update-status/${id}`, {
                method: 'POST',
                credentials: 'same-origin',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({ status })
            });
        });
    });

</script>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <form id="deleteForm" method="POST">
            @csrf
            @method('DELETE')

            <div class="modal-content small">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">O'chirishni tasdiqlang</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        ×
                    </button>
                </div>

                <div class="modal-body">
                    Haqiqatan ham ushbu bo'limni o'chirmoqchimisiz?
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Orqaga</button>

                    <button type="submit" class="btn btn-danger">
                        O'chirish
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