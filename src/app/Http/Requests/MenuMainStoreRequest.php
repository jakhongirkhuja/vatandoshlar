<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MenuMainStoreRequest extends FormRequest
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
            'type' => 'required|in:category,page,url,section',
            'slug' => 'nullable|string|required_if:type,page|unique:menu_mains,slug',
            'url' => 'nullable|string|required_if:type,url',
            'icon' => 'nullable|string',
            'parent_id' => 'nullable|exists:menu_mains,id',

            'test' => 'nullable|in:on,off',
            'show_admin' => 'nullable|in:on,off',
            'status' => 'nullable|in:on,off',
            'images' => 'nullable|array',
            'images.*' => 'file|mimes:jpeg,jpg,png,gif,svg,mp4,webm,ogg,mov,avi|max:51200', 
            'main_image_input'=>'nullable|string',
        ];
    }
}
