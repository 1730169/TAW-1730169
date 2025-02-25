<?php 
    require_once('modelo/universidad_model.php');
    //controller universidads
    class universidad_controller{

        private $model_e;
        private $model_p;

        function __construct(){
            $this->model_e=new universidad_model();
        }
       
        function index(){
            $query =$this->model_e->get();

            include_once('vistas/header.php');
            include_once('vistas/universidad/index.php');
            include_once('vistas/footer.php');
        }

        function universidad(){
            
            $data=NULL;
            if(isset($_REQUEST['id'])){
                $data=$this->model_e->get_id($_REQUEST['id']);    
            }
            $query=$this->model_e->get();
            include_once('vistas/header.php');
            include_once('vistas/universidad/universidad.php');
            include_once('vistas/footer.php');
        }

        /**
         * FUNCIÓN PARA RECIBIR LOS DATOS DESDE EL FORMULARIO
         */
        function get_datos(){
           
            
            $data['id']=$_REQUEST['txt_id'];
            $data['nombre']=$_REQUEST['txt_nombre'];
            $data['direccion']=$_REQUEST['txt_direccion'];
            $data['telefono']=$_REQUEST['txt_telefono'];

            if ($_REQUEST['id']=="") {
                $this->model_e->create($data);
            }
            
            if($_REQUEST['id']!=""){
                $date=$_REQUEST['id'];
                $this->model_e->update($data,$date);
            }
            
            header("Location:index.php?universidad=index");

        }
        
        function confirmarDelete(){

            $_REQUEST['modulo'] = "universidad";

            $data=NULL;

            if ($_REQUEST['id']!=0) {
               $data=$this->model_e->get_id($_REQUEST['id']);
            }

            if ($_REQUEST['id']==0) {
                $date['id']=$_REQUEST['txt_id'];
                $this->model_e->delete($date['id']);
                header("Location:index.php?universidad=index");
            }

            include_once('vistas/header.php');
            include_once('vistas/confirm.php');
            include_once('vistas/footer.php');
            


        }


    }
?>