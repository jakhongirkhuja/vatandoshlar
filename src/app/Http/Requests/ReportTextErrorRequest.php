<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ReportTextErrorRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'data' => 'required|array',
            'data.pageUrl' => 'required|string',
            'data.line' => 'required|string',
            'data.selectedText' => 'required|string',
            'chat_id'=>'nullable|string',
        ];
    }
}
