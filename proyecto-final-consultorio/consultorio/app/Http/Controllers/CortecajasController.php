<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cortecajas;
use DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class CortecajasController extends Controller
{
    public function get(Request $request, $id){
      return Cortecajas::findOrFail($id);
    }

    public function getCajaActual(Request $request){
      /**
       * OBTENER EL ULTIMO CORTE DE CAJA REGISTRADO
       */
      $ultimo_corte = DB::table('cortecajas')->select('fecha_corte')->orderBy('fecha_corte', 'desc')->first();

      $fecha_ult_corte = $ultimo_corte->fecha_corte;
      

      /* OBTENER MONTO DEL CORTE CONSULTANDO PAGOS */
      $qmonto = DB::table('pagos')
            ->select(DB::raw('SUM(monto) AS monto_caja'))
            ->where('created_at','>',$fecha_ult_corte)->first();
      
      $monto_caja = $qmonto->monto_caja;
      

      return $monto_caja;
    }
    
    public function list(Request $request){
      $query = DB::table('cortecajas')
          ->join('users', 'users.id', '=', 'cortecajas.usuario_id')
          ->select('cortecajas.*', DB::raw("users.name AS usuario"))
          ->orderBy('cortecajas.fecha_corte', 'desc')->get();
      
          return $query;
      //return Cortecajas::get();
    }
    
    public function create(Request $request){
        
      /* OBTENER MONTO DEL CORTE CONSULTANDO PAGOS */
      $qmonto = DB::table('pagos')
            ->select(DB::raw('SUM(monto) AS monto_suma'))
            ->where('created_at','<',DB::raw('CURRENT_TIMESTAMP'))->first();
      
      $mono_corte = $qmonto->monto_suma;

      // OBTENER EL ID DEL USUARIO QUE TIENE SESION ACTIVA
      $usuario = auth()->user();
      $usuario_id = $usuario->id;

      $fecha_corte = Carbon::now();

      $input = [
        'monto_corte' => $mono_corte,
        'fecha_corte'=> $fecha_corte,
        'usuario_id'=> $usuario_id
      ];

      $cortecajas = Cortecajas::create($input);
      return $cortecajas;
    }
    
    public function update(Request $request, $id){
      
      $validatedData = $request->validate([
        'monto_corte' => 'required |max:10 ',
        'fecha_corte' => 'required ',
        'usuario_id' => 'required |max:20 ',
      ],[
        'monto_corte.required' => 'monto_corte is a required field.',
        'monto_corte.max' => 'monto_corte can only be 10 characters.',
        'fecha_corte.required' => 'fecha_corte is a required field.',
        'usuario_id.required' => 'usuario_id is a required field.',
        'usuario_id.max' => 'usuario_id can only be 20 characters.',
      ]);

        $cortecajas = Cortecajas::findOrFail($id);
        $input = $request->all();
        $cortecajas->fill($input)->save();
        return $cortecajas;
    }
    
    public function delete(Request $request, $id){
        $cortecajas = Cortecajas::findOrFail($id);
        $cortecajas->delete();
    }
}
 ?>