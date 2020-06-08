<?php

	class Conexion{
		public function conectar(){
	
			$link = new PDO("mysql:host=localhost;dbname=practica3","root","root72");
			return $link;
		}
	}

?>
