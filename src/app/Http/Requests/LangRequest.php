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
            'locale' => 'required|string|max:10',
            'name' => 'required|string|max:50',
            'short_name'=>'required|string|max:50',
            'status' => 'required|boolean',
            'images' => 'nullable|array',
            'images.*' => 'file|mimes:jpeg,jpg,png,gif,svg,mp4,webm,ogg,mov,avi|max:51200',
            'main_image_input' => 'nullable|string',
        ];
    }
}
