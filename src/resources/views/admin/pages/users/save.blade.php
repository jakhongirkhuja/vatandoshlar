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
                                                    <style>
                                                        .password_block{
                                                            position: relative;
                                                            display: flex;
                                                            align-items: center;
                                                        }
                                                        .password_block #togglePassword{
                                                            position: absolute;
                                                            right: 37px;
                                                            padding: 9px;
                                                            cursor: pointer;
                                                        }
                                                        .password_block #keygenerate{
                                                            position: absolute;
                                                            right: 1px;
                                                            padding: 9px;
                                                        }
                                                        .password_block #keygenerate:hover{
                                                            background: #0000000a;
                                                        }
                                                    </style>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Password</label>
                                                            <div class="password_block">
                                                            <input
                                                                type="password"
                                                                id="password"
                                                                class="form-control"
                                                                name="password"
                                                                autocomplete="new-password"
                                                                placeholder="Password"

                                                                required
                                                            >
                                                                <div  id="togglePassword">
                                                                    <i class="feather icon-eye-off" id="eyeIcon"></i>
                                                                </div>

                                                                <div  type="button" id="keygenerate" onclick="generateAndShow()">
                                                                    <i class="fa fa-key"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <script>
                                                        const passwordInput = document.getElementById('password');
                                                        const toggleBtn = document.getElementById('togglePassword');
                                                        const eyeIcon = document.getElementById('eyeIcon');

                                                        toggleBtn.addEventListener('click', function() {
                                                            // Переключаем тип поля
                                                            const isPassword = passwordInput.type === 'password';
                                                            passwordInput.type = isPassword ? 'text' : 'password';

                                                            // Переключаем классы иконки
                                                            if (isPassword) {
                                                                eyeIcon.classList.replace('icon-eye-off', 'icon-eye');
                                                            } else {
                                                                eyeIcon.classList.replace('icon-eye', 'icon-eye-off');

                                                            }
                                                        });

                                                        // Функция генерации (с учетом ваших правил Laravel)
                                                        function generateAndShow() {
                                                            const length = 12;
                                                            // Обязательные наборы для regex: /[A-Z]/ и /[\W_]/
                                                            const upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                                                            const symbols = "!@#$%^&*()_+";
                                                            const all = "abcdefghijklmnopqrstuvwxyz0123456789";

                                                            let pass = "";
                                                            pass += upper[Math.floor(Math.random() * upper.length)];
                                                            pass += symbols[Math.floor(Math.random() * symbols.length)];

                                                            const combined = upper + symbols + all;
                                                            for (let i = pass.length; i < length; i++) {
                                                                pass += combined[Math.floor(Math.random() * combined.length)];
                                                            }

                                                            // Перемешиваем
                                                            passwordInput.value = pass.split('').sort(() => 0.5 - Math.random()).join('');

                                                            // Показываем пароль и меняем иконку
                                                            passwordInput.type = 'text';
                                                            eyeIcon.classList.replace('fa-eye', 'fa-eye-slash');
                                                        }
                                                    </script>
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



                                            </div>
                                            <div class="row mt-3">
                                                <div class="col-12 d-flex justify-content-between">
                                                    <button type="button" class="btn btn-outline-secondary" onclick="history.back()">Orqaga</button>
                                                    <button type="submit" class="btn btn-primary px-3">{{ $isEdit ? 'Yangilash' : 'Saqlash' }}</button>
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
