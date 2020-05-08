<?php

namespace App\Http\Controllers;

use App\Producto;
use App\CategoriaProducto;
use App\Fabricante;
use DB;

use App\Http\Datatables\ProductoDatatable;
use App\Http\Requests\ProductoRequest;
use Illuminate\Http\Request;

class ProductoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        //$query = Producto::query();
        $query = DB::table('productos')
            ->join('categoria_productos', 'categoria_productos.id', '=', 'productos.categoria_producto_id')
            ->join('fabricantes', 'fabricantes.id', '=', 'productos.fabricante_id')
            ->select('productos.*', 'categoria_productos.nombre AS categoria', 'fabricantes.nombre AS fabricante')
            ->get();
        
        $datatables = ProductoDatatable::make($query);

        return $request->ajax()
            ? $datatables->json()
            : view('productos.index', $datatables->html());
    }

    public function create()
    {
        // Obtener todas las categorias de productos de la DB
        $categorias = CategoriaProducto::all();

        // Obtener todos los fabricantes de la DB
        $fabricantes = Fabricante::all();

        return view('productos.create', compact('categorias','fabricantes'));
    }

    public function store(ProductoRequest $request)
    {
        Producto::create($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('productos.create')
            : redirect()->route('productos.index');
    }

    public function show(Producto $producto)
    {
        return view('productos.show', compact('producto'));
    }

    public function edit(Producto $producto)
    {
        // Obtener todas las categorias de productos de la DB
        $categorias = CategoriaProducto::all();

        // Obtener todos los fabricantes de la DB
        $fabricantes = Fabricante::all();

        return view('productos.edit', compact('producto','categorias','fabricantes'));
    }

    public function update(ProductoRequest $request, Producto $producto)
    {
        $producto->update($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('productos.edit', $producto->id)
            : redirect()->route('productos.index');
    }

    /** @noinspection PhpUnhandledExceptionInspection */
    public function destroy(Producto $producto)
    {
        $producto->delete();

        return redirect()->route('productos.index');
    }
}
