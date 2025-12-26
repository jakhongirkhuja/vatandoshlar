
<tr data-parent_id="{{ $menu->parent_id }}" data-id="{{ $menu->id }}" class="menu-row @if($level > 0) child-row @endif" @if($level > 0) style="display: none;" @endif>
    <td width="100">
        @include('admin.components.sort-form', [
            'menu' => $menu,
            'route' => route('admin.menu_main.update-sort', ['id' => $menu->id])
        ])
    </td>
    <td style="padding-left: {{ $level * 20 }}px">
        @php

        @endphp
        @if($menus->where('parent_id', $menu->id)->count() > 0)
            <span class="toggle-children" style="cursor: pointer; font-weight: bold;">▶</span>
        @endif
        {{ $menu->title }}
    </td>
    <td>{{ ucfirst($menu->type) }}</td>
    <td class="fx align-items-center">
        <a href="{{ route('admin.menu_main.edit', $menu->id) }}" class="btn btn-small btn-info mr-1">
            <i class="feather icon-edit icon-white"></i>
        </a>
        <div class="custom-control custom-switch custom-control-inline">
            <input
                type="checkbox"
                name="status"
                class="custom-control-input lang-status-switch"
                id="customSwitch{{ $menu->id }}"
                data-id="{{ $menu->id }}"
                @if($menu->status) checked @endif
            >
            <label class="custom-control-label" for="customSwitch{{ $menu->id }}"></label>

        </div>
        <a href="#"
           class="btn btn-small btn-danger ml-2 delete-btn"
           data-id="{{ $menu->id }}"
           data-url="{{ route('admin.menu_main.delete',  $menu->id) }}">
            <i class="feather icon-trash icon-white"></i>
        </a>
    </td>
</tr>

{{-- Render children recursively --}}
@foreach($menus as $child)
    @if($child->parent_id == $menu->id)
        @include('admin.components.menu-row', ['menu' => $child, 'menus' => $menus, 'level' => $level + 1])
    @endif
@endforeach
