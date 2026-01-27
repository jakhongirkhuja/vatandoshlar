@extends('admin.layouts.layouts')

@section('body')

<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-6 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">{{$menu->title}} {{$categoryName &&
                            $categoryName->category? '| '.$categoryName?->category : ''}}</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{route('admin.index')}}">Главная</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content-header-right text-md-right col-md-6 col-12 d-md-block">

                <div class="form-group breadcrum-right ">
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

                    <a href="{{route('admin.pages.section.create', $parameters)}}"
                        class="btn btn-primary pull-right waves-effect waves-light" type="button">
                        <i class="feather icon-plus icon-white"></i>
                        <span>Добавить</span>
                    </a>
                    <a href="{{route('admin.pages.section.settings.create',$parameters2)}}"
                        class="btn btn-outline-primary pull-right waves-effect waves-light mr-2" type="button">
                        <i class="feather icon-settings  icon-white"></i>
                        <span>Настройки</span>
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
                            <th scope="col" class="p-1 text-center">ID</th>
                            <th scope="col">Список</th>
                            <th scope="col">Название</th>

                            <th scope="col" class="action-col"></th>
                        </tr>
                    </thead>
                    <tbody>

                        @foreach($sections as $section)

                        <tr role="row" class="odd">
                            <td class="p-1 text-center" width="60"> 
                                @include('admin.components.sort-form', ['menu' => $section,'route' =>
                                route('admin.pages.section.update-sort', ['slug'=>$slug,'id' =>
                                $id,'section_id'=>$section->id])])
                            </td>
                            <td width="100">
                                @foreach($section->children->groupBy('category_slug') as $category=>$child)

                                <a href="{{route('admin.pages.section.index', ['slug'=>$slug,'id'=>$menu->id, 'parent_id'=>$section->id, 'category_slug'=>$category])}}"
                                    class="btn btn-primary" data-toggle="tooltip" data-placement="top" title
                                    data-original-title="Kichik kategoriya">{{isset($child[0])? $child[0]->category:
                                    'empty'}}</a>

                                @endforeach
                                <a href="{{route('admin.pages.section.settings.create', ['slug'=>$slug,'id'=>$menu->id, 'parent_id'=>$section->id])}}"
                                    class="btn btn-secondary" style="display: none;" data-toggle="tooltip"
                                    data-placement="top" title data-original-title="Kichik kategoriya yaratish"><i
                                        class="feather icon-plus icon-white"></i></a>
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
                                <a href="{{ route('admin.pages.section.edit',$parameters) }}"
                                    class="btn btn-small btn-info btn-edit">
                                    <i class="feather icon-edit icon-white"></i>
                                </a>
                                <div class="custom-control custom-switch custom-control-inline  mx-2">
                                    <input type="checkbox" name="status" class="custom-control-input lang-status-switch"
                                        id="customSwitch{{ $section->id }}" data-id="{{ $section->id }}"
                                        @if($section->status) checked @endif
                                    >
                                    <label class="custom-control-label" for="customSwitch{{ $section->id }}"></label>
                                </div>
                                <a href="#" class="btn btn-small btn-danger delete-btn"
                                    data-id="{{ $section->id }}" data-url="{{ route('pages.delete',$section->id) }}">
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
    document.querySelectorAll('.lang-status-switch').forEach(el => {
        el.addEventListener('change', function () {

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