<?php

namespace App\Http\Datatables;

use Kejojedi\Crudify\Http\Datatable;
use Yajra\DataTables\Html\Column;

class ProductoDatatable extends Datatable
{
    protected function columns()
    {
        return [
            Column::make('id'),
            Column::make('nombre'),
            Column::make('precio_venta'),
            Column::make('categoria'),
            Column::make('fabricante'),

            Column::make('created_at'),
            //Column::make('updated_at'),
        ];
    }

    protected function orderBy()
    {
        return ['nombre', 'asc'];
    }

    protected function actions($producto)
    {
        return view('productos.actions', compact('producto'));
    }
}
