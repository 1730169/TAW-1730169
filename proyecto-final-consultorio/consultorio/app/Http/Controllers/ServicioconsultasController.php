<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Servicioconsultas;
use DB;

class ServicioconsultasController extends Controller
{
    public function get(Request $request, $id){
      return Servicioconsultas::findOrFail($id);
    }

    public function getLista(Request $request, $id){
      //return Servicioconsultas::findOrFail($id);
      $query = DB::table('servicioconsultas')
            ->join('servicios', 'servicios.id', '=', 'servicioconsultas.servicio_id')
            ->select('servicioconsultas.cantidad', 'servicios.*')
            ->where('consulta_id', '=', $id)->get();
      
      return $query;
      //return Servicioconsultas::where('consulta_id', '=', $id).get();
    }
    
    public function list(Request $request){
      return Servicioconsultas::get();
    }
    
    public function create(Request $request){
        
      $validatedData = $request->validate([
        'consulta_id' => 'required |max:20 ',
        'servicio_id' => 'required |max:20 ',
        'cantidad' => 'required |max:10 ',
      ],[
        'consulta_id.required' => 'consulta_id is a required field.',
        'consulta_id.max' => 'consulta_id can only be 20 characters.',
        'servicio_id.required' => 'servicio_id is a required field.',
        'servicio_id.max' => 'servicio_id can only be 20 characters.',
        'cantidad.required' => 'cantidad is a required field.',
        'cantidad.max' => 'cantidad can only be 10 characters.',
      ]);

        $servicioconsultas = Servicioconsultas::create($request->all());    
        return $servicioconsultas;
    }
    
    public function update(Request $request, $id){
      
      $validatedData = $request->validate([
        'consulta_id' => 'required |max:20 ',
        'servicio_id' => 'required |max:20 ',
        'cantidad' => 'required |max:10 ',
      ],[
        'consulta_id.required' => 'consulta_id is a required field.',
        'consulta_id.max' => 'consulta_id can only be 20 characters.',
        'servicio_id.required' => 'servicio_id is a required field.',
        'servicio_id.max' => 'servicio_id can only be 20 characters.',
        'cantidad.required' => 'cantidad is a required field.',
        'cantidad.max' => 'cantidad can only be 10 characters.',
      ]);

        $servicioconsultas = Servicioconsultas::findOrFail($id);
        $input = $request->all();
        $servicioconsultas->fill($input)->save();
        return $servicioconsultas;
    }
    
    public function delete(Request $request, $id){
        $servicioconsultas = Servicioconsultas::findOrFail($id);
        $servicioconsultas->delete();
    }
}
 ?>