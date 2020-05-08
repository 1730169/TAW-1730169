<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class CategoriaFabricanteRequest extends FormRequest
{
    public function rules()
    {
        return [
            'nombre' => ['required', Rule::unique('categoria_fabricantes')->ignore($this->route('categoria_fabricante'))],
        ];
    }
}
