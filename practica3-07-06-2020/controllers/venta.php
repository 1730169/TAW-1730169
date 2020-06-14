<?php

class VentaController{
	#Llamada a la Plantilla
	public function pagina(){
		include "views/template.php";
	}

	#ENLACES
	public function enlacesPaginasController(){
		if(isset($_GET['action'])){
			$enlaces = $_GET['action'];
		}else{
			$enlaces = 'index';
		}

		#Es el momento en que el controlador invoca al modelo llamado enlacesPaginasModel para que muestre el listado de páginas
		$respuesta = Paginas::enlacesPaginasModel($enlaces);
		include $respuesta;
	}
	
	#REGISTRO DE VENTAS
	public function registroVentaController(){

		if(isset($_POST["orden_json"])){
			#Recibe a traves del método post el name(html) de usuario,contraseña y email, se almacenan los datos en una propiedad de tipo array asociativo con sus respectivas propiedades (usuario,contraseña, email).
			
			$orden_json_str = $_POST["orden_json"];
			

			//echo $orden_json_str;
			
			//$subtotal = $_POST["subtotal_form"];

			$datosController = array(
				"orden_json"=>$_POST["orden_json"],
				"subtotal"=>$_POST["subtotal_form"],
				"descuento"=>$_POST["descuento_form"],
				"total"=>$_POST["total_form"]
			);


			#Se le dice al modelo models/crud.php (Venta::regostroUsuarioModel),que en modelo Datos el metodo registroUsuariosModel reciba en sus parametros los valores $datosController y el nombre de la tabla a la cual debe conectarse(usuarios)

			$respuesta = Venta::registroVentaModel($datosController,"ventas");

			#Se imprime la respuesta en la vista
			
			if($respuesta== "success"){
				header("location:index.php?action=okVenta");
			} else{
				header("location:index.php?error=".implode("-",$respuesta));
			}

		}
	}

	//VISTA DE VENTAS
	public function vistaVentaController(){

		$respuesta=Venta::vistaVentaModel("ventas");
		//Utilizar un foreach para poder iterar un array e imprimir la consulta del modelo

		foreach ($respuesta as $row => $item) {
			echo '<tr>
					<td>'.$item["fecha"].'</td>
					<td>'.$item["subtotal"].'</td>
					<td>'.$item["descuento"].'</td>
					<td>'.$item["total"].'</td>
					
					<td><a href="index.php?action=editarVenta&id='.$item["id"].'" class="     btn btn-secondary btn-sm" >Ver</a></td>
					<td><a href="index.php?action=ventas&idBorrar='.$item["id"].'" class="btn btn-danger btn-sm">Borrar</a></td>
					</tr>';
		} 


	}
	
	#EDITAR VENTA
	public function editarVentaController(){
		$datosController = $_GET["id"];

		$respuesta= Venta::editarVentaModel($datosController,"ventas");

		#Diseñar la estructura de un formulario para que se muestren los datos de la consulta generada en el modelo
		
		echo '
			<input type="hidden" name="orden_json" id="orden_json" value=\''.$respuesta["orden_json"].'\'/>
			<input type="hidden" name="subtotal_form_edit" id="subtotal_form_edit" value="'.$respuesta["subtotal"].'" />
			<input type="hidden" name="descuento_form_edit" id="descuento_form_edit" value="'.$respuesta["descuento"].'" />
			<input type="hidden" name="total_form_edit" id="total_form_edit" value="'.$respuesta["total"].'" />


		';


	}

		#ACTUALIZAR VENTA
		public function actualizarVentaController(){
			
			if(isset($_POST["idEditar"])){

				$datosController = array(
					"id"=>$_POST["idEditar"],
					"codigo"=>$_POST["codigoVentaEditar"],
					"nombre"=>$_POST["nombreVentaEditar"],
					"descripcion"=>$_POST["descripcionEditar"],
					"precio_venta"=>$_POST["precio_ventaEditar"],
					"precio_compra"=>$_POST["precio_compraEditar"],
					"inventario"=>$_POST["inventarioEditar"],
					"categoria_id"=>$_POST["categoria_id"],
				);
				
				$respuesta=Venta::actualizarVentaModel($datosController,"ventas");

			if($respuesta=="success"){
				//header("location:index.php?action=cambioCategoria");
				header("location:index.php?action=ventas");
			}else{
				echo("error");
			
			}
			

		}

	}

	#BORRAR VENTA 
	public function borrarVentaController(){
		if(isset($_GET["idBorrar"])){
			$datosController=$_GET["idBorrar"];
			$respuesta=Venta::borrarVentaModel($datosController,"ventas");
			if($respuesta == "success"){
				header("location:index.php?action=ventas");
			}
		}
	}

	# FUNCION DEL CONTROLADOR PARA MOSTRAR INGRESOS EN EL TABLERO
	public function contarIngresos($tabla){
		$respuesta = Venta::contarIngresos($tabla);
		return $respuesta;
	}


}



?>