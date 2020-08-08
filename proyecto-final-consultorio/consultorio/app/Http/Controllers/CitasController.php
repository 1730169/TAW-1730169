<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Citas;
use DB;
use Illuminate\Support\Facades\Auth;

class CitasController extends Controller
{
    public function get(Request $request, $id){
      
      return Citas::findOrFail($id);
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

        $query = DB::table('citas')
          ->join('doctores', 'doctores.id', '=', 'citas.doctor_id')
          ->join('pacientes', 'pacientes.id', '=', 'citas.paciente_id')
          ->select('citas.*', DB::raw("CONCAT(doctores.nombre,' ',doctores.apellidos,' [' ,doctores.especialidad,']') AS doctor"), DB::raw("CONCAT(pacientes.nombre,' ',pacientes.apellidos) AS paciente"))
          ->where('citas.doctor_id','=',$doctor_id->id)
          ->orderBy('fecha_cita', 'desc')->get();

        return $query;

      }else if (strpos($roles, 'admin') !== false){
        
        $query = DB::table('citas')
          ->join('doctores', 'doctores.id', '=', 'citas.doctor_id')
          ->join('pacientes', 'pacientes.id', '=', 'citas.paciente_id')
          ->select('citas.*', DB::raw("CONCAT(doctores.nombre,' ',doctores.apellidos,' [' ,doctores.especialidad,']') AS doctor"), DB::raw("CONCAT(pacientes.nombre,' ',pacientes.apellidos) AS paciente"))
          ->orderBy('fecha_cita', 'desc')->get();
        
        return $query;
      }else{
        $query = DB::table('citas')
            ->join('doctores', 'doctores.id', '=', 'citas.doctor_id')
            ->join('pacientes', 'pacientes.id', '=', 'citas.paciente_id')
            ->select('citas.*', DB::raw("CONCAT(doctores.nombre,' ',doctores.apellidos,' [' ,doctores.especialidad,']') AS doctor"), DB::raw("CONCAT(pacientes.nombre,' ',pacientes.apellidos) AS paciente"))
            ->orderBy('fecha_cita', 'desc')->get();
        
        return $query;
      }


      return $query;
    }
    
    public function create(Request $request){
        
      /*$validatedData = $request->validate([
        'paciente_id' => 'required',
        'doctor_id' => 'required',
        'fecha_cita' => 'required ',
        'motivo' => 'required |max:255 ',
      ],[
        'paciente_id.required' => 'paciente_id is a required field.',
        'doctor_id.required' => 'doctor_id is a required field.',
        'fecha_cita.required' => 'fecha_cita is a required field.',
        'motivo.required' => 'motivo is a required field.',
        'motivo.max' => 'motivo can only be 255 characters.',
      ]);*/

      $fecha_formateada = str_replace('T', ' ', $request->fecha_cita);
      $request['fecha_cita'] = $fecha_formateada.":00";

      //$request['doctor_id'] = 2;
      //$request['paciente_id'] = 3;

      
      error_log($request['fecha_cita']);

      error_log($request['paciente_id']);
      error_log($request['doctor_id']);
      
      //$separado_por_comas = implode(",", $request->all());

      //error_log($separado_por_comas);

        $citas = Citas::create($request->all());    
        return $citas;
    }
    
    public function update(Request $request, $id){
      
      $validatedData = $request->validate([
        'paciente_id' => 'required',
        'doctor_id' => 'required',
        'fecha_cita' => 'required ',
        'motivo' => 'required |max:255 ',
      ],[
        'paciente_id.required' => 'paciente_id is a required field.',
        'doctor_id.required' => 'doctor_id is a required field.',
        'fecha_cita.required' => 'fecha_cita is a required field.',
        'motivo.required' => 'motivo is a required field.',
        'motivo.max' => 'motivo can only be 255 characters.',
      ]);

        $citas = Citas::findOrFail($id);
        $input = $request->all();
        $citas->fill($input)->save();
        return $citas;
    }
    
    public function delete(Request $request, $id){
        $citas = Citas::findOrFail($id);
        $citas->delete();
    }
}
 ?>