<?php 
//modelo de enlaces web

class Paginas{
	public function enlacesPaginasModel($enlaces){

		if ($enlaces == "ingresar" || $enlaces == "usuarios" || $enlaces == "productos" || $enlaces == "registroProductos" || $enlaces == "editar" || $enlaces == "editarProducto" || $enlaces == "salir" || $enlaces == "categorias" || $enlaces == "registroCategorias" || $enlaces == "editarCategorias") {

			$module = "views/modules/".$enlaces.".php";


		} elseif ($enlaces == "index") {

			$module = "views/modules/registro.php";

		} elseif ($enlaces == "ok") {

			$module = "views/modules/index.php";

		} elseif ($enlaces == "cambio") {

			$module = "views/modules/usarios.php";

		} elseif ($enlaces == "fallo") {

			$module = "views/modules/registro.php";

		} elseif ($enlaces == "modulesCategoria/categorias") {
			$module = "views/".$enlaces.".php";
		} else {

			$module = "views/modules/registro.php";
			
		}

		return $module;
	}
}


 ?>