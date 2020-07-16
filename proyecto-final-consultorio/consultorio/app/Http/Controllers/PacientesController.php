<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pacientes;

class PacientesController extends Controller
{
    public function get(Request $request, $id){
      return Pacientes::findOrFail($id);
    }
    
    public function list(Request $request){
      return Pacientes::get();
    }
    
    public function create(Request $request){
        
      $validatedData = $request->validate([
        'nombre' => 'required |max:255 ',
        'apellidos' => 'required |max:255 ',
        'direccion' => 'required ',
        'telefono' => 'required |max:255 ',
        'sexo' => 'required |max:1 ',
        'fecha_nacimiento' => 'required ',
        'alergias' => 'required ',
        'enfermedades_cronicas' => 'required ',
      ],[
        'nombre.required' => 'nombre is a required field.',
        'nombre.max' => 'nombre can only be 255 characters.',
        'apellidos.required' => 'apellidos is a required field.',
        'apellidos.max' => 'apellidos can only be 255 characters.',
        'direccion.required' => 'direccion is a required field.',
        'telefono.required' => 'telefono is a required field.',
        'telefono.max' => 'telefono can only be 255 characters.',
        'sexo.required' => 'sexo is a required field.',
        'sexo.max' => 'sexo can only be 1 characters.',
        'fecha_nacimiento.required' => 'fecha_nacimiento is a required field.',
        'alergias.required' => 'alergias is a required field.',
        'enfermedades_cronicas.required' => 'enfermedades_cronicas is a required field.',
      ]);

        $pacientes = Pacientes::create($request->all());    
        return $pacientes;
    }
    
    public function update(Request $request, $id){
      
      $validatedData = $request->validate([
        'nombre' => 'required |max:255 ',
        'apellidos' => 'required |max:255 ',
        'direccion' => 'required ',
        'telefono' => 'required |max:255 ',
        'sexo' => 'required |max:1 ',
        'fecha_nacimiento' => 'required ',
        'alergias' => 'required ',
        'enfermedades_cronicas' => 'required ',
      ],[
        'nombre.required' => 'nombre is a required field.',
        'nombre.max' => 'nombre can only be 255 characters.',
        'apellidos.required' => 'apellidos is a required field.',
        'apellidos.max' => 'apellidos can only be 255 characters.',
        'direccion.required' => 'direccion is a required field.',
        'telefono.required' => 'telefono is a required field.',
        'telefono.max' => 'telefono can only be 255 characters.',
        'sexo.required' => 'sexo is a required field.',
        'sexo.max' => 'sexo can only be 1 characters.',
        'fecha_nacimiento.required' => 'fecha_nacimiento is a required field.',
        'alergias.required' => 'alergias is a required field.',
        'enfermedades_cronicas.required' => 'enfermedades_cronicas is a required field.',
      ]);

        $pacientes = Pacientes::findOrFail($id);
        $input = $request->all();
        $pacientes->fill($input)->save();
        return $pacientes;
    }
    
    public function delete(Request $request, $id){
        $pacientes = Pacientes::findOrFail($id);
        $pacientes->delete();
    }
}
 ?>