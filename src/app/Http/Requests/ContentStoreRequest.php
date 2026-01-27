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
//            'fields.*.key' => 'required|string|unique:content,key',
            'icon' => 'nullable|string',
            'parent_id' => 'nullable|exists:menu_mains,id',
            'category' => 'required|string',
            'show_admin' => 'nullable|in:on,off',
            'status' => 'nullable|in:on,off',
            'images' => 'nullable|array',
            'images.*' => 'file|mimes:jpeg,jpg,png,gif,svg,mp4,webm,ogg,mov,avi|max:51200',
            'main_image_input' => 'nullable|string',
        ];
    }
    public function messages(): array
    {
        return [
            // Fields
            'fields.required' => 'Поле "Данные" (fields) обязательно для заполнения.',
            'fields.array'    => 'Поле "Данные" должно быть массивом.',

            // Icon
            'icon.string'     => 'Поле "Иконка" должно быть строкой.',

            // Parent ID
            'parent_id.exists' => 'Выбранный родительский пункт меню не существует.',

            // Category
            'category.required' => 'Поле "Категория" обязательно для заполнения.',
            'category.string'   => 'Название категории должно быть строкой.',

            // Status & Show Admin
            'show_admin.in' => 'Значение поля "Показать админу" должно быть "on" или "off".',
            'status.in'     => 'Значение статуса должно быть "on" или "off".',

            // Images
            'images.array'   => 'Поле изображений должно быть массивом файлов.',
            'images.*.file'  => 'Объект должен быть файлом.',
            'images.*.mimes' => 'Допустимые форматы: изображения (jpg, png, svg) или видео (mp4, mov, avi).',
            'images.*.max'   => 'Максимальный размер файла — 50 МБ.',

            // Main Image Input
            'main_image_input.string' => 'Путь к главному изображению должен быть строкой.',
        ];
    }
}
