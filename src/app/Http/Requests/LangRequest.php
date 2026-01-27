<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
class LangRequest extends FormRequest
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
        $langId = $this->route('lang') ? $this->route('lang') : null;
        return [
            'code' => [
                'required',
                'string',
                'max:10',
                Rule::unique('langs', 'code')->ignore($langId),
            ],

            'name' => 'required|string|max:50',

            'status' => 'required|boolean',
            'images' => 'nullable|array',
            'images.*' => 'file|mimes:jpeg,jpg,png,gif,svg,mp4,webm,ogg,mov,avi|max:51200',
            'main_image_input' => 'nullable|string',
        ];
    }
    public function messages(): array
    {
        return [
            // Сообщения для поля Code
            'code.required' => 'Поле "Код" обязательно для заполнения.',
            'code.string'   => 'Код должен быть строкой.',
            'code.max'      => 'Код не должен превышать 10 символов.',
            'code.unique'   => 'Такой код языка уже существует.',

            // Поле Locale
            'locale.required' => 'Укажите локаль (например, ru или en).',
            'locale.max'      => 'Локаль не должна быть длиннее 10 символов.',

            // Поля Name и Short Name
            'name.required'       => 'Название обязательно для заполнения.',
            'name.max'            => 'Название не должно превышать 50 символов.',
            'short_name.required' => 'Короткое название обязательно.',
            'short_name.max'      => 'Короткое название не должно превышать 50 символов.',

            // Статус
            'status.required' => 'Выберите статус.',
            'status.boolean'  => 'Некорректное значение статуса.',

            // Валидация файлов (images)
            'images.array'   => 'Поле изображений должно быть массивом.',
            'images.*.file'  => 'Один из файлов загружен некорректно.',
            'images.*.mimes' => 'Допустимые форматы: jpeg, jpg, png, gif, svg, mp4, webm, ogg, mov, avi.',
            'images.*.max'   => 'Размер файла не должен превышать 50 МБ (51200 КБ).',
        ];
    }
}
