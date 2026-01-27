@if(session('success'))
    {{-- Modal faqat success bo'lgandagina ko'rinadi --}}
    <div class="modal customModal fade" id="supportResponseModal" data-bs-backdrop="static" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class=" img">
                    <i class="i-success"></i>
                    <!-- <i class="i-warning"></i> -->
                </div>
                <h4 class="title">
                    {{staticValue('thanks')}}
                    <!-- {{staticValue('somethingWentWrong')}} -->
                </h4>
                <h4 class="text">
                    {{staticValue('ApplicationSent')}}
                    <!-- {{staticValue('ApplicationNotSent')}} -->
                </h4>
                <!-- <p>
                                                                {{ session('success') }}
                                                            </p> -->
                <button class="close" data-bs-dismiss="modal"> {{staticValue('close')}}</button>
            </div>
        </div>
    </div>
@elseif(session('error'))
    <div class="modal customModal fade" id="supportResponseModal" data-bs-backdrop="static" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class=" img">
                    <!-- <i class="i-success"></i> -->
                    <i class="i-warning"></i>
                </div>
                <h4 class="title">
                    <!-- {{staticValue('thanks')}} -->
                    {{staticValue('somethingWentWrong')}}
                </h4>
                <h4 class="text">
                    <!-- {{staticValue('ApplicationSent')}}}-->
                    {{staticValue('ApplicationNotSent')}}
                </h4>
                <!-- <p>
                                                                {{ session('success') }}
                                                            </p> -->
                <button class="close" data-bs-dismiss="modal"> {{staticValue('close')}}</button>
            </div>
        </div>
    </div>
    @endif
    {{-- Success bo'lganda modalni avtomatik chiqarish uchun skript --}}
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var myModal = new bootstrap.Modal(document.getElementById('supportResponseModal'));
            myModal.show();
        });
    </script>
