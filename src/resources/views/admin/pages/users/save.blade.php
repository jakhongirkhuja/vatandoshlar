@extends('admin.layouts.layouts')

@section('body')

    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                 @include('admin.components.error')
                <!-- users edit start -->
                <section class="users-edit">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <ul class="nav nav-tabs mb-3" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link d-flex align-items-center active" id="account-tab" data-toggle="tab" href="#account" aria-controls="account" role="tab" aria-selected="true">
                                            <i class="feather icon-user mr-25"></i><span class="d-none d-sm-block">Аккаунт</span>
                                        </a>
                                    </li>

                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="account" aria-labelledby="account-tab" role="tabpanel">

                                        @php
                                            $isEdit = isset($user);
                                        @endphp

                                        <form
                                            novalidate
                                            action="{{ $isEdit ? route('admin.users.update', $user->id) : route('admin.users.create') }}"
                                            method="POST"
                                        >
                                            @csrf
                                            @if($isEdit)
                                                @method('PUT')
                                            @endif

                                            <div class="row">

                                                <!-- LEFT SIDE -->
                                                <div class="col-12 col-sm-6">

                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Username</label>
                                                            <input
                                                                type="text"
                                                                class="form-control"
                                                                name="username"
                                                                placeholder="Username"
                                                                value="{{ old('username', $isEdit ? $user->username : '') }}"
                                                                required
                                                            >
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Password</label>
                                                            @php
                                                                $length = 10;
                                                                $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()';

                                                                $password = '';
                                                                for ($i = 0; $i < $length; $i++) {
                                                                    $password .= $chars[random_int(0, strlen($chars) - 1)];
                                                                }
                                                            @endphp
                                                            <input
                                                                type="password"
                                                                id="password"
                                                                class="form-control"
                                                                name="password"
                                                                autocomplete="new-password"
                                                                placeholder="Password"

                                                                required
                                                            >
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Name</label>
                                                            <input
                                                                type="text"

                                                                class="form-control"
                                                                name="name"
                                                                placeholder="Name"
                                                                value="{{ old('name', $isEdit ? $user->name : '') }}"
                                                                required
                                                            >
                                                        </div>
                                                    </div>

                                                </div>


                                                <div class="col-12 col-sm-6">
                                                    <label>Status</label>
                                                    <div class="form-group">
                                                        <select name="status" required class="form-control">
                                                            <option value="1" {{ old('status', $user->status ?? 1) == 1 ? 'selected' : '' }}>Active</option>
                                                            <option value="0" {{ old('status', $user->status ?? 1) == 0 ? 'selected' : '' }}>Deactivated</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Role</label>
                                                        <select name="role_id" required class="form-control">
                                                            @forelse ($roles as $role)
                                                                <option value="{{ $role->id }}"
                                                                    {{ $isEdit && $user->role_id == $role->id ? 'selected' : '' }}
                                                                >
                                                                    {{ $role->name }}
                                                                </option>
                                                            @empty
                                                                <option value="0"></option>
                                                            @endforelse

                                                        </select>
                                                    </div>

                                                </div>

                                                <!-- PERMISSIONS (your existing structure, unchanged) -->
                                                <div class="col-12" style="display: none">
                                                    <div class="table-responsive border rounded px-1 ">
                                                        <h6 class="border-bottom py-1 mx-1 mb-0 font-medium-2">
                                                            <i class="feather icon-lock mr-50 "></i>Permission
                                                        </h6>

                                                        <table class="table table-borderless">
                                                            <thead>
                                                            <tr>
                                                                <th>Module</th>
                                                                <th>Read</th>
                                                                <th>Write</th>
                                                                <th>Create</th>
                                                                <th>Delete</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                                <td>Users</td>
                                                                <td><div class="custom-control custom-checkbox"><input type="checkbox" name="permissions[users][read]" class="custom-control-input" id="users-checkbox1" checked><label class="custom-control-label" for="users-checkbox1"></label></div></td>
                                                                <td><div class="custom-control custom-checkbox"><input type="checkbox" name="permissions[users][write]" class="custom-control-input" id="users-checkbox2"><label class="custom-control-label" for="users-checkbox2"></label></div></td>
                                                                <td><div class="custom-control custom-checkbox"><input type="checkbox" name="permissions[users][create]" class="custom-control-input" id="users-checkbox3"><label class="custom-control-label" for="users-checkbox3"></label></div></td>
                                                                <td><div class="custom-control custom-checkbox"><input type="checkbox" name="permissions[users][delete]" class="custom-control-input" id="users-checkbox4" checked><label class="custom-control-label" for="users-checkbox4"></label></div></td>
                                                            </tr>

                                                            <tr>
                                                                <td>Articles</td>
                                                                <td><div class="custom-control custom-checkbox"><input type="checkbox" name="permissions[articles][read]" class="custom-control-input" id="users-checkbox5"><label class="custom-control-label" for="users-checkbox5"></label></div></td>
                                                                <td><div class="custom-control custom-checkbox"><input type="checkbox" name="permissions[articles][write]" class="custom-control-input" id="users-checkbox6" checked><label class="custom-control-label" for="users-checkbox6"></label></div></td>
                                                                <td><div class="custom-control custom-checkbox"><input type="checkbox" name="permissions[articles][create]" class="custom-control-input" id="users-checkbox7"><label class="custom-control-label" for="users-checkbox7"></label></div></td>
                                                                <td><div class="custom-control custom-checkbox"><input type="checkbox" name="permissions[articles][delete]" class="custom-control-input" id="users-checkbox8" checked><label class="custom-control-label" for="users-checkbox8"></label></div></td>
                                                            </tr>

                                                            <tr>
                                                                <td>Staff</td>
                                                                <td><div class="custom-control custom-checkbox"><input type="checkbox" name="permissions[staff][read]" class="custom-control-input" id="users-checkbox9" checked><label class="custom-control-label" for="users-checkbox9"></label></div></td>
                                                                <td><div class="custom-control custom-checkbox"><input type="checkbox" name="permissions[staff][write]" class="custom-control-input" id="users-checkbox10" checked><label class="custom-control-label" for="users-checkbox10"></label></div></td>
                                                                <td><div class="custom-control custom-checkbox"><input type="checkbox" name="permissions[staff][create]" class="custom-control-input" id="users-checkbox11"><label class="custom-control-label" for="users-checkbox11"></label></div></td>
                                                                <td><div class="custom-control custom-checkbox"><input type="checkbox" name="permissions[staff][delete]" class="custom-control-input" id="users-checkbox12"><label class="custom-control-label" for="users-checkbox12"></label></div></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                </div>

                                                <!-- BUTTONS -->
                                                <div class="col-12 d-flex flex-sm-row flex-column justify-content-end mt-1">
                                                    <button type="submit" class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">
                                                        {{ $isEdit ? 'Update User' : 'Create User' }}
                                                    </button>
                                                    <button type="reset" class="btn btn-outline-warning">Reset</button>
                                                </div>

                                            </div>

                                        </form>

                                        <!-- users edit account form ends -->
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- users edit ends -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

@endsection
