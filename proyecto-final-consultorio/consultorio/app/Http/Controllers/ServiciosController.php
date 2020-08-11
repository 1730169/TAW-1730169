<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Servicios;
use DB;

class ServiciosController extends Controller
{
    public function get(Request $request, $id){
      return Servicios::findOrFail($id);
    }
    
    public function list(Request $request){
      // OBTENER EL ID DEL DOCTOR QUE TIENE SESION ACTIVA
      $usuario = auth()->user();
      $user_id = $usuario->id;

      // EVALUAR EL ROL QUE POSEE
      $roles = $usuario->menuroles;

      $query ="";

      // SI EL USUARIO ES UN DOCTOR
      if (strpos($roles, 'doctor') !== false) {        
        $doctor_id = DB::table('doctores')->select('id')->where('user_id','=',"".$user_id)->first();

        $query = DB::table('servicios')
        ->join('doctores', 'doctores.id', '=', 'servicios.doctor_id')
        ->select('servicios.*', DB::raw("CONCAT(doctores.nombre,' ',doctores.apellidos,' [' ,doctores.especialidad,']') AS doctor") )
        ->where('servicios.doctor_id','=', $doctor_id->id)
        ->get();
        

        return $query;

      }else if (strpos($roles, 'admin') !== false){
        $query = DB::table('servicios')
        ->join('doctores', 'doctores.id', '=', 'servicios.doctor_id')
        ->select('servicios.*', DB::raw("CONCAT(doctores.nombre,' ',doctores.apellidos,' [' ,doctores.especialidad,']') AS doctor") )
        ->get();
        
        return $query;
      }else{
        $query = "";
        
        return $query;
      }




      $query = DB::table('servicios')
            ->join('doctores', 'doctores.id', '=', 'servicios.doctor_id')
            ->select('servicios.*', DB::raw("CONCAT(doctores.nombre,' ',doctores.apellidos,' [' ,doctores.especialidad,']') AS doctor") )
            ->get();
      //return Servicios::get();
      return $query;
    }
    
    public function create(Request $request){
        
      $validatedData = $request->validate([
        'doctor_id' => 'required |max:20 ',
        'nombre' => 'required |max:255 ',
        'descripcion' => 'required ',
        'costo' => 'required |max:10 ',
      ],[
        'doctor_id.required' => 'doctor_id is a required field.',
        'doctor_id.max' => 'doctor_id can only be 20 characters.',
        'nombre.required' => 'nombre is a required field.',
        'nombre.max' => 'nombre can only be 255 characters.',
        'descripcion.required' => 'descripcion is a required field.',
        'costo.required' => 'costo is a required field.',
        'costo.max' => 'costo can only be 10 characters.',
      ]);

        $servicios = Servicios::create($request->all());    
        return $servicios;
    }
    
    public function update(Request $request, $id){
      
      $validatedData = $request->validate([
        'doctor_id' => 'required |max:20 ',
        'nombre' => 'required |max:255 ',
        'descripcion' => 'required ',
        'costo' => 'required |max:10 ',
      ],[
        'doctor_id.required' => 'doctor_id is a required field.',
        'doctor_id.max' => 'doctor_id can only be 20 characters.',
        'nombre.required' => 'nombre is a required field.',
        'nombre.max' => 'nombre can only be 255 characters.',
        'descripcion.required' => 'descripcion is a required field.',
        'costo.required' => 'costo is a required field.',
        'costo.max' => 'costo can only be 10 characters.',
      ]);

        $servicios = Servicios::findOrFail($id);
        $input = $request->all();
        $servicios->fill($input)->save();
        return $servicios;
    }
    
    public function delete(Request $request, $id){
        $servicios = Servicios::findOrFail($id);
        $servicios->delete();
    }
}
 ?>