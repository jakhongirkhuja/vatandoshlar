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
            'publish_at' => 'nullable|date',
            'status' => 'nullable|in:on,off',
            // 'images' => 'nullable|array',
            // 'images.*' => [
            //     'file',
            //     'max:51200', // 50 MB
            //     function ($attribute, $value, $fail) {
            //         $allowed = ['jpg', 'jpeg', 'png', 'gif', 'svg', 'mp4', 'webm', 'ogg', 'mov', 'avi'];
            //         dd( $value->getClientOriginalExtension());
            //         $ext = strtolower($value->getClientOriginalExtension());
            //         if (!in_array($ext, $allowed)) {
            //             $fail("The $attribute must be one of: " . implode(', ', $allowed));
            //         }
            //     }
            // ],
            'images' => 'nullable|array',
            'images.*' => 'file|mimes:jpeg,jpg,png,gif,svg,mp4,webm,ogg,mov,avi|max:51200',
            'main_image_input' => 'nullable|string',
            'publish_at'=> 'nullable|date',
        ];
    }
    public function messages(): array
    {
        return [
            // Category Name
            'category_name.string' => 'Название категории должно быть строкой.',

            // Slug
            'slug.string' => 'URL-путь (slug) должен быть строковой.',
            'slug.unique' => 'Такой URL-путь (slug) уже занят.',

            // Fields
            'fields.required' => 'Поле "Поля" обязательно для заполнения.',
            'fields.array'    => 'Поле "Поля" должно быть массивом.',

            // Parent ID
            'parent_id.exists' => 'Выбранная родительская категория не существует.',

            // Publish At
            'publish_at.date' => 'Поле "Дата публикации" должно быть корректной датой.',

            // Status
            'status.in' => 'Статус должен быть либо "on", либо "off".',

            // Images
            'images.array'   => 'Поле изображений должно быть списком.',
            'images.*.file'  => 'Каждый элемент в списке изображений должен быть файлом.',
            'images.*.mimes' => 'Допустимые форматы файлов: jpeg, jpg, png, gif, svg, mp4, webm, ogg, mov, avi.',
            'images.*.max'   => 'Размер файла не должен превышать 50 МБ.',

            // Main Image Input
            'main_image_input.string' => 'Данные главного изображения должны быть строкой.',
        ];
    }
}
