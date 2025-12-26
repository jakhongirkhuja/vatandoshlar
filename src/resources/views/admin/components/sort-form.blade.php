<form action="{{ $route }}" class="fx align-items-center sort_submit" method="post">
    @csrf
    <input class="form-control" value="{{ $menu->sort_order }}" name="sort_order">
    <button type="submit" class="btn">
        <i class="btn btn-success feather icon-save rounded"></i>
    </button>
</form>
