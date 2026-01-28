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
            'image'   => 'required|array',
            'image.*' => 'file|mimes:mp4,jpg,jpeg,png,pdf,doc,docx,excel|max:5000',
            'chat_id'=>'nullable|string',
        ];
    }
    public function messages(): array
    {
        return [

            'required' => ':attribute maydonini toʻldirish shart.',
            'string'   => ':attribute maydoni qator (string) boʻlishi kerak.',
            'array'    => ':attribute maydoni massiv boʻlishi kerak.',
            'email'    => 'Haqiqiy elektron pochta manzilingizni kiriting.',
            'in'       => 'Tanlangan :attribute notoʻgʻri.',

            'image.required' => 'Hujjatlarni yuklash shart.',
            'image.*.file'   => 'Yuklanayotgan obyekt fayl boʻlishi kerak.',
            'image.*.mimes'  => 'Faqat quyidagi formatdagi fayllarni yuklash mumkin: Image, pdf, doc, docx, excel.',
            'image.*.max'    => 'Fayl hajmi 3 MB dan oshmasligi kerak.',
        ];
    }
    public function attributes(): array
    {
        return [
            'type'                => 'Shakl turi',
            'data.name'           => 'F.I.O.',
            'data.birthdate'      => 'Tugʻilgan sana',
            'data.gender'         => 'Jins',
            'data.email'          => 'E-mail',
            'data.phone'          => 'Telefon raqami',
            'data.country'        => 'Mamlakat',
            'data.city'           => 'Shahar',
            'data.workplace'      => 'Ish joyi',
            'data.position'       => 'Lavozim',
            'data.education'      => 'Maʼlumoti',
            'data.specialization' => 'Mutaxassisligi',
            'image'               => 'Hujjatlar',
            'image.*'             => 'Fayl',
        ];
    }
}
