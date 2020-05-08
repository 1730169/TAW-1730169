<?php

namespace App\Http\Controllers;

use App\CategoriaFabricante;
use App\Http\Datatables\CategoriaFabricanteDatatable;
use App\Http\Requests\CategoriaFabricanteRequest;
use Illuminate\Http\Request;

class CategoriaFabricanteController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $query = CategoriaFabricante::query();
        $datatables = CategoriaFabricanteDatatable::make($query);

        return $request->ajax()
            ? $datatables->json()
            : view('categoria_fabricantes.index', $datatables->html());
    }

    public function create()
    {
        return view('categoria_fabricantes.create');
    }

    public function store(CategoriaFabricanteRequest $request)
    {
        CategoriaFabricante::create($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('categoria_fabricantes.create')
            : redirect()->route('categoria_fabricantes.index');
    }

    public function show(CategoriaFabricante $categoria_fabricante)
    {
        return view('categoria_fabricantes.show', compact('categoria_fabricante'));
    }

    public function edit(CategoriaFabricante $categoria_fabricante)
    {
        return view('categoria_fabricantes.edit', compact('categoria_fabricante'));
    }

    public function update(CategoriaFabricanteRequest $request, CategoriaFabricante $categoria_fabricante)
    {
        $categoria_fabricante->update($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('categoria_fabricantes.edit', $categoria_fabricante->id)
            : redirect()->route('categoria_fabricantes.index');
    }

    /** @noinspection PhpUnhandledExceptionInspection */
    public function destroy(CategoriaFabricante $categoria_fabricante)
    {
        $categoria_fabricante->delete();

        return redirect()->route('categoria_fabricantes.index');
    }
}
