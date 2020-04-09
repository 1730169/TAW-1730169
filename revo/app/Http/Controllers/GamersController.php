<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class GamersController extends Controller
{
    /**
     * Show a list of all of the application's gamers.
     *
     * @return Response
     */
    public function index()
    {
        $gamers = DB::table('gamers')->get();

        //echo $gamers;

        return view('gamers.index', ['gamers' => $gamers]);
    }

    public function nuevo()
    {
        //$gamers = DB::table('gamers')->get();

        //echo $gamers;

        return view('gamers.form');
    }
}