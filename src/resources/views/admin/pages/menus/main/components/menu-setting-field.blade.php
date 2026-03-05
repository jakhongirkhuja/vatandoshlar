<div class="card p-3 mb-3 field-item">
    <div class="d-flex justify-content-between">
        <h5>Field #__INDEX__</h5>
        <button type="button" class="btn btn-danger btn-sm remove-field">X</button>
    </div>

    <div class="row">
        <div class="col-md-12 mb-2">
            <label>Key</label>
            <input type="text" required name="fields[__INDEX__][key]" class="form-control keys">
        </div>

        <div class="col-md-12 mb-2">
            <label>Label</label>
            <input type="text" required name="fields[__INDEX__][label]" class="form-control">
        </div>
        <div class="col-md-12 mb-2">
            <label>Type</label>
            <select name="fields[__INDEX__][type]" class="form-control"  data-index="__INDEX__" >
                <option value="text">Text</option>
                <option value="number">Integer</option>
                <option value="textarea">Textarea</option>
                 <option value="textarea-editor">Textarea Editor</option>
                <option  value="datetime-local">Date-time</option>
                <option value="select">Select-Option</option>
                <option value="relation">relation</option>
            </select>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3 mb-2">
            <div class="custom-control custom-switch mr-2 mb-1">
                <p class="mb-0">Required</p>
                <input type="checkbox" class="custom-control-input" checked name="fields[__INDEX__][required]" id="customSwitch2__INDEX__">
                <label class="custom-control-label" for="customSwitch2__INDEX__"></label>
            </div>


        </div>
        <div class="col-md-3 mb-2">
            <div class="custom-control custom-switch mr-2 mb-1">
                <p class="mb-0">Translatable</p>
                <input type="checkbox" class="custom-control-input" checked name="fields[__INDEX__][is_translatable]" id="customSwitch__INDEX__">
                <label class="custom-control-label" for="customSwitch__INDEX__"></label>
            </div>
        </div>
        <div class="col-md-12 mb-2">
            <label>Sort Order</label>
            <input type="number" name="fields[__INDEX__][sort]" class="form-control" value="0">
        </div>
        <div class="col-md-12 mb-2">
            <label>Options (comma separated)</label>
            <input type="text" name="fields[__INDEX__][options]" class="form-control">
        </div>
        <div class="col-md-12 mb-2 relation-extra" style="display:none;">
            <label>Relation Type</label>

            <div>
                <label>
                    <input type="radio"
                           name="fields[__INDEX__][relation_table_name]"
                           value="menu"
                           class="relation-radio">
                    Menu
                </label>

                <label class="ml-3">
                    <input type="radio"
                           name="fields[__INDEX__][relation_table_name]"
                           value="content"
                           class="relation-radio">
                    Content
                </label>
            </div>

            <div class="mt-2">
                <label>Select Item</label>
                <select name="fields[__INDEX__][relation]"
                        class="form-control relation-select">
                </select>
            </div>

            <div class="mt-3">
                <label>
                    <input type="radio"
                           name="fields[__INDEX__][selection_type]"
                           value="single">
                    Single
                </label>

                <label class="ml-3">
                    <input type="radio"
                           name="fields[__INDEX__][selection_type]"
                           value="multiple">
                    Multiple
                </label>
            </div>
        </div>
    </div>
</div>
