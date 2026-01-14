<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

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
            'username' => 'nullable|unique:users,username|string|between:2,100',
            'name' => 'nullable|string|max:255',
            'status' => 'nullable|in:0,1',
            'password' => [
                'nullable',
                'string',
                'min:8',
                'regex:/[A-Z]/',        
                'regex:/[\W_]/',      
            ],
            'role_id' => 'nullable|exists:roles,id',
        ];
    }
}
