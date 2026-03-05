@extends('admin.layouts.layouts')

@section('body')
<style>
    .custom-checkbox .custom-control-label::before,
    .custom-checkbox .custom-control-label::after {
        width: 20px;
        height: 20px;
    }

    .delete-btn.disabled {
        pointer-events: none;
        opacity: 0.4;
        cursor: not-allowed;
    }
</style>
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-4 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">{{$menu->title}} {{$categoryName &&
                            $categoryName->category? '| '.$categoryName?->category : ''}}</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{route('admin.index')}}">Asosiy</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-header-right text-md-right col-md-8 col-12 d-md-block">

                <div class="form-group breadcrum-right ">
                    <div class="custom-control custom-switch custom-control-inline mr-3">
                        <span class="mr-1">Фото</span>
                        <input type="checkbox"
                            class="custom-control-input"
                            id="globalBlockSwitch"
                            {{ $globalActive ? 'checked' : '' }}>
                        <label class="custom-control-label" for="globalBlockSwitch"></label>
                    </div>
                    <form action="{{ route('admin.pages.section.bulkDelete') }}"
                        method="POST"
                        id="bulkDeleteForm"
                        class="d-inline-block mr-2">

                        @csrf
                        @method('POST')

                        <button class="btn btn-danger" id="bulkDeleteBtn" disabled type="button">
                            <i class="feather icon-trash icon-white"></i>
                            Belgilanganlarni o'chirish
                        </button>
                    </form>
                    @php
                    $parameters = ['slug'=>$slug,'id'=>$menu->id];
                    $parameters2= ['slug'=>$slug,'id'=>$menu->id];
                    if($parent_id && $category_slug){
                    $parameters['parent_id'] = $parent_id;
                    $parameters['category_slug'] = $category_slug;
                    $parameters2['parent_id'] = $parent_id;
                    $parameters2['category_slug']= $category_slug;
                    }
                    @endphp

                    <a href="{{route('admin.pages.section.create', $parameters)}}" class="btn btn-primary pull-right waves-effect waves-light" type="button">
                        <i class="feather icon-plus icon-white"></i>
                        <span>Qo'shish</span>
                    </a>
                    <a href="{{route('admin.pages.section.settings.create',$parameters2)}}" class="btn btn-outline-primary pull-right waves-effect waves-light mr-2" type="button">
                        <i class="feather icon-settings  icon-white"></i>
                        <span>Sozlamalar</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="content-body">
            @include('admin.components.error')
            <div class="row" id="table-hover-animation">
                <div class="col-5"></div>

                <div class="col-7">
                    @include('admin.components.perPage')
                </div>
                <table class="table data-list-view dataTable">
                    <thead>
                        <tr>
                            <th class="text-center" width="50">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="checkAll">
                                    <label class="custom-control-label" for="checkAll"></label>
                                </div>
                            </th>
                            <th scope="col" class="p-1 text-center">ID</th>
                            <th scope="col">Ro'yxat</th>
                            <th scope="col">Nomi</th>

                            <th scope="col" class="action-col"></th>
                        </tr>
                    </thead>
                    <tbody>

                        @foreach($sections as $section)
                        {{-- @dd($section->content)--}}
                        <tr role="row" class="odd">
                            <td class="text-center" width="50">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox"
                                        class="custom-control-input checkItem"
                                        id="checkItem{{ $section->id }}"
                                        name="ids[]"
                                        value="{{ $section->id }}"
                                        form="bulkDeleteForm">
                                    <label class="custom-control-label" for="checkItem{{ $section->id }}"></label>
                                </div>
                            </td>
                            <td class="p-1 text-center" width="60">
                                @include('admin.components.sort-form', ['menu' => $section,'route' =>
                                route('admin.pages.section.update-sort', ['slug'=>$slug,'id' =>
                                $id,'section_id'=>$section->id])])
                            </td>
                            <td width="100">
                                @if(request()->route('category_slug')!='form')
                                @foreach($grouped as $categoryName=>$group)

                                <a href="{{route('admin.pages.section.index', ['slug'=>$slug,'id'=>$menu->id, 'parent_id'=>$section->id, 'category_slug'=>$group->first()->category_slug])}}" class="btn btn-primary" data-toggle="tooltip" data-placement="top"
                                    title data-original-title="Kichik kategoriya">{{$categoryName}}</a>

                                @endforeach
                                @endif
                                <a href="{{route('admin.pages.section.settings.create', ['slug'=>$slug,'id'=>$menu->id, 'parent_id'=>$section->id])}}" style="display:none" class="btn btn-secondary" data-toggle="tooltip"
                                    data-placement="top" title data-original-title="Kichik kategoriya yaratish"><i class="feather icon-plus icon-white"></i></a>
                                {{-- <i class="feather icon-copy copy-btn"--}}
                                {{-- style="cursor:pointer; font-size:18px; margin-left:5px;"--}}
                                {{-- data-id="{{$section->id}}"--}}
                                {{-- title="Duplicate Category" data-toggle="tooltip"--}}
                                {{-- data-placement="top" data-original-title="Duplicate Category"></i>--}}
                                {{-- <form method="POST"--}}
                                {{-- action="{{route('admin.pages.section.duplicateSectionCategory', ['slug'=>$slug,'id'=>$menu->id, 'section_id'=>$section->id])}}"--}}
                                {{-- id="copy-form-{{$section->id}}"--}}
                                {{-- style="display:none; margin-top:10px;">--}}

                                {{-- @csrf--}}

                                {{-- <input type="hidden" name="source_section_id" value="{{$section->id}}">--}}

                                {{-- <select name="target_section_id" class="form-control" required>--}}
                                {{-- @foreach($sections as $sec)--}}
                                {{-- @if($sec->id != $section->id)--}}
                                {{-- <option value="{{$sec->id}}">--}}
                                {{-- {{ sectionValue($sec,'title') }}--}}
                                {{-- </option>--}}
                                {{-- @endif--}}
                                {{-- @endforeach--}}
                                {{-- </select>--}}

                                {{-- <button type="submit" class="btn btn-success mt-1">--}}
                                {{-- Dublicate--}}
                                {{-- </button>--}}

                                {{-- </form>--}}
                            </td>
                            <td>
                                {{ \Illuminate\Support\Str::limit($section->getTitle($section->translations), 40) }}
                            </td>



                            <td class="fx align-items-center">
                                @php
                                $parameters = ['slug'=>$slug,'id'=>$id , 'section_id'=>$section->id,];

                                if($parent_id && $category_slug){
                                $parameters['parent_id'] = $parent_id;
                                $parameters['category_slug'] = $category_slug;

                                }
                                @endphp
                                <a href="{{ route('admin.pages.section.edit',$parameters) }}" class="btn btn-small btn-info btn-edit">
                                    <i class="feather icon-edit icon-white"></i>
                                </a>
                                <div class="custom-control custom-switch custom-control-inline  mx-2">
                                    <input type="checkbox" name="status" class="custom-control-input lang-status-switch" id="customSwitch{{ $section->id }}" data-id="{{ $section->id }}" @if($section->status) checked @endif
                                    >
                                    <label class="custom-control-label" for="customSwitch{{ $section->id }}"></label>
                                </div>
                                <a href="#" class="btn btn-small btn-danger delete-btn" data-id="{{ $section->id }}" data-url="{{ route('pages.delete',$section->id) }}">
                                    <i class="feather icon-trash icon-white"></i>
                                </a>

                            </td>
                        </tr>
                        @endforeach



                    </tbody>
                </table>
                {{ $sections->withQueryString()->links('pagination::bootstrap-5') }}
            </div>

        </div>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {

        document.querySelectorAll(".copy-btn").forEach(function(btn) {

            btn.addEventListener("click", function() {

                let id = this.getAttribute("data-id");
                let form = document.getElementById("copy-form-" + id);

                if (form.style.display === "none") {
                    form.style.display = "block";
                } else {
                    form.style.display = "none";
                }

            });

        });

    });
    document.querySelectorAll('.lang-status-switch').forEach(el => {
        el.addEventListener('change', function() {

            const id = this.dataset.id;
            const status = this.checked ? 1 : 0;

            const urlStatus = "{{ route('update-status',['section_id'=>':id']) }}".replace(':id', id);
            console.log(urlStatus);
            fetch(urlStatus, {
                    method: 'GET',
                    credentials: 'same-origin',
                    headers: {
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                    }
                })
                .then(res => res.json())
                .then(data => {
                    console.log('Updated:', data);
                })
                .catch(err => console.error(err));
        });
    });
