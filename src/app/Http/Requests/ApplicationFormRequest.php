<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ApplicationFormRequest extends FormRequest
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
            'type' => 'required|string|in:form,application,participation',
            'data' => 'required|array',
            'data.name' => 'required|string',
            'data.birthdate' => 'required|string',
            'data.job' => 'required',
            'data.extra_info' => 'required',
            'data.address' => 'required',
            'data.description' => 'required|string',
        ];
    }
}
