<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Doctores;

class DoctoresController extends Controller
{
    public function get(Request $request, $id){
      return Doctores::findOrFail($id);
    }
    
    public function list(Request $request){
      return Doctores::get();
    }
    
    public function create(Request $request){
        
      $validatedData = $request->validate([
        'nombre' => 'required |max:255 ',
        'apellidos' => 'required |max:255 ',
        'direccion' => 'required ',
        'telefono' => 'required |max:255 ',
        'fecha_nacimiento' => 'required ',
        'titulo' => 'required |max:255 ',
        'especialidad' => 'required |max:255 ',
        'cedula' => 'required |max:255 ',
        'consultorio' => 'required |max:255 ',
      ],[
        'nombre.required' => 'nombre is a required field.',
        'nombre.max' => 'nombre can only be 255 characters.',
        'apellidos.required' => 'apellidos is a required field.',
        'apellidos.max' => 'apellidos can only be 255 characters.',
        'direccion.required' => 'direccion is a required field.',
        'telefono.required' => 'telefono is a required field.',
        'telefono.max' => 'telefono can only be 255 characters.',
        'fecha_nacimiento.required' => 'fecha_nacimiento is a required field.',
        'titulo.required' => 'titulo is a required field.',
        'titulo.max' => 'titulo can only be 255 characters.',
        'especialidad.required' => 'especialidad is a required field.',
        'especialidad.max' => 'especialidad can only be 255 characters.',
        'cedula.required' => 'cedula is a required field.',
        'cedula.max' => 'cedula can only be 255 characters.',
        'consultorio.required' => 'consultorio is a required field.',
        'consultorio.max' => 'consultorio can only be 255 characters.',
      ]);

        $doctores = Doctores::create($request->all());    
        return $doctores;
    }
    
    public function update(Request $request, $id){
      
      $validatedData = $request->validate([
        'nombre' => 'required |max:255 ',
        'apellidos' => 'required |max:255 ',
        'direccion' => 'required ',
        'telefono' => 'required |max:255 ',
        'fecha_nacimiento' => 'required ',
        'titulo' => 'required |max:255 ',
        'especialidad' => 'required |max:255 ',
        'cedula' => 'required |max:255 ',
        'consultorio' => 'required |max:255 ',
      ],[
        'nombre.required' => 'nombre is a required field.',
        'nombre.max' => 'nombre can only be 255 characters.',
        'apellidos.required' => 'apellidos is a required field.',
        'apellidos.max' => 'apellidos can only be 255 characters.',
        'direccion.required' => 'direccion is a required field.',
        'telefono.required' => 'telefono is a required field.',
        'telefono.max' => 'telefono can only be 255 characters.',
        'fecha_nacimiento.required' => 'fecha_nacimiento is a required field.',
        'titulo.required' => 'titulo is a required field.',
        'titulo.max' => 'titulo can only be 255 characters.',
        'especialidad.required' => 'especialidad is a required field.',
        'especialidad.max' => 'especialidad can only be 255 characters.',
        'cedula.required' => 'cedula is a required field.',
        'cedula.max' => 'cedula can only be 255 characters.',
        'consultorio.required' => 'consultorio is a required field.',
        'consultorio.max' => 'consultorio can only be 255 characters.',
      ]);

        $doctores = Doctores::findOrFail($id);
        $input = $request->all();
        $doctores->fill($input)->save();
        return $doctores;
    }
    
    public function delete(Request $request, $id){
        $doctores = Doctores::findOrFail($id);
        $doctores->delete();
    }
}
 ?>