<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Consultas;
use App\Servicioconsultas;
use DB;

class ConsultasController extends Controller
{
    public function get(Request $request, $id){
      return Consultas::findOrFail($id);
    }
    
    public function list(Request $request){
      $query = DB::table('consultas')
            ->join('doctores', 'doctores.id', '=', 'consultas.doctor_id')
            ->join('pacientes', 'pacientes.id', '=', 'consultas.paciente_id')
            ->select('consultas.*', 'consultas.created_at AS fecha',DB::raw("CONCAT(doctores.nombre,' ',doctores.apellidos,' [' ,doctores.especialidad,']') AS doctor"), DB::raw("CONCAT(pacientes.nombre,' ',pacientes.apellidos) AS paciente"))
            ->orderBy('created_at', 'desc')->get();
      //return Consultas::get();
      return $query;
    }
    
    public function create(Request $request){
        
      $validatedData = $request->validate([
        'paciente_id' => 'required |max:20 ',
        'doctor_id' => 'required |max:20 ',
        'resumen' => 'required ',
        'diagnostico' => 'required ',
        'prescripcion' => 'required ',
      ],[
        'paciente_id.required' => 'paciente_id is a required field.',
        'paciente_id.max' => 'paciente_id can only be 20 characters.',
        'doctor_id.required' => 'doctor_id is a required field.',
        'doctor_id.max' => 'doctor_id can only be 20 characters.',
        'resumen.required' => 'resumen is a required field.',
        'diagnostico.required' => 'diagnostico is a required field.',
        'prescripcion.required' => 'prescripcion is a required field.',
      ]);

    
      $data = request()->all();
      
      $json_str = $data['servicios_json'];

      error_log('JSON STRING -----------------------.');
      error_log($json_str);


      // Tomar el json string y decodificarlo a arreglo
      $servicios_json = json_decode($json_str."",true);
      
      /*if ($consulta->save()) {
        $consulta_id = $consulta->id;
        return Response::json(array('success' => true), 200);
      }*/

      
      //error_log($servicios_json);
      
      //unset($data['servicios_json']);

      
      $input = [
        'paciente_id' => $data['paciente_id'],
        'doctor_id'=> $data['doctor_id'],
        'resumen'=> $data['resumen'],
        'diagnostico'=> $data['diagnostico'],
        'prescripcion'=> $data['prescripcion'],
        'pagada'=> '0',
        'terminada'=> '0',
      ];

      $consultas = Consultas::create($input);
      
      // ID insertado
      $consulta_id = $consultas->id;
      
      // Recorrer el json array
      foreach($servicios_json as $servicio) {
        $servicio_id = $servicio['id'];
        $cantidad = $servicio['cantidad'];

        $input = [
          'consulta_id' => $consulta_id,
          'servicio_id'=> $servicio_id,
          'cantidad' => $cantidad,
        ];
        
        $servicio_consultas = Servicioconsultas::create($input);

      }

      //$consultas ="";
      return $consultas;
    }
    
    public function update(Request $request, $id){
      
      $validatedData = $request->validate([
        'paciente_id' => 'required |max:20 ',
        'doctor_id' => 'required |max:20 ',
        'resumen' => 'required ',
        'diagnostico' => 'required ',
        'prescripcion' => 'required ',
        'pagada' => 'required |max:1 ',
        'terminada' => 'required |max:1 ',
      ],[
        'paciente_id.required' => 'paciente_id is a required field.',
        'paciente_id.max' => 'paciente_id can only be 20 characters.',
        'doctor_id.required' => 'doctor_id is a required field.',
        'doctor_id.max' => 'doctor_id can only be 20 characters.',
        'resumen.required' => 'resumen is a required field.',
        'diagnostico.required' => 'diagnostico is a required field.',
        'prescripcion.required' => 'prescripcion is a required field.',
        'pagada.required' => 'pagada is a required field.',
        'pagada.max' => 'pagada can only be 1 characters.',
        'terminada.required' => 'terminada is a required field.',
        'terminada.max' => 'terminada can only be 1 characters.',
      ]);

        $consultas = Consultas::findOrFail($id);
        $input = $request->all();
        $consultas->fill($input)->save();
        return $consultas;
    }
    
    public function delete(Request $request, $id){
        $consultas = Consultas::findOrFail($id);
        $consultas->delete();
    }
}
 ?>