<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class GamerRequest extends FormRequest
{
    public function rules()
    {
        return [
            'name' => ['required', Rule::unique('gamers')->ignore($this->route('gamer'))],
        ];
    }
}
