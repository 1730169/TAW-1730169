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
        $gamer = null;

        $action = '/gamers/guardar';

        return view('gamers.form', ['gamer' => $gamer, 'action' => $action]);
    }

    public function guardar(Request $request)
    {
        // Captar el envio de los campos del formulario
        $nombre = $request->input('nombre');
        $apellidos = $request->input('apellidos');
        $fecha_nac = $request->input('fecha_nac');
        $genero = $request->input('genero');
        $telefono = $request->input('telefono');
        $email = $request->input('email');
        $gamertag = $request->input('gamertag');
        $password = $request->input('password');
        $redes_sociales = $request->input('redes_sociales');

        DB::table('gamers')->insert(
            [
                'nombre' => $nombre,
                'apellidos' => $apellidos,
                'fecha_nac' => $fecha_nac,
                'genero' => $genero,
                'telefono' => $telefono,
                'email' => $email,
                'gamertag' => $gamertag,
                'contrasena' => $password,
                'redes_sociales' => $redes_sociales
            ]
        );

        return view('gamers.index');
        //return redirect('index')->with('status', 'Nuevo Gamer registrado con éxito!');
    }

    public function editar($id)
    {
        // Buscar objeto de la fila 
        $gamer = DB::table('gamers')->find($id);

        //Cargar la vista del formulario
        $action = '/gamers/actualizar';

        return view('gamers.form', ['gamer' => $gamer, 'action' => $action]);
    }

    public function actualizar(Request $request)
    {
        // Captar el envio de los campos del formulario
        $nombre = $request->input('nombre');
        $apellidos = $request->input('apellidos');
        $fecha_nac = $request->input('fecha_nac');
        $genero = $request->input('genero');
        $telefono = $request->input('telefono');
        $email = $request->input('email');
        $gamertag = $request->input('gamertag');
        $password = $request->input('password');
        $redes_sociales = $request->input('redes_sociales');
        


        return view('gamers.index');
    }

    public function eliminar($id)
    {

        //$user = DB::table('users')->where('name', 'John')->first();

        //Cargar la vista del formulario
        return view('gamers.index');
    }

    
}