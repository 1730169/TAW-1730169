<?php

namespace App\Http\Datatables;

use Kejojedi\Crudify\Http\Datatable;
use Yajra\DataTables\Html\Column;

class CategoriaFabricanteDatatable extends Datatable
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

    protected function actions($categoria_fabricante)
    {
        return view('categoria_fabricantes.actions', compact('categoria_fabricante'));
    }
}
