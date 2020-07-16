<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Citas;
use DB;

class CitasController extends Controller
{
    public function get(Request $request, $id){
      
      return Citas::findOrFail($id);
    }
    
    public function list(Request $request){
      $query = DB::table('citas')
            ->join('doctores', 'doctores.id', '=', 'citas.doctor_id')
            ->join('pacientes', 'pacientes.id', '=', 'citas.paciente_id')
            ->select('citas.*', DB::raw("CONCAT(doctores.nombre,' ',doctores.apellidos,' [' ,doctores.especialidad,']') AS doctor"), DB::raw("CONCAT(pacientes.nombre,' ',pacientes.apellidos) AS paciente"))
            ->orderBy('fecha_cita', 'desc')->get();

      //return Citas::make($query);
      //return Citas::get();
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