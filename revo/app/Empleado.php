<?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class Empleado extends Model {
    protected $table = 'empleados';
    protected $fillable = [
        'nombre',
        'apellido',
        'telefono',
        'fecha_contrato'
    ];

    //protected $hidden = [ ‘password’ ];
}