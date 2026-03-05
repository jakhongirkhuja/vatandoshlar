<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
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
            'username' => 'required|exists:users,username',
            'password' => 'required',
            'captcha' => 'required|captcha'
        ];
    }
    public function messages(): array
    {
        return [
            'username.required' => 'Имя Пользователя обязательно.',
            'username.exists' => 'Имя пользователя должно существовать.',
            'password.required' => 'Требуется пароль.',
            'captcha.required' => 'Требуется капча.',
            'captcha.captcha' => 'Ошибка капчи.',
        ];
    }
}
