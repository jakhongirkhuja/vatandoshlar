<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MenuMainSettinsRequest extends FormRequest
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
            'fields' => 'required|array',
            'fields.*.id' => 'nullable|integer',
            'fields.*.key' => 'required|string',
            'fields.*.label' => 'required|string',
            'fields.*.type' => 'required|string|in:text,textarea,number,select,relation,textarea-editor,datetime-local',
            'fields.*.required' => 'nullable|in:on,off',
            'fields.*.is_translatable' => 'nullable|in:on,off',
            'fields.*.sort' => 'nullable|integer',
            'fields.*.options' => 'nullable|array',
            'fields.*.relation' => 'nullable|string',
        ];
    }
}
