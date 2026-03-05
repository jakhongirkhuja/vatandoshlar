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
                        <h2 class="content-header-title float-left mb-0">Foydalanuvchilar</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{route('admin.index')}}">Asosiy</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-header-right text-md-right col-md-3 col-12 d-md-block">
                <div class="form-group breadcrum-right">
                    <a href="{{route('admin.users.create.view')}}"
                        class="btn btn-primary pull-right waves-effect waves-light" type="button">
                        <i class="icon-plus-sign icon-white"></i>
                        <span>Qoshish</span>
                    </a>
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
                                                <th scope="col">ID</th>
                                                <th scope="col">Ism</th>
                                                <th scope="col">Email</th>
                                                <th scope="col" class="action-col"></th>
                                                <th scope="col" class="action-col">Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($users as $user)
                                            <tr>
                                                <th scope="row">{{$user->id}}</th>
                                                <td>{{$user->username}}</td>
                                                <td>{{$user->name}}</td>

                                                <td class="action-col">

                                                    <a href="{{route('admin.users.edit', $user)}}"
                                                        class="btn btn-small btn-info">
                                                        <i class="feather icon-edit icon-white"></i>
                                                    </a>
                                                </td>
                                                <td class="action-col">
                                                    <div class="custom-control custom-switch custom-control-inline">
                                                        <input type="checkbox" name="status" @if($user->status) checked
                                                        @endif class="custom-control-input status-switch" data-id="{{
                                                        $user->id }}"
                                                        id="customSwitch{{$user->id}}">
                                                        <label class="custom-control-label"
                                                            for="customSwitch{{$user->id}}"></label>
                                                    </div>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <script>
                                    document.querySelectorAll('.status-switch').forEach(el => {
                                        el.addEventListener('change', function () {

                                            const id = this.dataset.id;
                                            const status = this.checked ? 1 : 0;
                                            const url = "{{ route('admin.user.status-update', ':id') }}".replace(':id', id);
                                            fetch(url, {
                                                method: 'POST',
                                                headers: {
                                                    'Content-Type': 'application/json',
                                                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                                                },
                                                body: JSON.stringify({ status })
                                            })
                                                .then(res => res.json())
                                                .then(data => console.log('OK:', data))
                                                .catch(err => console.error('Error:', err));

                                        });
                                    });
                                </script>



                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

@endsection