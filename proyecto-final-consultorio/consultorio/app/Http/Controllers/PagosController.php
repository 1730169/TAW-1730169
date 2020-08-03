<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pagos;
use App\Consultas;
use DB;

class PagosController extends Controller
{
    public function get(Request $request, $id){
      return Pagos::findOrFail($id);
    }
    
    public function list(Request $request){
      $query = DB::table('pagos')
            ->join('consultas', 'consultas.id', '=', 'pagos.consulta_id')
            ->join('doctores', 'doctores.id', '=', 'consultas.doctor_id')
            ->join('pacientes', 'pacientes.id', '=', 'consultas.paciente_id')
            ->select('pagos.*','consultas.diagnostico', 'pagos.created_at AS fecha',DB::raw("CONCAT(doctores.nombre,' ',doctores.apellidos,' [' ,doctores.especialidad,']') AS doctor"), DB::raw("CONCAT(pacientes.nombre,' ',pacientes.apellidos) AS paciente"))
            ->orderBy('created_at', 'desc')->get();
      //return Consultas::get();
      return $query;
    }
    
    public function create(Request $request){
        
      $validatedData = $request->validate([
        'consulta_id' => 'required |max:20 ',
        'monto' => 'required |max:10 ',
      ],[
        'consulta_id.required' => 'consulta_id is a required field.',
        'consulta_id.max' => 'consulta_id can only be 20 characters.',
        'monto.required' => 'monto is a required field.',
        'monto.max' => 'monto can only be 10 characters.',
      ]);
      
      // ACTUALIZAR QUE ESTA PAGADA 
      $consulta = Consultas::findOrFail($request['consulta_id']);
      $input = [
        'terminada' => '1',
        'pagada' => '1',
      ];
      $consulta->fill($input)->save();

      $pagos = Pagos::create($request->all());    
      return $pagos;

    }
    
    public function update(Request $request, $id){
      
      $validatedData = $request->validate([
        'consulta_id' => 'required |max:20 ',
        'monto' => 'required |max:10 ',
      ],[
        'consulta_id.required' => 'consulta_id is a required field.',
        'consulta_id.max' => 'consulta_id can only be 20 characters.',
        'monto.required' => 'monto is a required field.',
        'monto.max' => 'monto can only be 10 characters.',
      ]);

        $pagos = Pagos::findOrFail($id);
        $input = $request->all();
        $pagos->fill($input)->save();
        return $pagos;
    }
    
    public function delete(Request $request, $id){
        $pagos = Pagos::findOrFail($id);
        $pagos->delete();
    }
}
 ?>