<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class VentaRequest extends FormRequest
{
    public function rules()
    {
        return [
            //'name' => ['required', Rule::unique('ventas')->ignore($this->route('venta'))],
            'gamer_id' => ['required'],
            'nombre_articulo' => ['required'],
            'cantidad' => ['required'],
        ];
    }
}
