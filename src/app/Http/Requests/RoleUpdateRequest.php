<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RoleUpdateRequest extends FormRequest
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
            'name'=>'required|string|max:255',
             'menus' => 'nullable|array',
            'menus.*' => 'integer|exists:menu_mains,id|min:1',
        ];
    }
    public function messages(): array
    {
        return [
            'name.required' => 'Поле "Название" обязательно для заполнения.',
            'name.string'   => 'Название должно быть текстовой строкой.',
            'name.max'      => 'Название не должно превышать 255 символов.',

            'menus.array'   => 'Поле "Меню" должно быть массивом.',

            'menus.*.integer' => 'Выбранный пункт меню должен быть числовым идентификатором.',
            'menus.*.exists'  => 'Один из выбранных пунктов меню не существует в базе данных.',
            'menus.*.min'     => 'ID меню должен быть не меньше 1.',
        ];
    }
}
