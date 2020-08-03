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