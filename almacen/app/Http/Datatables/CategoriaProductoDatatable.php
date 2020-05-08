<?php

namespace App\Http\Datatables;

use Kejojedi\Crudify\Http\Datatable;
use Yajra\DataTables\Html\Column;

class CategoriaProductoDatatable extends Datatable
{
    protected function columns()
    {
        return [
            Column::make('id'),
            Column::make('nombre'),
            Column::make('created_at'),
            Column::make('updated_at'),
        ];
    }

    protected function orderBy()
    {
        return ['nombre', 'asc'];
    }

    protected function actions($categoria_producto)
    {
        return view('categoria_productos.actions', compact('categoria_producto'));
    }
}
