@if(session('success'))
    <div class="modal customModal fade" id="supportResponseModal" data-bs-backdrop="static" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class=" img">
                    <i class="i-success"></i>
                </div>
                <h4 class="title">
                    {{staticValue('thanks')}}
                </h4>
                <h4 class="text">
                    {{staticValue('ApplicationSent')}}
                </h4>
                <button class="close" data-bs-dismiss="modal"> {{staticValue('close')}}</button>
            </div>
        </div>
    </div>
@elseif(session('error') || $errors->any())
    <div class="modal customModal fade" id="supportResponseModal" data-bs-backdrop="static" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class=" img">
                    <i class="i-warning"></i>
                </div>
                <h4 class="title">
                    {{staticValue('somethingWentWrong')}}
                </h4>
                <h4 class="text">
                    {{staticValue('ApplicationNotSent')}}
                </h4>
                <button class="close" data-bs-dismiss="modal"> {{staticValue('close')}}</button>
            </div>
        </div>
    </div>
@endif
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var el = document.getElementById('supportResponseModal');
        if (!el) return;
        var myModal = new bootstrap.Modal(el);
        myModal.show();
    });
</script>