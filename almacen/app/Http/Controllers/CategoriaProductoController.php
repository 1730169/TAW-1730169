<?php

namespace App\Http\Controllers;

use App\CategoriaProducto;
use App\Http\Datatables\CategoriaProductoDatatable;
use App\Http\Requests\CategoriaProductoRequest;
use Illuminate\Http\Request;

class CategoriaProductoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $query = CategoriaProducto::query();
        $datatables = CategoriaProductoDatatable::make($query);

        return $request->ajax()
            ? $datatables->json()
            : view('categoria_productos.index', $datatables->html());
    }

    public function create()
    {
        return view('categoria_productos.create');
    }

    public function store(CategoriaProductoRequest $request)
    {
        CategoriaProducto::create($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('categoria_productos.create')
            : redirect()->route('categoria_productos.index');
    }

    public function show(CategoriaProducto $categoria_producto)
    {
        return view('categoria_productos.show', compact('categoria_producto'));
    }

    public function edit(CategoriaProducto $categoria_producto)
    {
        return view('categoria_productos.edit', compact('categoria_producto'));
    }

    public function update(CategoriaProductoRequest $request, CategoriaProducto $categoria_producto)
    {
        $categoria_producto->update($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('categoria_productos.edit', $categoria_producto->id)
            : redirect()->route('categoria_productos.index');
    }

    /** @noinspection PhpUnhandledExceptionInspection */
    public function destroy(CategoriaProducto $categoria_producto)
    {
        $categoria_producto->delete();

        return redirect()->route('categoria_productos.index');
    }
}
