@extends('admin.layouts.layouts')

@section('body')

<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-4 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Меню</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{route('admin.index')}}">Главная</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.2/Sortable.min.js"></script>

            <div class="content-header-right text-md-right col-md-8 col-12 d-md-block">

                <div class="form-group breadcrum-right ">

                    <a href="{{route('admin.menu_main.create')}}"
                        class="btn btn-primary pull-right waves-effect waves-light" type="button">
                        <i class="feather icon-plus icon-white"></i>
                        <span>Добавить</span>
                    </a>
                    <a href="{{route('admin.menu_main.settings')}}"
                        class="btn btn-primary pull-right waves-effect waves-light mr-2" type="button">
                        <i class="feather icon-settings  icon-white"></i>
                        <span>Настройки</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="content-body">
            @include('admin.components.error')
            <!-- <div class="row" id="table-hover-animation">
                    <table class="table data-list-view dataTable">
                        <thead>
                        <tr>
                            <th scope="col" width="100">Order</th>
                            <th scope="col">Title</th>
                            <th scope="col">Type</th>
                            <th scope="col" class="action-col"></th>
                        </tr>
                        </thead>
                        <tbody id="sortable">
                        @foreach($menus as $menu)
                            @if($menu->parent_id === null)
                                @include('admin.components.menu-row', ['menu' => $menu, 'menus' => $menus, 'level' => 0])
                            @endif
                        @endforeach
                        </tbody>
                    </table>
                </div> -->
            <ul class="menu" id="sortable">
                @foreach($menus as $menu)
                @if($menu->parent_id === null)
                @include('admin.pages.menus.main.components.menu-item', [
                'menu' => $menu,
                'menus' => $menus
                ])
                @endif
                @endforeach
            </ul>
        </div>
    </div>
