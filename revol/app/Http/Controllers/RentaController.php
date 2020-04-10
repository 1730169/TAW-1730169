<?php

namespace App\Http\Controllers;

use App\Renta;
use App\Gamer;
use App\Consola;
use DB;

use App\Http\Datatables\RentaDatatable;
use App\Http\Requests\RentaRequest;
use Illuminate\Http\Request;

class RentaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        //$query = Renta::query();
        $query = DB::table('rentas')
            ->join('gamers', 'gamers.id', '=', 'rentas.gamer_id')
            ->join('consolas', 'consolas.id', '=', 'rentas.consola_id')
            ->join('plataformas', 'plataformas.id', '=', 'rentas.consola_id')
            ->select('rentas.*', DB::raw("CONCAT(gamers.nombre,' ',gamers.apellidos,' (',gamers.gamertag,')' ) AS gamer"),DB::raw("CONCAT(consolas.numero,' - ',plataformas.nombre) AS consola"))
            ->get();

        $datatables = RentaDatatable::make($query);

        return $request->ajax()
            ? $datatables->json()
            : view('rentas.index', $datatables->html());
    }

    public function create()
    {
        // Obtener todos los gamers de la DB
        $gamersQuery = Gamer::all();

        // Obtener todas las consolas de la DB
        //$consolasQuery = Consola::all();
        $consolasQuery = DB::table('consolas')
            ->join('plataformas', 'plataformas.id', '=', 'consolas.plataforma_id')
            ->select('consolas.*', 'plataformas.nombre AS plataforma')
            ->get();

        return view('rentas.create', compact('gamersQuery','consolasQuery'));
    }

    public function store(RentaRequest $request)
    {
        Renta::create($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('rentas.create')
            : redirect()->route('rentas.index');
    }

    public function show(Renta $renta)
    {
        return view('rentas.show', compact('renta'));
    }

    public function edit(Renta $renta)
    {
        // Obtener todos los gamers de la DB
        $gamersQuery = Gamer::all();

        // Obtener todas las consolas de la DB
        //$consolasQuery = Consola::all();
        $consolasQuery = DB::table('consolas')
            ->join('plataformas', 'plataformas.id', '=', 'consolas.plataforma_id')
            ->select('consolas.*', 'plataformas.nombre AS plataforma')
            ->get();
        
        return view('rentas.edit', compact('renta','gamersQuery','consolasQuery'));
    }

    public function update(RentaRequest $request, Renta $renta)
    {
        $renta->update($request->all());

        return $request->input('submit') == 'reload'
            ? redirect()->route('rentas.edit', $renta->id)
            : redirect()->route('rentas.index');
    }

    /** @noinspection PhpUnhandledExceptionInspection */
    public function destroy(Renta $renta)
    {
        $renta->delete();

        return redirect()->route('rentas.index');
    }


    public function getTotalRenta(Request $request)
    {
        //error_log("ENTRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");

        $consola_id = $request->input('consola_id');
        $nhoras = $request->input('nhoras');

        $query = DB::table('consolas')
            ->join('plataformas', 'plataformas.id', '=', 'consolas.plataforma_id')
            ->select('plataformas.costo')
            ->where('consolas.id', $consola_id)->first();
        
        $costo = $query->costo;
        $subtotal =  $costo * $nhoras;
        $iva =  $subtotal * 0.16;
        $total = $subtotal * 1.16;

        //error_log($costo);

        return response()->json(
            [
                'subtotal'=>$subtotal,
                'iva'=>$iva,
                'total'=>$total
            ]
        );

    }
}
