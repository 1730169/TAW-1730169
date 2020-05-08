<?php

namespace App\Http\Datatables;

use Kejojedi\Crudify\Http\Datatable;
use Yajra\DataTables\Html\Column;

class FabricanteDatatable extends Datatable
{
    protected function columns()
    {
        return [
            Column::make('id'),
            Column::make('nombre'),
            Column::make('correo'),
            Column::make('telefono'),

            Column::make('categoria'),

            Column::make('created_at'),
            Column::make('updated_at'),
        ];
    }

    protected function orderBy()
    {
        return ['nombre', 'asc'];
    }

    protected function actions($fabricante)
    {
        return view('fabricantes.actions', compact('fabricante'));
    }
}
