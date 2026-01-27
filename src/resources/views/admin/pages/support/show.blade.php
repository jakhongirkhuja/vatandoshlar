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
                            <h2 class="content-header-title float-left mb-0">Shakl</h2>
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="{{ route('admin.index') }}">Uy</a></li>
                                    <li class="breadcrumb-item"><a href="#" onclick="history.go(-1)">Orqaga</a></li>
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
                                $labels = [
                                    'job' => 'Mutaxxasisligi',
                                    'name' => 'Ismi',
                                    'email' => 'Email',
                                    'phone' => 'Telefon raqami',
                                    'description' => 'Batafsil',
                                    'address' => 'Yashash joyi',
                                    'birthdate' => 'Tug\'ilgan kuni',
                                    'extra_info' => 'Qo\'shimcha ma\'lumot',
                                    'city' => 'Shahar',
                                    'gender' => 'Jinsi',
                                    'country' => 'Davlat',
                                    'position' => 'Lavozimi',
                                    'education' => 'Ma\'lumoti',
                                    'workplace' => 'Ish joyi',
                                    'specialization' => 'Mutaxxasisligi'
                                ];
                            @endphp

                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped">
                                            <tbody>
                                                @foreach($datas as $key => $value)
                                                    <tr>
                                                        <th width="200">
                                                            {{ $labels[$key] ?? ucfirst($key) }}
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
                    <a href="#" class="btn btn-secondary" onclick="goBack()">Orqaga</a></li>
                    <script>
                        function goBack() {
                            if (document.referrer) {
                                window.location.href = document.referrer;
                            } else {
                                window.location.href = '/admin';
                            }
                        }

                    </script>
                </div>
            </div>
        </div>

    </div>
    </div>
@endsection