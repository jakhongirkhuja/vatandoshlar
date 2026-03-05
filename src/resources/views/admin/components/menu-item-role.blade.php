<div class="custom-control custom-checkbox d-flex align-items-center mb-1"
     style="margin-left: {{ $level * 35 }}px;">

    @php
        $switchId = 'accountSwitch' . $item->id;
        $isChecked = isset($role) && $role->menus->contains('id', $item->id);
    @endphp

    <input type="checkbox"
           name="menus[]"
           value="{{ $item->id }}"
           class="custom-control-input"
           id="{{ $switchId }}"
           {{ $isChecked ? 'checked' : '' }}>

    <label class="custom-control-label mr-1" for="{{ $switchId }}">
  <span class="switch-label w-100">
        @if($level == 0)<strong>@endif
            {{ $item->getTitle($item->translations, app()->getLocale()) }}
        @if($level == 0)</strong>@endif
    </span>
    </label>

  

</div>

@if($item->childrens->count())
    @foreach($item->childrens as $child)
        @include('admin.components.menu-item-role', [
            'item' => $child,
            'level' => $level + 1,
            'role' => $role ?? null
        ])
    @endforeach
@endif