</div>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <form id="deleteForm" method="POST">
            @csrf
            @method('DELETE')

            <div class="modal-content small">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">Подтвердить удаление</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        ×
                    </button>
                </div>

                <div class="modal-body">
                    Вы уверены, что хотите удалить этот раздел?
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                        data-dismiss="modal">Отмена</button>

                    <button type="submit" class="btn btn-danger">
                        Удалить
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
@section('script')
<script>
    function menuSwitch() {
        const items = document.querySelectorAll(".menu__item");

        // Initialize all submenus
        items.forEach((item) => {
            const submenu = item.querySelector(":scope > .menu__bottom");
            if (!submenu) return;
            submenu.style.maxHeight = "0";
            submenu.style.overflow = "hidden";
            submenu.style.opacity = "0";
            item.classList.remove("active");
        });

        items.forEach((item) => {
            const toggle = item.querySelector(":scope > .menu__top .menu__toggle");
            const submenu = item.querySelector(":scope > .menu__bottom");

            if (!toggle || !submenu) return;

            toggle.addEventListener("click", (e) => {
                e.stopPropagation();
                e.preventDefault();

                const isActive = item.classList.contains("active");

                // Collapse siblings
                const siblings = Array.from(item.parentElement.children).filter(
                    (i) => i !== item && i.classList.contains("menu__item")
                );
                siblings.forEach((sib) => collapseItem(sib));

                if (isActive) {
                    collapseItem(item);
                } else {
                    expandItem(item, submenu);
                }
            });
        });

        function expandItem(item, submenu) {
            submenu.style.display = "block";
            const height = submenu.scrollHeight;
            submenu.style.maxHeight = "0";
            submenu.style.opacity = "0";

            requestAnimationFrame(() => {
                submenu.style.maxHeight = height + "px";
                submenu.style.opacity = "1";
                item.classList.add("active");

                const toggle = item.querySelector(":scope > .menu__top .menu__toggle");
                if (toggle) toggle.textContent = "−";
            });

            const cleanup = () => {
                if (item.classList.contains("active")) submenu.style.maxHeight = "none";
                submenu.removeEventListener("transitionend", cleanup);
            };
            submenu.addEventListener("transitionend", cleanup);
        }

        function collapseItem(item) {
            const submenu = item.querySelector(":scope > .menu__bottom");
            if (!submenu || !item.classList.contains("active")) return;

            const height = submenu.scrollHeight;
            submenu.style.maxHeight = height + "px";
            submenu.offsetHeight;

            requestAnimationFrame(() => {
                submenu.style.maxHeight = "0";
                submenu.style.opacity = "0";
                item.classList.remove("active");

                const toggle = item.querySelector(":scope > .menu__top .menu__toggle");
                if (toggle) toggle.textContent = "+";
            });

            // Collapse nested children
            const nestedItems = item.querySelectorAll(":scope .menu__item.active");
            nestedItems.forEach((nested) => {
                const nestedSub = nested.querySelector(":scope > .menu__bottom");
                if (nestedSub) {
                    nestedSub.style.maxHeight = "0";
                    nestedSub.style.opacity = "0";
                }
                nested.classList.remove("active");

                const t = nested.querySelector(":scope > .menu__top .menu__toggle");
                if (t) t.textContent = "+";
            });
        }
    }

    menuSwitch();

    document.querySelectorAll('ul.menu, ul.menu__bottom').forEach(function(ul) {
        new Sortable(ul, {
            animation: 150,
            group: {
                name: 'nested',
                pull: false, // prevents moving between levels
                put: false
            },
            handle: '.menu__top',
            draggable: '> li.menu__item',
            onEnd: function() {
                updateSortOrder(ul);
            }
        });
    });

    function updateSortOrder(ul) {
        let order = [];

        ul.querySelectorAll(':scope > li.menu__item').forEach((li, index) => {
            order.push({
                id: li.dataset.id,
                parent_id: ul.closest('li.menu__item')?.dataset.id ?? null,
                sort_order: index + 1
            });
        });

        console.log('UPDATED:', order);


        fetch(`{{route('admin.menu_main.update-sort-menu',)}}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('input[name=_token]').value
            },
            body: JSON.stringify({
                order
            })
        });

    }

    // new Sortable(document.getElementById('sortable'), {
    //     animation: 150,
    //     handle: 'li', // drag by any cell (or add a special handle)
    //     onEnd: function() {
    //         let order = [];

    //         document.querySelectorAll('#sortable .menu__item').forEach((row, index) => {
    //             order.push({
    //                 id: row.dataset.id,
    //                 sort_order: index + 1
    //             });
    //         });
    //         console.log(order);

    //     }
    // });
    // document.addEventListener('DOMContentLoaded', function() {
    //     document.querySelectorAll('.toggle-children').forEach(function(toggle) {
    //         toggle.addEventListener('click', function() {
    //             const tr = toggle.closest('tr');
    //             const parentId = tr.dataset.id;
    //             const isHidden = toggle.dataset.open !== 'true';

    //             toggle.dataset.open = isHidden ? 'true' : 'false';
    //             toggle.textContent = isHidden ? '▼' : '▶';

    //             // Show/hide direct children
    //             document.querySelectorAll(`tr[data-parent_id='${parentId}']`).forEach(child => {
    //                 child.style.display = isHidden ? '' : 'none';

    //                 // If hiding, hide all grandchildren recursively
    //                 if (!isHidden) {
    //                     hideChildren(child.dataset.id);
    //                 }
    //             });
    //         });
    //     });

    //     function hideChildren(parentId) {
    //         document.querySelectorAll(`tr[data-parent_id='${parentId}']`).forEach(child => {
    //             child.style.display = 'none';
    //             hideChildren(child.dataset.id);
    //             const toggle = child.querySelector('.toggle-children');
    //             if (toggle) toggle.textContent = '▶';
    //             if (toggle) toggle.dataset.open = 'false';
    //         });
    //     }
    // });

    $(document).on('click', '.delete-btn', function(e) {
        e.preventDefault();

        let url = $(this).data('url');

        $('#deleteForm').attr('action', url);
        $('#deleteModal').modal('show');
    });

    // new Sortable(document.getElementById('sortable'), {
    //     animation: 150,
    //     handle: 'td', // drag by any cell (or add a special handle)
    //     onEnd: function() {
    //         let order = [];

    //         document.querySelectorAll('#sortable tr').forEach((row, index) => {
    //             order.push({
    //                 id: row.dataset.id,
    //                 sort_order: index + 1
    //             });
    //         });
    //         console.log(order);

    //     }
    // });
</script>
@endsection