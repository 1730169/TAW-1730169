<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class GamersController extends Controller
{
    /**
     * Show a list of all of the application's gamers.
     *
     * @return Response
     */
    public function index()
    {
        $gamers = DB::table('gamers')->get();

        //echo $gamers;

        return view('gamers.index', ['gamers' => $gamers]);
    }

    public function nuevo()
    {
        //Cargar la vista del formulario
        return view('gamers.form');
    }

    public function guardar(Request $request)
    {
        // Captar el envio de los campos del formulario
        $nombre = $request->input('nombre');
        $apellidos = $request->input('apellidos');
        

        return view('gamers.index');
    }

    public function editar($id)
    {
        // Buscar objeto de la fila 
        $gamer = DB::table('gamers')->find($id);

        //Cargar la vista del formulario
        return view('gamers.form', ['gamer' => $gamer]);
    }

    public function actualizar(Request $request)
    {
        // Captar el envio de los campos del formulario
        $nombre = $request->input('nombre');
        $apellidos = $request->input('apellidos');
        


        return view('gamers.index');
    }

    public function eliminar($id)
    {

        //$user = DB::table('users')->where('name', 'John')->first();

        //Cargar la vista del formulario
        return view('gamers.index');
    }

    
}