</script>

<!-- Delete Modal -->
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

                    <button type="submit" class="btn btn-danger" id="confirmDeleteBtn">
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
    $(document).on('click', '.delete-btn', function(e) {
        e.preventDefault();

        let url = $(this).data('url');

        $('#deleteModalText').text("Haqiqatan ham ushbu bo'limni o'chirmoqchimisiz?");
        $('#deleteForm').attr('action', url);

        $('#deleteForm').off('submit');

        $('#deleteModal').modal('show');
    });
</script>


<script>
    const checkAll = document.getElementById('checkAll');
    const bulkDeleteBtn = document.getElementById('bulkDeleteBtn');

    function toggleButton() {
        let total = document.querySelectorAll('.checkItem').length;
        let checked = document.querySelectorAll('.checkItem:checked').length;

        bulkDeleteBtn.disabled = checked === 0;

        checkAll.checked = (total === checked);
        checkAll.indeterminate = (checked > 0 && checked < total);

        document.querySelectorAll('.delete-btn').forEach(btn => {
            if (checked > 0) {
                btn.classList.add('disabled');
            } else {
                btn.classList.remove('disabled');
            }
        });
    }

    checkAll.addEventListener('change', function() {
        document.querySelectorAll('.checkItem').forEach(cb => {
            cb.checked = this.checked;
        });
        toggleButton();
    });

    document.querySelectorAll('.checkItem').forEach(cb => {
        cb.addEventListener('change', toggleButton);
    });

    bulkDeleteBtn.addEventListener('click', function(e) {
        e.preventDefault();

        let checked = document.querySelectorAll('.checkItem:checked').length;

        if (checked === 0) {
            alert("Hech narsa tanlanmagan!");
            return;
        }

        $('#deleteModalText').text(checked + " ta bo‘limni o‘chirmoqchimisiz?");
        $('#deleteModal').modal('show');

        // confirm bosilganda form submit bo'ladi
        $('#deleteForm').off('submit').on('submit', function(ev) {
            ev.preventDefault();
            document.getElementById('bulkDeleteForm').submit();
        });
    });

    toggleButton();
</script>

<script>
    $(document).on('click', '.delete-btn', function(e) {
        e.preventDefault();

        let url = $(this).data('url');

        $('#deleteForm').attr('action', url);
        $('#deleteModal').modal('show');
    });
</script>
<script>
    document.getElementById('globalBlockSwitch')
        .addEventListener('change', function() {

            let url = "{{ route('admin.pages.section.toggle-global-block', $menu->id) }}";
            @if($category_slug)
            url += "?category_slug={{ $category_slug }}";
            @endif

            fetch(url, {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                    }
                })
                .then(res => res.json())
                .then(() => location.reload());
        });
</script>
@endsection