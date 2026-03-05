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

            'week_short'          => ['nullable', 'array'],
            'week_short.*'        => ['nullable', 'string', 'max:1000'],

            'meta_description'             => ['nullable', 'array'],
            'meta_description.*'           => ['nullable', 'string', 'max:500'],


            'week_long'             => ['nullable', 'array'],
            'week_long.*'           => ['nullable', 'string', 'max:500'],


            'month_short'          => ['nullable', 'array'],
            'month_short.*'        => ['nullable', 'string', 'max:1000'],
            'month_long'          => ['nullable', 'array'],
            'month_long.*'        => ['nullable', 'string', 'max:1000'],

            'meta_keywords'             => ['nullable', 'array'],
            'meta_keywords.*'           => ['nullable', 'string', 'max:500'],

            'email'                     => ['nullable', 'email'],
            'status'                    => ['nullable', 'boolean'],

            'main_page_id' => ['required','integer','exists:menu_mains,id'],

            'admin_ips'                 => ['nullable', 'string'],
            'search_ids'             => ['nullable', 'array'],
            'search_ids.*'           =>  ['required','integer','exists:menu_mains,id'],
            'sorting_ids'             => ['nullable', 'array'],
            'sorting_ids.*'           =>  ['required','integer','exists:menu_mains,id'],
            'chat_id'=>'nullable|string|max:255',
            'default_lang'=>'required|string|exists:langs,code',
            'bot_token'=>'nullable|string|max:500',
            'main_image_input' => 'nullable|string',
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
    public function messages(): array
    {
        return [
            // Массивы (Мультиязычные поля)
            'title.*.string'           => 'Заголовок должен быть строкой.',
            'title.*.max'              => 'Заголовок не может быть длиннее 255 символов.',

            'week_short.*.max'         => 'Краткое описание недели слишком длинное (макс. 1000 симв.).',
            'week_long.*.max'          => 'Полное описание недели не может превышать 500 символов.',

            'month_short.*.max'        => 'Краткое описание месяца не может превышать 1000 символов.',
            'month_long.*.max'         => 'Полное описание месяца не может превышать 1000 символов.',

            // SEO
            'meta_description.*.max'   => 'Meta-описание не должно превышать 500 символов.',
            'meta_keywords.*.max'      => 'Meta-ключевые слова не должны превышать 500 символов.',

            // Контакты и системные поля
            'email.email'              => 'Введите корректный адрес электронной почты.',
            'status.boolean'           => 'Статус должен быть "включен" или "выключен".',
            'chat_id.max'              => 'ID чата не может быть длиннее 255 символов.',
            'bot_token.max'            => 'Токен бота слишком длинный.',
            'admin_ips.string'         => 'Список IP-адресов должен быть строкой.',
            'main_image_input.string'  => 'Путь к изображению должен быть строкой.',

            // Связи (ID)
            'main_page_id.required'    => 'Необходимо выбрать главную страницу.',
            'main_page_id.exists'      => 'Выбранная главная страница не существует.',

            'search_ids.*.required'    => 'ID в списке поиска обязателен.',
            'search_ids.*.exists'      => 'Один из выбранных ID для поиска не найден.',

            'sorting_ids.*.required'   => 'ID в списке сортировки обязателен.',
            'sorting_ids.*.exists'     => 'Один из выбранных ID для сортировки не найден.',
            'default_lang.required'    => 'Необходимо выбрать Выбор языка по умолчанию',
            'default_lang.exists'      => 'Выбранный язык по умолчанию не найден в системе.',
        ];
    }
}
