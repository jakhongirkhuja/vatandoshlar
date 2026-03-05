<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasMenu"
    aria-labelledby="offcanvasMenuLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasMenuLabel">{{staticValue('menu')}}</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </div>

    <div class="offcanvas-body">
        <ul class="menu">
            @include('front.components.menu-item', ['menus' => $headerMenu, 'level' => 0])
        </ul>
    </div>
</div>