<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class CategoriaProductoRequest extends FormRequest
{
    public function rules()
    {
        return [
            'nombre' => ['required', Rule::unique('categoria_productos')->ignore($this->route('categoria_producto'))],
        ];
    }
}
