<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Doctores;
//use App\User;
use DB;

class DoctoresController extends Controller
{
    public function get(Request $request, $id){
      return Doctores::findOrFail($id);
    }
    
    public function list(Request $request){
      return Doctores::get();
    }

    public function doctor_select(Request $request){
      // OBTENER EL ID DEL DOCTOR QUE TIENE SESION ACTIVA
      $usuario = auth()->user();
      $user_id = $usuario->id;

      // EVALUAR EL ROL QUE POSEE
      $roles = $usuario->menuroles;

      $query ="";

      // SI EL USUARIO ES UN DOCTOR
      if (strpos($roles, 'doctor') !== false) {
        // Buscar el id
        $doctor_id = DB::table('doctores')->select('id')->where('user_id','=',"".$user_id)->first();

        // Retornar solo el objeto de ese doctor
        $query = DB::table('doctores')
            ->select('doctores.*')
            ->where('id','=',$doctor_id->id)->get();
        
        return $query;

      }else if (strpos($roles, 'admin') !== false){
        return Doctores::get();
      }else{

        return "";
      }
      
      //return Consultas::get();
      return $query;
    }

    public function getUsuariosDoctor(Request $request){
      // OBTENER LOS USUARIOS CON ROL DOCTOR ASIGNADO
      $query = DB::table('users')
          ->select('id','name','email')
          ->where('menuroles', 'LIKE','%doctor%')->get();
      
      return $query;
      //return User::get();
      //return "Hola";
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