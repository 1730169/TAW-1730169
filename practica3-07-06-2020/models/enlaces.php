<?php
	
	#Modelo de enlaces web
	class Paginas{
		public function enlacesPaginasModel($enlaces){
			
			//COMPROBAR ENLACE PARA MOSTRAR LA VISTA DEL TABLERO
			if($enlaces=="index"){
				$module = "views/modules/tablero.php";
				return $module;
			}

			// ENLACES PARA EL MODULO VENTAS
			if(
				$enlaces=="ventas"||
				$enlaces=="registrarVenta"||
				$enlaces=="editarVenta"
			){
				$module = "views/venta/".$enlaces.".php";
				return $module;
			}else if($enlaces=="okVenta"){
				$module="views/venta/ventas.php";
				return $module;
			}

			// ENLACES PARA EL MODULO PRODUCTOS
			if(
				$enlaces=="productos"||
				$enlaces=="registrarProducto"||
				$enlaces=="editarProducto"
			){
				$module = "views/producto/".$enlaces.".php";
				return $module;
			}else if($enlaces=="okProducto"){
				$module="views/producto/productos.php";
				return $module;
			}

			// ENLACES PARA EL MODULO CATEGORIA
			if(
				$enlaces=="categorias"||
				$enlaces=="registrarCategoria"||
				$enlaces=="editarCategoria"
			){
				$module = "views/categoria/".$enlaces.".php";
				return $module;
			}else if($enlaces=="okCategoria"){
				$module="views/categoria/registrarCategoria.php";
				return $module;
			}

			if ($enlaces =="ingresar"||($enlaces)=="usuarios" || ($enlaces)=="editar"||($enlaces)=="salir"){

					$module = "views/modules/".$enlaces.".php";
				}
				 else if($enlaces=="registro"){
					$module="views/modules/registro.php";

				} else if($enlaces=="ok"){

					$module="views/modules/registro.php";
				} else if($enlaces=="fallo"){

					$module="views/modules/ingresar.php";
				} else if($enlaces=="cambio"){

					$module="views/modules/usuarios.php";
				} else{

					$module="views/modules/registro.php";
				}	

				return $module;	
		
		}

	}



?>