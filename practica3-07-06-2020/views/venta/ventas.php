<?php

	session_start();

	if(!$_SESSION["validar"]){
		header("location:index.php?action=ingresar");
		exit();
	}

	if(isset($_GET["action"])){
		if($_GET["action"]=="cambio"){
			echo "cambio exitoso";
		}
		
		if($_GET["action"] == "okVenta"){
            echo '
                <div class="alert alert-success">
                  <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                    <i class="tim-icons icon-simple-remove"></i>
                  </button>
                  <span>VENTA REGISTRADA CON ÉXITO !</span>
                </div>
            ';
        }
	}
	
?>

<h1> VENTAS </h1>

<div class="card ">
	<div class="card-header">
		<h4 class="card-title">
			<a href="index.php?action=registrarVenta" class="btn btn-fill btn-primary">Nueva Venta</a>
		</h4>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table tablesorter " id="dataTable">
				<thead class="text-primary">
					<tr>
					  <th>Fecha</th>
					  <th>SUBTOTAL</th>
					  <th>DESCUENTO</th>
					  <th>TOTAL</th>
					  				
					  <th>¿Ver?</th>
					  <th>¿Eliminar?</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$vistaVenta = new VentaController();
						$vistaVenta -> vistaVentaController();
						$vistaVenta -> borrarVentaController();
					?>
				</tbody>
			</table>
		</div>
	</div>
</div>
