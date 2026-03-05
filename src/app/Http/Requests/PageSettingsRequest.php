<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PageSettingsRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'category' => 'nullable|string|max:255',
            'fields' => 'required|array',
            'fields.*.id' => 'nullable|integer',
            'fields.*.key' => 'required|string',
            'fields.*.label' => 'required|string',
            'fields.*.type' => 'required|string|in:text,textarea,select,number,relation,textarea-editor,datetime-local,', // allowed types
            'fields.*.required' => 'nullable|in:on,off',
            'fields.*.is_translatable' => 'nullable|in:on,off',
            'fields.*.sort' => 'nullable|integer',
            'fields.*.options' => 'nullable|string',
            'fields.*.relation' => 'nullable|string',
            'fields.*.relation_table_name' => 'nullable|string',
            'fields.*.selection_type' => 'nullable|string',
        ];
    }
    public function messages(): array
    {
        return [
            'category.string' => 'The category must be a string.',
            'category.max' => 'The category may not be greater than 255 characters.',

            'fields.required' => 'The fields array is required.',
            'fields.array' => 'The fields must be an array.',

            'fields.*.id.integer' => 'Each field ID must be an integer.',

            'fields.*.key.required' => 'Each field must have a key.',
            'fields.*.key.string' => 'Each field key must be a string.',

            'fields.*.label.required' => 'Each field must have a label.',
            'fields.*.label.string' => 'Each field label must be a string.',

            'fields.*.type.required' => 'Each field must have a type.',
            'fields.*.type.string' => 'Each field type must be a string.',
            'fields.*.type.in' => 'Each field type must be one of: text, textarea, select, number, relation, textarea-editor, datetime-local.',

            'fields.*.required.in' => 'The required value must be either "on" or "off".',
            'fields.*.is_translatable.in' => 'The translatable value must be either "on" or "off".',

            'fields.*.sort.integer' => 'The sort value must be an integer.',

            'fields.*.options.string' => 'The options must be a string.',
            'fields.*.relation.string' => 'The relation must be a string.',
        ];
    }
}
