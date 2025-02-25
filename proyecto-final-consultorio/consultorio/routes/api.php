<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware' => 'api'], function ($router) {
    Route::get('menu', 'MenuController@index');

    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('register', 'AuthController@register'); 

    Route::resource('notes', 'NotesController');

    Route::resource('resource/{table}/resource', 'ResourceController');
    
    Route::group(['middleware' => 'admin'], function ($router) {

        Route::resource('mail',        'MailController');
        Route::get('prepareSend/{id}', 'MailController@prepareSend')->name('prepareSend');
        Route::post('mailSend/{id}',   'MailController@send')->name('mailSend');

        Route::resource('bread',  'BreadController');   //create BREAD (resource)

        Route::resource('users', 'UsersController')->except( ['create', 'store'] );


        Route::prefix('menu/menu')->group(function () { 
            Route::get('/',         'MenuEditController@index')->name('menu.menu.index');
            Route::get('/create',   'MenuEditController@create')->name('menu.menu.create');
            Route::post('/store',   'MenuEditController@store')->name('menu.menu.store');
            Route::get('/edit',     'MenuEditController@edit')->name('menu.menu.edit');
            Route::post('/update',  'MenuEditController@update')->name('menu.menu.update');
            Route::get('/delete',   'MenuEditController@delete')->name('menu.menu.delete');
        });
        Route::prefix('menu/element')->group(function () { 
            Route::get('/',             'MenuElementController@index')->name('menu.index');
            Route::get('/move-up',      'MenuElementController@moveUp')->name('menu.up');
            Route::get('/move-down',    'MenuElementController@moveDown')->name('menu.down');
            Route::get('/create',       'MenuElementController@create')->name('menu.create');
            Route::post('/store',       'MenuElementController@store')->name('menu.store');
            Route::get('/get-parents',  'MenuElementController@getParents');
            Route::get('/edit',         'MenuElementController@edit')->name('menu.edit');
            Route::post('/update',      'MenuElementController@update')->name('menu.update');
            Route::get('/show',         'MenuElementController@show')->name('menu.show');
            Route::get('/delete',       'MenuElementController@delete')->name('menu.delete');
        });
        Route::prefix('media')->group(function ($router) {
            Route::get('/',                 'MediaController@index')->name('media.folder.index');
            Route::get('/folder/store',     'MediaController@folderAdd')->name('media.folder.add');
            Route::post('/folder/update',   'MediaController@folderUpdate')->name('media.folder.update');
            Route::get('/folder',           'MediaController@folder')->name('media.folder');
            Route::post('/folder/move',     'MediaController@folderMove')->name('media.folder.move');
            Route::post('/folder/delete',   'MediaController@folderDelete')->name('media.folder.delete');;

            Route::post('/file/store',      'MediaController@fileAdd')->name('media.file.add');
            Route::get('/file',             'MediaController@file');
            Route::post('/file/delete',     'MediaController@fileDelete')->name('media.file.delete');
            Route::post('/file/update',     'MediaController@fileUpdate')->name('media.file.update');
            Route::post('/file/move',       'MediaController@fileMove')->name('media.file.move');
            Route::post('/file/cropp',      'MediaController@cropp');
            Route::get('/file/copy',        'MediaController@fileCopy')->name('media.file.copy');

            Route::get('/file/download',    'MediaController@fileDownload');
        });

        Route::resource('roles',        'RolesController');
        Route::get('/roles/move/move-up',      'RolesController@moveUp')->name('roles.up');
        Route::get('/roles/move/move-down',    'RolesController@moveDown')->name('roles.down');
    });
});

/**
 * RUTAS PARA EL MODULO DE PACIENTES
 */
Route::get('pacientes', 'PacientesController@list');
Route::get('pacientes/{id}', 'PacientesController@get');
Route::post('pacientes', 'PacientesController@create');
Route::put('pacientes/{id}', 'PacientesController@update');
Route::delete('pacientes/{id}', 'PacientesController@delete');

/**
 * RUTAS PARA EL MODULO DE DOCTORES
 */
Route::get('doctores', 'DoctoresController@list');
Route::get('doctores/usuarios/', 'DoctoresController@getUsuariosDoctor');
Route::get('doctores/{id}', 'DoctoresController@get');
Route::post('doctores', 'DoctoresController@create');
Route::put('doctores/{id}', 'DoctoresController@update');
Route::delete('doctores/{id}', 'DoctoresController@delete');
Route::get('doctor_select/', 'DoctoresController@doctor_select');

/**
 * RUTAS PARA EL MODULO DE CITAS
 */
Route::get('citas', 'CitasController@list');
Route::get('citas/{id}', 'CitasController@get');
Route::post('citas', 'CitasController@create');
Route::put('citas/{id}', 'CitasController@update');
Route::delete('citas/{id}', 'CitasController@delete');

/**
 * RUTAS PARA EL MODULO DE SERVICIOS
 */
Route::get('servicios', 'ServiciosController@list');
Route::get('servicios/{id}', 'ServiciosController@get');
Route::post('servicios', 'ServiciosController@create');
Route::put('servicios/{id}', 'ServiciosController@update');
Route::delete('servicios/{id}', 'ServiciosController@delete');

/**
 * RUTAS PARA EL MODULO DE CONSULTAS
 */
Route::get('consultas', 'ConsultasController@list');
Route::get('consultas/{id}', 'ConsultasController@get');
Route::post('consultas', 'ConsultasController@create');
Route::put('consultas/{id}', 'ConsultasController@update');
Route::delete('consultas/{id}', 'ConsultasController@delete');

/**
 * RUTAS PARA EL MODULO DE SERVICIOS CONSULTA
 */
Route::get('servicioconsultas', 'ServicioconsultasController@list');
Route::get('servicioconsultas/{id}', 'ServicioconsultasController@get');
Route::get('servicioconsultas/lista/{id}', 'ServicioconsultasController@getLista');
Route::post('servicioconsultas', 'ServicioconsultasController@create');
Route::put('servicioconsultas/{id}', 'ServicioconsultasController@update');
Route::delete('servicioconsultas/{id}', 'ServicioconsultasController@delete');

/**
 * RUTAS PARA EL MODULO DE PAGOS
 */
Route::get('pagos', 'PagosController@list');
Route::get('pagos/{id}', 'PagosController@get');
Route::post('pagos', 'PagosController@create');
Route::put('pagos/{id}', 'PagosController@update');
Route::delete('pagos/{id}', 'PagosController@delete');

/**
 * RUTAS PARA EL MODULO DE COMPARTIR EXPEDIENTE
 */
Route::post('compartirs', 'CompartirsController@create');
/*
Route::get('compartirs', 'CompartirsController@list');
Route::get('compartirs/{id}', 'CompartirsController@get');

Route::put('compartirs/{id}', 'CompartirsController@update');
Route::delete('compartirs/{id}', 'CompartirsController@delete');
*/

/**
 * RUTAS PARA EL MODULO DE CORTE DE CAJA
 */
Route::get('cortecajas', 'CortecajasController@list');
Route::get('cortecajas/{id}', 'CortecajasController@get');
Route::get('montocaja/', 'CortecajasController@getCajaActual');
Route::post('cortecajas', 'CortecajasController@create');
Route::put('cortecajas/{id}', 'CortecajasController@update');
Route::delete('cortecajas/{id}', 'CortecajasController@delete');
