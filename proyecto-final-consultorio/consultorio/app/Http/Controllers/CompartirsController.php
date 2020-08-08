<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Compartirs;

class CompartirsController extends Controller
{
    public function get(Request $request, $id){
      return Compartirs::findOrFail($id);
    }
    
    public function list(Request $request){
      return Compartirs::get();
    }
    
    public function create(Request $request){
        
      $validatedData = $request->validate([
        'consulta_id' => 'required |max:20 ',
        'doctor_afiliado_id' => 'required |max:20 ',
      ],[
        'consulta_id.required' => 'consulta_id is a required field.',
        'consulta_id.max' => 'consulta_id can only be 20 characters.',
        'doctor_afiliado_id.required' => 'doctor_afiliado_id is a required field.',
        'doctor_afiliado_id.max' => 'doctor_afiliado_id can only be 20 characters.',
      ]);

        $compartirs = Compartirs::create($request->all());    
        return $compartirs;
    }
    
    public function update(Request $request, $id){
      
      $validatedData = $request->validate([
        'consulta_id' => 'required |max:20 ',
        'doctor_afiliado_id' => 'required |max:20 ',
      ],[
        'consulta_id.required' => 'consulta_id is a required field.',
        'consulta_id.max' => 'consulta_id can only be 20 characters.',
        'doctor_afiliado_id.required' => 'doctor_afiliado_id is a required field.',
        'doctor_afiliado_id.max' => 'doctor_afiliado_id can only be 20 characters.',
      ]);

        $compartirs = Compartirs::findOrFail($id);
        $input = $request->all();
        $compartirs->fill($input)->save();
        return $compartirs;
    }
    
    public function delete(Request $request, $id){
        $compartirs = Compartirs::findOrFail($id);
        $compartirs->delete();
    }
}
 ?>