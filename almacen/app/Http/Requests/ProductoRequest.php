<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ProductoRequest extends FormRequest
{
    public function rules()
    {
        return [
            'nombre' => ['required', Rule::unique('productos')->ignore($this->route('producto'))],
        ];
    }
}
