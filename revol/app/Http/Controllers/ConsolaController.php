<?php

namespace App\Http\Controllers;

use App\Consola;
use App\Http\Datatables\ConsolaDatatable;
use App\Http\Requests\ConsolaRequest;
use Illuminate\Http\Request;

class ConsolaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $query = Consola::query();
        $datatables = ConsolaDatatable::make($query);

        return $request->ajax()
            ? $datatables->json()
            : view('consolas.index', $datatables->html());
    }

    public function create()
    {
        return view('consolas.create');
    }

    public function store(ConsolaRequest $request)
    {
        Consola::create($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('consolas.create')
            : redirect()->route('consolas.index');
    }

    public function show(Consola $consola)
    {
        return view('consolas.show', compact('consola'));
    }

    public function edit(Consola $consola)
    {
        return view('consolas.edit', compact('consola'));
    }

    public function update(ConsolaRequest $request, Consola $consola)
    {
        $consola->update($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('consolas.edit', $consola->id)
            : redirect()->route('consolas.index');
    }

    /** @noinspection PhpUnhandledExceptionInspection */
    public function destroy(Consola $consola)
    {
        $consola->delete();

        return redirect()->route('consolas.index');
    }
}
