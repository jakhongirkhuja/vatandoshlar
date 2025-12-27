<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class ContentUpdateRequest extends FormRequest
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
    $contentId = $this->route('id');

        return [
            'fields' => 'required|array',
            'slug' => [
                'nullable',
                'string',
                'required_if:type,page',
                Rule::unique('contents', 'slug')->ignore($contentId),
            ],
            'icon' => 'nullable|string',
            'parent_id' => 'nullable|exists:contents,id',

            'show_admin' => 'nullable|in:on,off',
            'status' => 'nullable|in:on,off',
//            'images'=>'required',
            'images' => 'nullable|array',
             'images.*' => 'file|mimes:jpeg,jpg,png,gif,svg,mp4,webm,ogg,mov,avi|max:51200',
            'main_image_input'=>'nullable|string',
        ];
}
}
