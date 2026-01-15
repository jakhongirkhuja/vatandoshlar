<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MainMenuImageUpdateRequest extends FormRequest
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
        $rules = [
            'slug' => 'required|in:menu,section,content,settings,langs',
            'img' => 'required|array|min:1',
        ];

        if ($this->slug === 'menu') {
            $rules['img.*'] = 'required|integer|exists:menu_main_images,id';
        }

        if ($this->slug === 'section') {
            $rules['img.*'] = 'required|integer|exists:page_section_images,id';
        }
        if ($this->slug === 'content') {
            $rules['img.*'] = 'required|integer|exists:content_images,id';
        }
        if ($this->slug === 'settings') {
            $rules['img.*'] = 'required|integer|exists:setting_images,id';
        }
        if ($this->slug === 'langs') {
            $rules['img.*'] = 'required|integer|exists:lang_images,id';
        }

        return $rules;
    }
}
