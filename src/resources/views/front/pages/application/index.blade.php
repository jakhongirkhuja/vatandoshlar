<div class="projects__apply">
  @include('admin.components.error')
    <div class="projects__apply-wrapper content">
        <h2 class="title">Ishtirok etish uchun ariza yuborish</h2>
       <input type="hidden" name="type" value="application">
      <form class="apply-form" action="{{ route('support.create') }}" method="post">
    @csrf
    <div class="form-row form-row--name-date">
        <div class="form-field">
            <label for="fullname">Iltimos F.I.SH.ni to'liq kiriting:</label>
            <input type="text" id="fullname" name="data[name]" class="form-control" placeholder="Kiriting" required>
        </div>

        <div class="form-field">
            <label for="birthdate">Tug'ilgan sana:</label>
            <input type="date" id="birthdate" name="data[birthdate]" class="form-control" required>
        </div>
    </div>

    <div class="form-field">
        <label for="specialization">Mutaxassisligi:</label>
        <select name="data[job]" id="specialization" class="form-control" required>
            <option value="">Mutaxassislikni tanlang</option>
            @foreach($jobs as $job)
                <option value="{{ $job->id }}">
                    {{ sectionValue($job,'title') }}
                </option>
            @endforeach
        </select>
    </div>

    <div class="form-field">
        <label for="address">Yashash manzili:</label>
        <input type="text" id="address" name="data[address]" class="form-control" placeholder="Manzilni kiriting" required>
    </div>

    <div class="form-field">
        <label for="extra_info">Email, telefon yoki boshqa bog‘lanish ma’lumoti:</label>
        <input type="text" id="extra_info" name="data[extra_info]" class="form-control" placeholder="Bog‘lanish ma’lumoti" required>
    </div>
     <div class="form-field">
        <label for="description">Takliflar:</label>
        <input type="text" id="description" name="data[description]" class="form-control" placeholder="Kiriting" required>
    </div>

    <button type="submit">Yuborish</button>
</form>

    </div>

</div>