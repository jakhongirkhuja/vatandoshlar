<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Validator;

class SettingStoreRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'title'                     => ['nullable', 'array'],
            'title.*'                   => ['nullable', 'string', 'max:255'],

            'meta_description'          => ['nullable', 'array'],
            'meta_description.*'        => ['nullable', 'string', 'max:1000'],

            'meta_keywords'             => ['nullable', 'array'],
            'meta_keywords.*'           => ['nullable', 'string', 'max:500'],

            'email'                     => ['nullable', 'email'],
            'status'                    => ['nullable', 'boolean'],

            'main_page_id'              => ['required', 'numeric','exists:menu_mains,id'],

            'admin_ips'                 => ['nullable', 'string'],
        ];
    }


    protected function prepareForValidation(): void
    {
        $this->merge([
            'status' => $this->has('status'),

            'admin_ips' => $this->admin_ips
                ? implode(', ', array_map('trim', explode(',', $this->admin_ips)))
                : null,
        ]);
    }

    public function withValidator(Validator $validator): void
    {
        $validator->after(function ($validator) {
            if (!$this->admin_ips) {
                return;
            }

            $ips = array_map('trim', explode(',', $this->admin_ips));

            foreach ($ips as $ip) {
                if (!filter_var($ip, FILTER_VALIDATE_IP)) {
                    $validator->errors()->add(
                        'admin_ips',
                        "Неверный IP адрес: {$ip}"
                    );
                    break;
                }
            }
        });
    }
}
