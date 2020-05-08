<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class FabricanteRequest extends FormRequest
{
    public function rules()
    {
        return [
            'nombre' => ['required', Rule::unique('fabricantes')->ignore($this->route('fabricante'))],
            'categoria_fabricante_id' => ['required'],
        ];
    }
}
