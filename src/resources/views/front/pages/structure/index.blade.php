@extends('front.layouts.layout')

@section('body')
@include('front.components.breadcrumbs')

<div class="layout">
    <div class="container">
        <div class="layout-content">
            <img src="{{sectionImages($items[0],true)}}" width="100%" height="auto">
        </div>

        @include('front.components.sidebar')

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
    </div>
</div>
<script>
    Fancybox.bind("[data-fancybox]", {
        thumbs: false
    });
</script>
@endsection