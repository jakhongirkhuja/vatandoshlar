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
                <!-- users edit start -->
                <section class="users-edit">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <ul class="nav nav-tabs mb-3" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link d-flex align-items-center active" id="account-tab"
                                           data-toggle="tab" href="#account" aria-controls="account" role="tab"
                                           aria-selected="true">
                                            <i class="feather icon-user mr-25"></i><span class="d-none d-sm-block">Настройки сайта</span>
                                        </a>
                                    </li>

                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="account" aria-labelledby="account-tab"
                                         role="tabpanel">
                                        @include('admin.components.error')

                                        <form

                                            action="{{route('admin.settings.create')}}"
                                            method="POST"
                                        >
                                            @csrf

                                            <div class="row">

                                                <div class="col-md-12">
                                                    <ul class="nav nav-tabs mb-2" role="tablist">
                                                        @foreach($languages as $k => $language)
                                                            <li class="nav-item">
                                                                <a class="nav-link {{ $k === 0 ? 'active' : '' }}"
                                                                   data-toggle="tab"
                                                                   href="#lang{{ $language->code }}">
                                                                    <img
                                                                        src="{{ asset('assets/'.$language->flag_icon) }}"
                                                                        class="size_small">
                                                                    {{ $language->name }}
                                                                </a>
                                                            </li>
                                                        @endforeach
                                                    </ul>
                                                </div>
                                                <div class="tab-content w-100">
                                                    @foreach($languages as $k => $language)
                                                        <div class="tab-pane fade {{ $k === 0 ? 'show active' : '' }}"
                                                             id="lang{{ $language->code }}">


                                                            <div class="col-md-12 mb-2">
                                                                <label>Заголовок сайта ({{ $language->code }})</label>
                                                                <input
                                                                    type="text"
                                                                    class="form-control"
                                                                    name="title[{{ $language->code }}]"

                                                                    value="{{ old(
                                                                            'title.'.$language->code,
                                                                            $settings->title[$language->code] ?? ''
                                                                        ) }}"
                                                                >
                                                            </div>

                                                            <div class="col-md-12 mb-2">
                                                                <label>Описание ({{ $language->code }})</label>
                                                                <textarea
                                                                    class="form-control"
                                                                    name="meta_description[{{ $language->code }}]"
                                                                    rows="3"

                                                                >{{ old(
                                                                    'meta_description.'.$language->code,
                                                                    $settings->meta_description[$language->code] ?? ''
                                                                ) }}</textarea>
                                                            </div>


                                                            <div class="col-md-12 mb-2">
                                                                <label>Meta keywords ({{ $language->code }})</label>
                                                                <input
                                                                    type="text"
                                                                    class="form-control"
                                                                    name="meta_keywords[{{ $language->code }}]"
                                                                    value="{{ old(
                                                                        'meta_keywords.'.$language->code,
                                                                        $settings->meta_keywords[$language->code] ?? ''
                                                                    ) }}"
                                                                >
                                                            </div>

                                                        </div>
                                                    @endforeach
                                                </div>
                                                <div class="col-md-12 mb-2">

                                                    <label class="form-label">E-mail</label>
                                                    <input
                                                        type="email"
                                                        name="email"
                                                        value="{{ old(
                                                                        'email',
                                                                        $settings->email ?? ''
                                                                    ) }}"
                                                        class="form-control"
                                                        placeholder="admin@example.com">

                                                </div>


                                                <!-- Disable Site -->
                                                <div class="col-md-12 mb-2">
                                                    <label class="form-label d-block">Выключить сайт</label>
                                                    <div class="custom-control custom-switch custom-control-inline">
                                                        <input
                                                            type="checkbox"
                                                            name="status"
                                                            class="custom-control-input lang-status-switch"
                                                            id="customSwitch" @if($settings?->status) checked @endif
                                                        >
                                                        <label class="custom-control-label" for="customSwitch"></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-1" style="display: none">
                                                    <div class="form-group">
                                                        <label>Главная страница</label>
                                                        <select name="main_page_id" required class="form-control">
                                                            <option >Выбрать</option>
                                                            @forelse ($pages as $page)
                                                                <option value="{{ $page->id }}"
                                                                    {{$page->id == $settings?->main_page_id ? 'selected' : '' }}
                                                                >
                                                                    {{  $page->getTitle($page->translations, app()->getLocale())  }}
                                                                </option>
                                                            @empty

                                                            @endforelse

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-1">
                                                    <div class="form-group">
                                                        <label>Поиск по</label>
                                                        <select name="search_ids[]"  id="search_ids" multiple="multiple"  class="form-control select2">
                                                            <option >Выбрать</option>

                                                            @foreach($pages as $menu)
                                                                <option value="{{ $menu->id }}"
                                                                    {{ in_array($menu->id, $settings->search_ids ?? []) ? 'selected' : '' }}>
                                                                    {{  $menu->getTitle($menu->translations, app()->getLocale())  }}
                                                                </option>
                                                            @endforeach


                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-1">
                                                    <div class="form-group">
                                                        <label>Вкл сортировок</label>
                                                        <select name="sorting_ids[]"  id="sorting_ids" multiple="multiple"  class="form-control select2">
                                                            <option >Выбрать</option>

                                                            @foreach($pages as $menu)
                                                                <option value="{{ $menu->id }}"
                                                                    {{ in_array($menu->id, $settings->sorting_ids ?? []) ? 'selected' : '' }}>
                                                                    {{  $menu->getTitle($menu->translations, app()->getLocale())  }}
                                                                </option>
                                                            @endforeach


                                                        </select>
                                                    </div>
                                                </div>

                                                <!-- Admin Panel IP Binding -->
                                                <div class="col-md-12 mb-2">
                                                    <label class="form-label">
                                                        Привязка админ панели к IP адресу
                                                    </label>
                                                    <input
                                                        type="text"
                                                        name="admin_ips"
                                                        class="form-control"
                                                        value="{{ old(
                                                                        'admin_ips',
                                                                        $settings->admin_ips ?? ''
                                                                    ) }}"
                                                        placeholder="192.168.40.118, 192.168.40.119"
                                                    >
                                                    <small class="text-muted">
                                                        Если IP-адресов несколько, разделите их запятыми.
                                                    </small>
                                                </div>
                                                <div class="col-md-12 mb-1">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Telegram Bot Token</label>
                                                                <input type="text" id="tg_token"  value="{{ old(
                                                                        'email',
                                                                        $settings->bot_token ?? ''
                                                                    ) }}" name="bot_token" class="form-control"
                                                                       placeholder="123456:ABC-DEF...">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Chat ID</label>
                                                                <input type="text" id="tg_chat_id" value="{{ old(
                                                                        'email',
                                                                        $settings->chat_id ?? ''
                                                                    ) }}" name="chat_id" class="form-control"
                                                                       placeholder="-1001234567890">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="d-flex gap-2">
                                                                <button class="btn btn-secondary" type="button" onclick="checkToken()">
                                                                    Check Token
                                                                </button>

                                                                <button class="btn btn-primary ml-2" type="button" onclick="checkBot()">
                                                                    Check Bot & Admin
                                                                </button>
                                                            </div>

                                                            <div class="mt-3">
                                                                <div id="tg_result" class="alert d-none"></div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-12 mb-1">

                                                    <a href="#myModal" role="button" class="btn btn-info waves-effect waves-light" data-toggle="modal"><i class="feather icon-image"></i> Фото</a>
                                                </div>
                                            </div>




                                            <div class="row">
                                                <div class="col-12">
                                                    <div
                                                        class="col-12 d-flex flex-sm-row flex-column justify-content-end mt-1">
                                                        <button type="submit"
                                                                class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">
                                                            {{'Обновить'}}
                                                        </button>

                                                    </div>
                                                </div>
                                            </div>

                                            <input type="file" style="display: none" multiple name="images[]">
                                            <input type="hidden" multiple name="main_image">
                                            <input type="hidden" id="delete-route" value="{{ route('admin.menu_main.imageDelete') }}">
                                            <input type="hidden" id="slug" value="settings">

                                                @php $menu = $settings @endphp

                                            @include('admin.components.modal')
                                        </form>


                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>


            </div>
        </div>
    </div>
    <!-- END: Content-->
    <script>
        function showResult(type, message) {
            const box = document.getElementById('tg_result');
            box.className = 'alert alert-' + type;
            box.innerText = message;
            box.classList.remove('d-none');
        }
        function checkToken() {
            fetch('{{route('telegram.checkToken')}}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({
                    token: document.getElementById('tg_token').value
                })
            })
                .then(r => r.json())
                .then(r => {
                    if (r.success) {
                        showResult('success', 'Bot found: @' + r.username);
                    } else {
                        showResult('danger', 'Error ' + r.message);
                    }
                });
        }
        function checkBot() {
            fetch('{{route('telegram.checkBot')}}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({
                    token: document.getElementById('tg_token').value,
                    chat_id: document.getElementById('tg_chat_id').value
                })
            })
                .then(r => r.json())
                .then(r => {
                    if (!r.success) {
                        showResult('danger', 'Error ' + r.message);
                        return;
                    }

                    if (r.is_admin) {
                        showResult('success', 'Bot is ADMIN in this chat');
                    } else {
                        showResult('warning', 'Bot is in group but NOT admin');
                    }
                });
        }
    </script>

@endsection
