@extends('admin.layouts.layouts')

@section('body')

    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row"></div>
            <div class="content-body">

                <section class="users-edit">
                    <div class="card">

                        <div class="card-content">
                            <div class="card-body">
                                <ul class="nav nav-tabs mb-3" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link d-flex align-items-center active" id="account-tab" data-toggle="tab" href="#account" aria-controls="account" role="tab" aria-selected="true">
                                            <i class="feather icon-user mr-25"></i><span class="d-none d-sm-block">Соц сеть</span>
                                        </a>
                                    </li>

                                </ul>
                                @php
                                    $isEdit = isset($socialLink);
                                @endphp

                                <form novalidate
                                      action="{{ $isEdit ? route('social_links.update', $socialLink->id) : route('social_links.store') }}"
                                      method="POST">
                                    @csrf
                                    @if($isEdit)
                                        @method('PUT')
                                    @endif

                                    <div class="row">
                                        <div class="col-md-12 mb-2">
                                            <label for="name" class="form-label">Имя</label>
                                            <input type="text"
                                                   class="form-control"
                                                   id="name"
                                                   name="name"
                                                   placeholder="Social network name"
                                                   value="{{ old('name', $socialLink->name ?? '') }}"
                                                   required>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label for="icon" class="form-label">Иконка</label>
                                            <input type="text"
                                                   class="form-control"
                                                   id="icon"
                                                   name="icon"
                                                   placeholder="facebook"
                                                   value="{{ old('icon', $socialLink->icon ?? '') }}">
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label for="url" class="form-label">URL</label>
                                            <input type="url"
                                                   class="form-control"
                                                   id="url"
                                                   name="url"
                                                   placeholder="https://example.com"
                                                   value="{{ old('url', $socialLink->url ?? '') }}"
                                                   required>
                                        </div>



                                    </div>


                                    <div class="row">
                                        <div class="col-12">
                                            <div class="d-flex flex-sm-row flex-column justify-content-end mt-1">
                                                <button type="submit" class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1">
                                                    {{ $isEdit ? 'Обновить' : 'Создать' }}
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                                <!-- Social Links form ends -->

                            </div>
                        </div>
                    </div>
                </section>

            </div>
        </div>
    </div>
    <!-- END: Content-->

@endsection
