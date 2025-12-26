<div class="row">
    <div class="col-3">
        <fieldset class="form-group">
            @php
                $options = [10, 20, 30, 50, 80, 100, 300, 500];
                $selectedPerPage = request('per_page', 20); // default to 20 if null
            @endphp
            <select class="form-control round text-center" name="per_page" id="basicSelect" onchange="updatePerPage(this)">
                @foreach($options as $option)
                    <option value="{{ $option }}" {{ $selectedPerPage == $option ? 'selected' : '' }}>
                        {{ $option }}
                    </option>
                @endforeach
            </select>
        </fieldset>
        <script >

            function updatePerPage(select) {
                const perPage = select.value;
                const url = new URL(window.location.href);
                url.searchParams.set('per_page', perPage); // add or update per_page param
                url.searchParams.set('page', 1); // optional: reset to first page
                window.location.href = url.toString(); // reload page
            }
        </script>
    </div>
    <div class="col-9">
        <form  method="GET">
            <div class="input-group">
                <input type="text" class="form-control round" placeholder="Поиск" name="s">
                <button class="btn btn-primary" type="submit">
                    <i class="feather icon-search"></i>
                </button>
            </div>
        </form>
    </div>
</div>
