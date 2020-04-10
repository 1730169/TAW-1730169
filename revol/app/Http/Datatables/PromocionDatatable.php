<?php

namespace App\Http\Datatables;

use Kejojedi\Crudify\Http\Datatable;
use Yajra\DataTables\Html\Column;

class PromocionDatatable extends Datatable
{
    protected function columns()
    {
        return [
            //Column::make('id'),
            Column::make('monto_dulceria'),
            Column::make('monedas_dulceria'),
            
            Column::make('cantidad_invitacion'),
            Column::make('monedas_invitacion'),
            //Column::make('created_at'),
            //Column::make('updated_at'),
        ];
    }

    protected function orderBy()
    {
        return ['monedas', 'asc'];
    }

    protected function actions($promocion)
    {
        return view('promocions.actions', compact('promocion'));
    }
}
