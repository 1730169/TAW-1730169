<?php

namespace App\Http\Datatables;

use Kejojedi\Crudify\Http\Datatable;
use Yajra\DataTables\Html\Column;

class VentaDatatable extends Datatable
{
    protected function columns()
    {
        return [
            Column::make('id'),
            Column::make('name'),
            Column::make('created_at'),
            Column::make('updated_at'),
        ];
    }

    protected function orderBy()
    {
        return ['name', 'asc'];
    }

    protected function actions($venta)
    {
        return view('ventas.actions', compact('venta'));
    }
}
