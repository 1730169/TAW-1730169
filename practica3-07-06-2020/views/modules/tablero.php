<?php
	session_start();
	
	$controlador = new MvcController();
	$ventaController = new VentaController();
	
	/**
	 * LLENAR LOS CONTADORES DE LOS ELEMENTOS PARA EL TABLERO
	 */
	$cont_usuarios = $controlador -> contarTablero("usuarios");
	$cont_productos = $controlador -> contarTablero("productos");
	$cont_categorias = $controlador -> contarTablero("categorias");
	$cont_ventas = $controlador -> contarTablero("ventas");
	$cont_ingresos = $ventaController -> contarIngresos("ventas");

?>

<h1 class="m-0 text-dark">Tablero</h1>
<br>
<!-- Small boxes (Stat box) -->
<div class="row">
	<div class="col-lg-3 col-6">
	<!-- small box -->
	<div class="small-box bg-success">
		<div class="inner">
		<h3><?php echo $cont_ventas; ?></h3>

		<p>Ventas registradas</p>
		</div>
		<div class="icon">
		<i class="fa fa-shopping-cart"></i>
		</div>
		<a href="index.php?action=ventas" class="small-box-footer">Más info <i class="fas fa-arrow-circle-right"></i></a>
	</div>
	</div>
	<!-- ./col -->
	<div class="col-lg-3 col-6">
	<!-- small box -->
	<div class="small-box bg-info">
		<div class="inner">
		<h3><?php echo $cont_productos; ?></h3>

		<p>Productos registrados</p>
		</div>
		<div class="icon">
		<i class="fas fa-boxes"></i>
		</div>
		<a href="index.php?action=productos" class="small-box-footer">Más info <i class="fas fa-arrow-circle-right"></i></a>
	</div>
	</div>
	<!-- ./col -->
	<div class="col-lg-3 col-6">
	<!-- small box -->
	<div class="small-box bg-success">
		<div class="inner">
		<h3><?php echo $cont_categorias; ?></h3>

		<p>Categorías registradas</p>
		</div>
		<div class="icon">
		<i class="fas fa-tags"></i>
		</div>
		<a href="index.php?action=categorias" class="small-box-footer">Más info <i class="fas fa-arrow-circle-right"></i></a>
	</div>
	</div>
	<!-- ./col -->
	<div class="col-lg-3 col-6">
	<!-- small box -->
	<div class="small-box bg-warning">
		<div class="inner">
		<h3><?php echo $cont_usuarios; ?></h3>

		<p>Usuarios registrados</p>
		</div>
		<div class="icon">
		<i class="ion ion-person-add"></i>
		</div>
		<a href="index.php?action=usuarios" class="small-box-footer">Más info <i class="fas fa-arrow-circle-right"></i></a>
	</div>
	</div>
	<!-- ./col -->

	<!-- 	
	<div class="col-lg-3 col-6">
	
	<div class="small-box bg-danger">
		<div class="inner">
		<h3>65</h3>

		<p>Unique Visitors</p>
		</div>
		<div class="icon">
		<i class="ion ion-pie-graph"></i>
		</div>
		<a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
	</div>
	</div> -->
	<!-- ./col -->
</div>

<div class="row">
	<!-- ./col -->
	<div class="col-lg-3 col-6">
	<!-- small box -->
	<div class="small-box bg-info">
		<div class="inner">
		<h3>$<?php echo $cont_ingresos; ?></h3>

		<p>Total de ingresos por ventas</p>
		</div>
		<div class="icon">
			<i class="fa fa-money"></i>
		</div>
		<a href="index.php?action=ventas" class="small-box-footer">Más info <i class="fas fa-arrow-circle-right"></i></a>
	</div>
	</div>
	<!-- ./col -->
</div>