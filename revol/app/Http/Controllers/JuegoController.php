<?php

namespace App\Http\Controllers;

use App\Juego;
use App\Http\Datatables\JuegoDatatable;
use App\Http\Requests\JuegoRequest;
use Illuminate\Http\Request;

class JuegoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $query = Juego::query();
        $datatables = JuegoDatatable::make($query);

        return $request->ajax()
            ? $datatables->json()
            : view('juegos.index', $datatables->html());
    }

    public function create()
    {
        return view('juegos.create');
    }

    public function store(JuegoRequest $request)
    {
        Juego::create($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('juegos.create')
            : redirect()->route('juegos.index');
    }

    public function show(Juego $juego)
    {
        return view('juegos.show', compact('juego'));
    }

    public function edit(Juego $juego)
    {
        return view('juegos.edit', compact('juego'));
    }

    public function update(JuegoRequest $request, Juego $juego)
    {
        $juego->update($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('juegos.edit', $juego->id)
            : redirect()->route('juegos.index');
    }

    /** @noinspection PhpUnhandledExceptionInspection */
    public function destroy(Juego $juego)
    {
        $juego->delete();

        return redirect()->route('juegos.index');
    }
}
