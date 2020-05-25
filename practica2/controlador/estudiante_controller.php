<?php 
    require_once('modelo/estudiante_model.php');
    //controller estudiantes
    class estudiante_controller{

        private $model_e;
        private $model_p;

        function __construct(){
            $this->model_e=new estudiante_model();
        }
       
        function index(){
            $query =$this->model_e->get();

            include_once('vistas/header.php');
            include_once('vistas/estudiante/index.php');
            include_once('vistas/footer.php');
        }

        function estudiante(){
            
            $data=NULL;
            $select_carreras = NULL;

            if(isset($_REQUEST['id'])){
                $data=$this->model_e->get_id($_REQUEST['id']);    
            }

            /**
             * SI EXISTE EL IDENTIFICADOR DE LA UNIVERSIDAD CARGAR LAS CARRERAS
             */
            if(isset($_REQUEST['universidad_id'])){
                // Obtener todas las carreras de esa Universidad
                $select_carreras = $this->model_e->getCarrerasUniversidad($_REQUEST['universidad_id']);    
            }

            $query=$this->model_e->get();
            include_once('vistas/header.php');
            include_once('vistas/estudiante/estudiante.php');
            include_once('vistas/footer.php');
        }
        /**
         * FUNCION QUE CAPTURA LOS DATOS DEL FORMULARIO
         */
        function get_datosE(){
           
            $data['cedula']=$_REQUEST['txt_cedula'];
            $data['nombre']=$_REQUEST['txt_nombre'];
            $data['apellidos']=$_REQUEST['txt_apellidos'];
            $data['promedio']=$_REQUEST['txt_promedio'];
            $data['edad']=$_REQUEST['txt_edad'];

            $data['universidad_id']=$_REQUEST['universidad_id'];
            $data['carrera_id']=$_REQUEST['carrera_id'];
            //$data['fecha']=$_REQUEST['txt_fecha'];

            echo $_REQUEST['universidad_id'];

            if ($_REQUEST['id']=="") {
                $this->model_e->create($data);
            }
            
            if($_REQUEST['id']!=""){
                $date=$_REQUEST['id'];
                $this->model_e->update($data,$date);
            }
            
            header("Location:index.php?m=index");

        }
         
        function confirmarDelete(){

            $_REQUEST['modulo'] = "m";

            $data=NULL;

            if ($_REQUEST['id']!=0) {
               $data=$this->model_e->get_id($_REQUEST['id']);
            }

            if ($_REQUEST['id']==0) {
                $date['id']=$_REQUEST['txt_id'];
                $this->model_e->delete($date['id']);
                header("Location:index.php?m=index");
            }

            include_once('vistas/header.php');
            include_once('vistas/confirm.php');
            include_once('vistas/footer.php');
            


        }


    }
?>