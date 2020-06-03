<?php 
	
	class Conexion{
		
		public static function conectar(){
			$link = new PDO("mysql:host=localhost;dbname=TAWPrac07", "root", "root");
			return $link;
		}
	}
?>