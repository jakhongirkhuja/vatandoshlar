<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ParticipationRequest extends FormRequest
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
            'data.gender' => 'required|in:male,female',
            'data.email' => 'required|email',
            'data.phone' => 'required',
            'data.country' => 'required',
            'data.city' => 'required',
            'data.workplace' => 'required|string',
            'data.position' => 'required|string',
            'data.education' => 'required|string',
            'data.specialization' => 'required|string',
            'data.telegram' => 'nullable',
            'data.instagram' => 'nullable',
            'data.whatsapp' => 'nullable',
            'image' => 'required',
            'image.*' => 'nullable|max:10240'

        ];
    }
}
