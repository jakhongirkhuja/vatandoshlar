<form action="{{ $route }}" class="fx align-items-center sort_submit mx-1" method="post">
    @csrf
    <input class="form-control" value="{{ $menu->sort_order }}" name="sort_order">
</form>