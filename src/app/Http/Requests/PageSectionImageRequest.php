<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PageSectionImageRequest extends FormRequest
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
            'files' => 'required|array',
            'files.*' => 'file|mimes:jpeg,jpg,png,gif,svg,mp4,webm,ogg,mov,avi|max:51200',

        ];
    }
}
