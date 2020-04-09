<?php

namespace App\Http\Controllers;

use App\Gamer;
use App\Http\Datatables\GamerDatatable;
use App\Http\Requests\GamerRequest;
use Illuminate\Http\Request;

class GamerController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $query = Gamer::query();
        $datatables = GamerDatatable::make($query);

        return $request->ajax()
            ? $datatables->json()
            : view('gamers.index', $datatables->html());
    }

    public function create()
    {
        return view('gamers.create');
    }

    public function store(GamerRequest $request)
    {
        Gamer::create($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('gamers.create')
            : redirect()->route('gamers.index');
    }

    public function show(Gamer $gamer)
    {
        return view('gamers.show', compact('gamer'));
    }

    public function edit(Gamer $gamer)
    {
        return view('gamers.edit', compact('gamer'));
    }

    public function update(GamerRequest $request, Gamer $gamer)
    {
        $gamer->update($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('gamers.edit', $gamer->id)
            : redirect()->route('gamers.index');
    }

    /** @noinspection PhpUnhandledExceptionInspection */
    public function destroy(Gamer $gamer)
    {
        $gamer->delete();

        return redirect()->route('gamers.index');
    }
}
