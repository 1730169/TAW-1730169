<?php

namespace App\Http\Controllers;

use App\Venta;
use App\Dulceria;
use App\Gamer;
use App\Http\Datatables\VentaDatatable;
use App\Http\Requests\VentaRequest;
use Illuminate\Http\Request;

class VentaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $query = Venta::query();
        $datatables = VentaDatatable::make($query);

        return $request->ajax()
            ? $datatables->json()
            : view('ventas.index', $datatables->html());
    }

    public function create()
    {
        $articulos = Dulceria::all();
        $gamers = Gamer::all();
        return view('ventas.create', compact('articulos', 'gamers'));
    }

    public function store(VentaRequest $request)
    {
        Venta::create($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('ventas.create')
            : redirect()->route('ventas.index');
    }

    public function show(Venta $venta)
    {
        return view('ventas.show', compact('venta'));
    }

    public function edit(Venta $venta)
    {
        return view('ventas.edit', compact('venta'));
    }

    public function update(VentaRequest $request, Venta $venta)
    {
        $venta->update($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('ventas.edit', $venta->id)
            : redirect()->route('ventas.index');
    }

    /** @noinspection PhpUnhandledExceptionInspection */
    public function destroy(Venta $venta)
    {
        $venta->delete();

        return redirect()->route('ventas.index');
    }

}
