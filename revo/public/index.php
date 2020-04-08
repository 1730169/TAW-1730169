<?php

/*
|--------------------------------------------------------------------------
| Create The Application
|--------------------------------------------------------------------------
|
| First we need to get an application instance. This creates an instance
| of the application / container and bootstraps the application so it
| is ready to receive HTTP / Console requests from the environment.
|
*/

#$app = require __DIR__.'/../bootstrap/app.php';

/*
|--------------------------------------------------------------------------
| Run The Application
|--------------------------------------------------------------------------
|
| Once we have the application, we can handle the incoming request
| through the kernel, and send the associated response back to
| the client's browser allowing them to enjoy the creative
| and wonderful application we have prepared for them.
|
*/

//use IlluminateHttpRequest;
//use IlluminateDatabaseEloquentModel;
//use Illuminate\Database\Eloquent\Model as Eloquent;
//use Eloquent;


//use Illuminate\Database\Eloquent\Model;
//use App\Empleado;

$app = require __DIR__.'/../bootstrap/app.php';


// Crear un Modelo basado en una tabla de la BD
//class Empleado extends IlluminateDatabaseEloquentModel {
/*class Empleado extends Model {
    protected $table = 'empleados';
}*/

/*
// Ruta para obtener todos los empleados de la tabla
$app->get('empleados', function() {
    
    return response()->json(\App\Empleado::all());
});

// Ruta para obtener un empleado - buscar por edi
$app->get('empleados/{id}', function($id) {
    return response()->json(Empleado::find($id));
});

// Ruta para insertar
$app->post('empleados', function(Request $request) {
    // Crear el objeto del modelo
    $empleado = new Empleado();
    
    // Capturar los campos desde la peticion
    $empleado->nombre = $request->input('nombre');
    $empleado->apellido = $request->input('apellido');
    $empleado->telefono = $request->input('telefono');
    $empleado->fecha_contrato = $request->input('fecha_contrato');
    
    // Insertar en la BD
    $empleado->save();
    
    return response()->json($empleado, 201);
});

// Ruta para eliminar empleado
$app->delete('empleados/{id}', function($id) {
    Empleado::find($id)->delete();
    return response('', 200);
});

$app->patch('empleados/{id}', function(Request $request, $id) {
    $empleado = Empleado::find($id);

    $empleado->nombre = $request->input('nombre', $empleado->nombre);
    $empleado->apellido = $request->input('apellido', $empleado->apellido);
    $empleado->telefono = $request->input('telefono', $empleado->telefono);
    $empleado->fecha_contrato = $request->input('fecha_contrato', $empleado->fecha_contrato);
    
    // Actualizar en la BD (UPDATE)
    $empleado->save();
    return response()->json($empleado);
});
*/

$app->run();
