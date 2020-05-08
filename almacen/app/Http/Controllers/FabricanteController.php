<?php

namespace App\Http\Controllers;

use App\Fabricante;
use App\CategoriaFabricante;
use DB;

use App\Http\Datatables\FabricanteDatatable;
use App\Http\Requests\FabricanteRequest;
use Illuminate\Http\Request;

class FabricanteController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        //$query = Fabricante::query();
        $query = DB::table('fabricantes')
            ->join('categoria_fabricantes', 'categoria_fabricantes.id', '=', 'fabricantes.categoria_fabricante_id')
            ->select('fabricantes.*', 'categoria_fabricantes.nombre AS categoria')
            ->get();

        $datatables = FabricanteDatatable::make($query);

        return $request->ajax()
            ? $datatables->json()
            : view('fabricantes.index', $datatables->html());
    }

    public function create()
    {
        // Obtener todas las categorias de fabricantes de la DB
        $categorias = CategoriaFabricante::all();

        return view('fabricantes.create', compact('categorias'));
    }

    public function store(FabricanteRequest $request)
    {
        Fabricante::create($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('fabricantes.create')
            : redirect()->route('fabricantes.index');
    }

    public function show(Fabricante $fabricante)
    {
        return view('fabricantes.show', compact('fabricante'));
    }

    public function edit(Fabricante $fabricante)
    {
        // Obtener todas las categorias de fabricantes de la DB
        $categorias = CategoriaFabricante::all();

        return view('fabricantes.edit', compact('fabricante', 'categorias'));
    }

    public function update(FabricanteRequest $request, Fabricante $fabricante)
    {
        $fabricante->update($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('fabricantes.edit', $fabricante->id)
            : redirect()->route('fabricantes.index');
    }

    /** @noinspection PhpUnhandledExceptionInspection */
    public function destroy(Fabricante $fabricante)
    {
        $fabricante->delete();

        return redirect()->route('fabricantes.index');
    }
}
