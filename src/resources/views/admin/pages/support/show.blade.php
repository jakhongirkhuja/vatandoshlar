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
                            <h2 class="content-header-title float-left mb-0">Форма</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="{{ route('admin.index') }}">Главная</a></li>
                                    <li class="breadcrumb-item"><a href="#" onclick="history.go(-1)">Назад</a></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {{-- BODY --}}
            <div class="content-body">
                <div class="row">
                    <div class="col-12">

                        <div class="card" {{-- CARD BODY --}} <div class="card-body">
                            @php
                                $datas = (array) $support->data;

                            @endphp

                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped">
                                            <tbody>
                                                @foreach($datas as $key => $value)
                                                    <tr>
                                                        <th width="200">
                                                            {{ ucfirst($key) }}
                                                        </th>
                                                        <td style="white-space: pre-line;">
                                                            {{ $value }}
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </table>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>

    </div>
    </div>
@endsection