<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UserUpdateRequest extends FormRequest
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
            'username' => [
                'nullable',
                'string',
                'between:2,100',
                Rule::unique('users', 'username')->ignore($this->user?->id),
            ],
            'name' => ['nullable', 'string', 'max:255'],
            'status' => ['nullable', 'in:0,1'],
            'password' => [
                'nullable',
                'string',
                'min:8',
                'regex:/[A-Z]/',      // Минимум одна заглавная буква
                'regex:/[\W_]/',      // Минимум один спецсимвол
            ],
            'role_id' => ['nullable', 'exists:roles,id'],
        ];
    }
    public function messages()
    {
        return [
            'username.unique' => 'Этот логин уже занят.',
            'username.between' => 'Логин должен быть от 2 до 100 символов.',
            'password.min' => 'Пароль должен быть не менее 8 символов.',
            'password.regex' => 'Пароль должен содержать хотя бы одну заглавную букву и один специальный символ.',
            'status.in' => 'Выбранный статус некорректен.',
            'role_id.exists' => 'Выбранная роль не существует.',
        ];
    }

}
