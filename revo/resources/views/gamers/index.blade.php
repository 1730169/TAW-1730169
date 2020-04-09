@extends('default')
@section('content')

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h3 class="m-0 font-weight-bold text-primary">Gamers</h3>
  </div>
  <div class="card-body">
    <ul class="list-unstyled list-inline">
      <li>
        <a href="/gamers/nuevo" class="btn btn-primary">Nuevo</a>
      </li>
    </ul>
    <div class="table-responsive">
      <table class="table table-striped" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <th>Nombre</th>
          <th>Apellidos</th>
          <th>&nbsp;</th>
        </thead>
        <tbody>

            <?php
            // Llenar las filas de la tabla
            foreach ($gamers as $gamer) {
                echo "
                <tr>
                    <td>". $gamer->nombre ."</td>
                    <td>". $gamer->apellidos ."</td>
                    <td> <a href='/gamers/editar/".$gamer->id."' class='btn btn-warning'>Editar<a/> </td>
                </tr>";
            }
            
            ?>
        </tbody>
      </table>
    </div>
  </div>
</div>


@endsection