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
        $langId = $this->route('lang') ? $this->route('lang')->id : null;

        return [
            'code' => [
                'required',
                'string',
                'max:10',
                Rule::unique('langs', 'code')->ignore($langId),
            ],
            'name' => 'required|string|max:50',
            'direction' => 'required|in:ltr,rtl',
            'status' => 'required|boolean',
            'is_default' => 'required|boolean',
            'locale' => 'nullable|string|max:10',
            'flag_icon' => 'nullable|string|max:255',
        ];
    }
}
