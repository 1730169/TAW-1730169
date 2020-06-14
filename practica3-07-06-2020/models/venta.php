<?php

require_once "conexion.php";

//heredar la clase conexion.php para poder accesar y utilizar la conexión de base de datos, se extiende cuando se requiere manipular una función o método, en este caso manipularemos la función "conectar" de models/conexion.php
class Venta extends Conexion{

	//REGISTRO DE CATEGORIAS

	public function registroVentaModel($datosModel, $tabla){

		#prepare() prepara la sentencia de sql para que sea ejecutada por el método POSStatmen. La sentencia de SQL se puede contener desde cero para ejecutar mas parámetros.

		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(orden_json,subtotal,descuento,total) VALUES (:orden_json,:subtotal,:descuento,:total)");

		//bindParam vincula una variable de PHP a un parametro de sustitución con subtotal correspondiente a la sentencia sql
		$stmt->bindParam(":orden_json",$datosModel["orden_json"], PDO::PARAM_STR);
		$stmt->bindParam(":subtotal",$datosModel["subtotal"], PDO::PARAM_STR);
		$stmt->bindParam(":descuento",$datosModel["descuento"], PDO::PARAM_STR);
		$stmt->bindParam(":total",$datosModel["total"], PDO::PARAM_STR);

		#Regresar una respuesta satisfactoria o no

		if($stmt->execute()){
			// PREPARAR LA CONSULTA PARA ACTUALIZAR EL INVENTARIO AL VENDER
			// Parsear string json de la vista
			$orden_json = json_decode($datosModel["orden_json"]);
			
			// Recorrer cada producto dentro de la orden
			foreach($orden_json as $producto){
				
				// ACTUALIZAR EL STOCK DE CADA PRODUCTO VENDIDO
				$stmtUp=Conexion::conectar()->prepare("UPDATE productos SET inventario=inventario - :cantidad WHERE id=:id AND inventario > 0");
				$stmtUp->bindParam(":cantidad",$producto->cantidad,PDO::PARAM_STR);
				
				$stmtUp->bindParam(":id",$producto->id,PDO::PARAM_STR);
				
				if(!$stmtUp->execute()){
					return "error";
				}
				echo "Entra";
				//$stmtUp->close();
			}

			return "success";
		}else{
			return $stmt->errorInfo();
		}

		$stmt->close();

	}


	#MODELO VISTA CATEGORIA
	public function vistaVentaModel($tabla){
		$stmt=Conexion::conectar()->prepare("SELECT * FROM $tabla ORDER BY fecha DESC");
		$stmt->execute();

		#fetchAll(): Obtiene todas las filas de un conjunto de resultados asociados al objeto PDO statment ($stmt)
		
		$ventas = $stmt->fetchAll();
		
		return $ventas;

		$stmt->close();
	}

	#MODELO EDITAR CATEGORIA
	public function editarVentaModel($datosModel,$tabla){
		$stmt=Conexion::conectar()->prepare("SELECT id,orden_json,subtotal,descuento,total FROM $tabla WHERE id=:id");
		$stmt->bindParam(":id",$datosModel,PDO::PARAM_INT);
		$stmt->execute();
		
		//echo $datosModel;
		
		$venta = $stmt->fetch();
		
		return $venta;
		$stmt->close();
	}


	#MODELO ACTUALIZAR CATEGORIA
	public function actualizarVentaModel($datosModel,$tabla){
		$stmt=Conexion::conectar()->prepare("UPDATE $tabla SET codigo=:codigo,nombre=:nombre,descripcion=:descripcion,precio_venta=:precio_venta,precio_compra=:precio_compra,inventario=:inventario,categoria_id=:categoria_id WHERE id=:id");
		$stmt->bindParam(":codigo",$datosModel["codigo"],PDO::PARAM_STR);
		$stmt->bindParam(":nombre",$datosModel["nombre"],PDO::PARAM_STR);
		$stmt->bindParam(":descripcion",$datosModel["descripcion"],PDO::PARAM_STR);
		$stmt->bindParam(":precio_venta",$datosModel["precio_venta"],PDO::PARAM_STR);
		$stmt->bindParam(":precio_compra",$datosModel["precio_compra"],PDO::PARAM_STR);
		$stmt->bindParam(":inventario",$datosModel["inventario"],PDO::PARAM_STR);
		$stmt->bindParam(":categoria_id",$datosModel["categoria_id"],PDO::PARAM_STR);

		$stmt->bindParam(":id",$datosModel["id"],PDO::PARAM_STR);

		if($stmt->execute()){
			return "success";
		}else{
			return "error";
		}
			$stmt->close();

	}

	#MODELO BORRAR CATEGORIA
	public function borrarVentaModel($datosModel,$tabla){
		$stmt=Conexion::conectar()->prepare("DELETE FROM $tabla WHERE id=:id");
		$stmt->bindParam(":id",$datosModel,PDO::PARAM_INT);

		if($stmt->execute()){
			return "sucess";
		}else{
			return "error";
		}

		$stmt->close();
	}

	# FUNCION DEL MODELO PARA CONTAR INGRESOS EN VENTAS EN EL TABLERO
	public function contarIngresos($tabla){
		$stmt=Conexion::conectar()->prepare("SELECT SUM(total) AS ingresos FROM $tabla");
		$stmt->execute();
		
		$contador = $stmt->fetch();
		
		return $contador["ingresos"];
		
		$stmt->close();
	}

	


}
?>