<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Consultas;
use App\Servicioconsultas;
use DB;
use Illuminate\Support\Facades\Auth;

class ConsultasController extends Controller
{
  
    public function get(Request $request, $id){
      return Consultas::findOrFail($id);
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
        error_log("ENTRA 1...............");
        
        $doctor_id = DB::table('doctores')->select('id')->where('user_id','=',"".$user_id)->first();

        $query = DB::table('consultas')
            ->join('doctores', 'doctores.id', '=', 'consultas.doctor_id')
            ->join('pacientes', 'pacientes.id', '=', 'consultas.paciente_id')
            ->select('consultas.*', 'consultas.created_at AS fecha',DB::raw("CONCAT(doctores.nombre,' ',doctores.apellidos,' [' ,doctores.especialidad,']') AS doctor"), DB::raw("CONCAT(pacientes.nombre,' ',pacientes.apellidos) AS paciente"))
            ->where('consultas.doctor_id','=',$doctor_id->id)
            ->orderBy('created_at', 'desc')->get();
        /*
        SELECT consultas.* FROM `consultas`
          INNER JOIN compartirs ON compartirs.consulta_id = consultas.id
        WHERE compartirs.doctor_afiliado_id = 1
        */
        $queryCompartidos = DB::table('consultas')
        ->join('doctores', 'doctores.id', '=', 'consultas.doctor_id')
        ->join('pacientes', 'pacientes.id', '=', 'consultas.paciente_id')
        ->join('compartirs', 'compartirs.consulta_id', '=', 'consultas.id')
        ->select('consultas.*', 'consultas.created_at AS fecha',DB::raw("CONCAT(doctores.nombre,' ',doctores.apellidos,' [' ,doctores.especialidad,']') AS doctor"), DB::raw("CONCAT(pacientes.nombre,' ',pacientes.apellidos) AS paciente"))
        ->where('compartirs.doctor_afiliado_id','=',$doctor_id->id)
        ->orderBy('consultas.created_at', 'desc')->get();


        foreach($queryCompartidos as $comp) {
          $query->add($comp);
        }


        return $query;

      }else if (strpos($roles, 'admin') !== false){
        error_log("ENTRA 2 ...............");
        $query = DB::table('consultas')
            ->join('doctores', 'doctores.id', '=', 'consultas.doctor_id')
            ->join('pacientes', 'pacientes.id', '=', 'consultas.paciente_id')
            ->select('consultas.*', 'consultas.created_at AS fecha',DB::raw("CONCAT(doctores.nombre,' ',doctores.apellidos,' [' ,doctores.especialidad,']') AS doctor"), DB::raw("CONCAT(pacientes.nombre,' ',pacientes.apellidos) AS paciente"))
            ->orderBy('created_at', 'desc')->get();
        
        return $query;
      }else{
        error_log("ENTRA 3 ...............");
        $query = DB::table('consultas')
            ->join('doctores', 'doctores.id', '=', 'consultas.doctor_id')
            ->join('pacientes', 'pacientes.id', '=', 'consultas.paciente_id')
            ->select('consultas.*', 'consultas.created_at AS fecha',DB::raw("CONCAT(doctores.nombre,' ',doctores.apellidos,' [' ,doctores.especialidad,']') AS doctor"), DB::raw("CONCAT(pacientes.nombre,' ',pacientes.apellidos) AS paciente"))
            ->orderBy('created_at', 'desc')->get();
        
        return $query;
      }
      
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