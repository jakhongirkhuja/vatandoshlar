<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class PageSectionRequest extends FormRequest
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
        $sectionId = $this->route('section_id');
        return [
            'category_name' => 'nullable|string',
            'slug' => [
                'nullable',
                'string',
                Rule::unique('page_sections', 'slug')
                    ->ignore($sectionId),
            ],
            'fields' => 'required|array',
            'parent_id' => 'nullable|exists:page_sections,id',
            'status' => 'nullable|in:on,off',
            'images' => 'nullable|array',
            'images.*' => 'file|mimes:jpeg,jpg,png,gif,svg|max:5120',
            'main_image_input' => 'nullable|string',
        ];
    }
}
