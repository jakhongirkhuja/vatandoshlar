<!-- BEGIN: Main Menu-->
<div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="navbar-header"> 
                <a class="navbar-brand" href="{{route('admin.index')}}">
                  
                </a> 
    </div>
    <div class="shadow-bottom"></div>
    <div class="main-menu-content">

        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
            @if(auth()->user()->role_id == 1)
                <li class=" nav-item ">
                    <a href="#"><i class="feather icon-user"></i><span class="menu-title" data-i18n="User">Admin</span></a>
                    <ul class="menu-content">

                        <li class="{{is_current_route('admin.users') ? 'active' : ''}}"><a href="{{route('admin.users')}}">

                                <i class="feather icon-circle"></i><span class="menu-item" data-i18n="List">Users</span></a>
                        </li>
                        <li class="{{is_current_route('admin.roles') ? 'active' : ''}}"><a
                                href="{{route('admin.roles')}}"><i class="feather icon-circle"></i><span class="menu-item"
                                    data-i18n="View">Roles</span></a>
                        </li>
                        <li class="{{is_current_route('langs.index') ? 'active' : ''}}"><a
                                href="{{route('langs.index')}}"><i class="feather icon-circle"></i><span class="menu-item"
                                    data-i18n="View">Lang</span></a>
                        </li>

                    </ul>
                </li>
            @endif
            <li class=" nav-item">    <a
                            href="{{route('admin.menu_main.index')}}"><i class="feather icon-circle"></i><span
                                class="menu-item" data-i18n="Shop">Menyu</span></a>
            </li>
            <li class=" nav-item "><a href="#"><i class="feather icon-settings"></i><span class="menu-title"
                        data-i18n="User">Настройки</span></a>
                <ul class="menu-content">
                    <li class="{{ is_current_route('admin.content.index', ['category' => 'list']) ? 'active' : '' }}">
                        <a href="{{route('admin.content.index', ['category' => 'list'])}}"><i
                                class="feather icon-circle"></i><span class="menu-item"
                                data-i18n="List">Список</span></a>
                    </li>
                    <li class="{{ is_current_route('admin.content.index', ['category' => 'job']) ? 'active' : '' }}">
                        <a href="{{route('admin.content.index', ['category' => 'job'])}}"><i
                                class="feather icon-circle"></i><span class="menu-item"
                                data-i18n="List">Mutaxassislar ro'yhati</span></a>
                    </li>
                    <li class="{{is_current_route('social_links.index') ? 'active' : ''}}"><a
                            href="{{route('social_links.index')}}"><i class="feather icon-circle"></i><span
                                class="menu-item" data-i18n="View">Ijtimoiy tarmoqlar</span></a>
                    </li>

                </ul>
            </li>
            <li class=" navigation-header"><span>Sahifalar</span>
            </li>

            @foreach($globalmenus as $menu)

                @include('admin.components.menu-item', [
                    'menu' => $menu,
                    'slug' => $menu->slug
                ])


              @endforeach
    <li class=" navigation-header"><span>Formalar</span>
            </li>
  
<li class="nav-item {{is_current_route('admin.supports', ['type' => 'form']) ? 'active' : ''}}">
                <a href="{{route('admin.supports', ['type' => 'form'])}}"><i class="feather icon-mail "></i>
                        <span  class="menu-item" data-i18n="View">Aloqa</span>
                    </a>
        </li>
        <li class="nav-item {{is_current_route('admin.supports', ['type' => 'application']) ? 'active' : ''}}">
                <a href="{{route('admin.supports', ['type' => 'application'])}}"><i class="feather icon-mail "></i>
                       <span  class="menu-item" data-i18n="View">Murojaatlar</span>
                    </a>
        </li>
         <li class="nav-item {{is_current_route('admin.supports', ['type' => 'participation']) ? 'active' : ''}}">
                <a href="{{route('admin.supports', ['type' => 'participation'])}}"><i class="feather icon-mail "></i>
                        <span  class="menu-item" data-i18n="View">Ishtirok etuvchilar</span>
                    </a>
            </li>
        </ul>
    </div>
</div>