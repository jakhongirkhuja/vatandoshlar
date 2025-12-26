<div class="layout-sidebar">
                <div class="sidebar">
<div class="sidebar__menu">

    @if($currentPage)
        @if($currentPage->parent)
            @php
                $category = $currentPage->parent;
                $categoryLink = $category->type === 'page' ? url(app()->getLocale() . '/' . $category->slug) : '#';
            @endphp
                <h3 class="sidebar__title" href="{{ $categoryLink }}">
                    <span>{{ $category->title }}</span>
                </h3>
                <ul class="sidebar__list">
                    @foreach($category->children as $menu)
                        @php
                            $link = $menu->type === 'page' ? url(app()->getLocale() . '/' . $menu->slug) : '#';
                            $isActive = $menu->id == $currentPage->id;
                        @endphp
                        <li class="sidebar__list--item {{ $isActive ? 'active' : '' }}">
                            <a class="sidebar__link" href="{{ $link }}">
                                <span>{{ $menu->title }}</span>
                            </a>
                        </li>
                    @endforeach
                </ul>
        @else

            <li class="active">
                <a href="{{ $currentPage->type === 'page' ? url(app()->getLocale() . '/' . $currentPage->slug) : '#' }}">
                    <span>{{ $currentPage->title }}</span>
                </a>
            </li>
        @endif
    @endif
</div>
</div>
</div>
                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        const dropdownItems = document.querySelectorAll('.sidebar__list--item.has-dropdown');

                        dropdownItems.forEach(item => {
                            const button = item.querySelector('.sidebar__button');
                            const dropdown = item.querySelector('.sidebar__dropdown');

                            if (button) {
                                button.addEventListener('click', function (e) {
                                    e.preventDefault();

                                    // Toggle current item
                                    item.classList.toggle('open');

                                    // Close other dropdowns
                                    dropdownItems.forEach(otherItem => {
                                        if (otherItem !== item) {
                                            otherItem.classList.remove('open');
                                        }
                                    });
                                });
                            }
                        });
                    });
                </script>