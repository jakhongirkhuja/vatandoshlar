@php
$children = $menus->where('parent_id', $menu->id);
@endphp

<li class="menu__item" data-id="{{ $menu->id }}">
    <div class="menu__top">
        <div class="menu__left">
            @if($children->count())
            <span class="menu__toggle m-0" aria-label="toggle">+</span>
            @endif
            @include('admin.components.sort-form', [
            'menu' => $menu,
            'route' => route('admin.menu_main.update-sort', ['id' => $menu->id])
            ])
            <span class="menu__title">
                {{ $menu->title }} ({{ $menu->type }})
            </span>
        </div>


        <div class="menu__actions">
            <a href="{{ route('admin.menu_main.edit', $menu->id) }}" class="btn  btn-info">
                <i class="feather icon-edit"></i>
            </a>

            <div class="custom-control custom-switch custom-control-inline">
                <input type="checkbox" class="custom-control-input lang-status-switch" id="customSwitch{{ $menu->id }}"
                    data-id="{{ $menu->id }}" @checked($menu->status)>
                <label class="custom-control-label" for="customSwitch{{ $menu->id }}"></label>
            </div>


            <button type="button" class="btn btn-danger delete-btn" data-id="{{ $menu->id }}"
                data-url="{{ route('admin.menu_main.delete', $menu->id) }}">
                <i class="feather icon-trash"></i>
            </button>
        </div>
    </div>
    @if($children->count())
    <ul class="menu__bottom">
        @foreach($children as $child)
        {{-- SAME COMPONENT → child ALSO gets menu__top --}}
        @include('admin.pages.menus.main.components.menu-item', [
        'menu' => $child,
        'menus' => $menus
        ])
        @endforeach
    </ul>
    @endif
</li>