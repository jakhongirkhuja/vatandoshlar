<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ContentStoreRequest extends FormRequest
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
            'icon' => 'nullable|string',
            'parent_id' => 'nullable|exists:menu_mains,id',
            
            'show_admin' => 'nullable|in:on,off',
            'status' => 'nullable|in:on,off',
            'images' => 'nullable|array',
            'images.*' => 'file|mimes:jpeg,jpg,png,gif,svg|max:5120',
            'content_image_input'=>'nullable|string',
        ];
    }
}
