<template>
  <CRow>
    <CCol col="12" lg="6">
      <CCard no-header>
        <CCardBody>
          <h3>
            Registrar Consulta
          </h3>
          <CAlert
            :show.sync="dismissCountDown"
            color="primary"
            fade
          >
            ({{dismissCountDown}}) {{ message }}
          </CAlert>

          <!-- DECLARACION DE CAMPOS PARA EL FORMULARIO DE REGISTRO -->
            <CSelect
              label="Doctor" 
              :value.sync="consulta.doctor_id"
              v-model="consulta.doctor_id"
              :plain="true"
              :options="opciones_doctor" id="doctor_id">
            </CSelect>
            
            <CSelect
              label="Paciente" 
              :value.sync="consulta.paciente_id"
              v-model="consulta.paciente_id"
              :plain="true"
              :options="opciones_paciente" id="paciente_id">
            </CSelect>

            <CInput textarea="true" label="Resumen" :rows="12" placeholder="Resumen de la consulta..." v-model="consulta.resumen"></CInput>
            <CInput textarea="true" label="Diagnóstico" :rows="12" placeholder="Diagnóstico" v-model="consulta.diagnostico"></CInput>
            <CInput textarea="true" label="Prescripción" :rows="12" placeholder="Prescripción para el paciente..." v-model="consulta.prescripcion"></CInput>
            
            <!--<CInput label="servicios_json" type="text" v-model="consulta.servicios_json" id="servicios_json"></CInput>-->

            <!-- TERMINAN CAMPOS DE FORMULARIO-->
            

          <CButton color="primary" @click="guardar()">Guardar</CButton>
          <CButton color="primary" @click="irAtras">Atrás</CButton>
        </CCardBody>
      </CCard>
    </CCol>

    <CCol col="12" xl="6">
      <transition name="slide">
      <CCard>
        <CCardBody>
            <!--<CButton color="primary" @click="registrarCita()">Servicios</CButton>-->
            <div class="form-group" id="panel_servicio" style="padding: 10px;">

              <div class="row">
                  <div class="col-md-6">
                      <!-- <label for="servicio_id">Servicio <span id="num_servicio"> </span></label> -->
                      
                      <CSelect
                        label="Servicio" 
                        :value.sync="consulta.servicio_id"
                        v-model="consulta.servicio_id"
                        :plain="true"
                        :options="opciones_servicio" id="servicio_id" >
                      </CSelect>

                      <!-- <input type="text" id="servicio_concepto" placeholder="Concepto para servicio externo" class="form-control"> -->
                  </div>
                  <div class="col-md-2">
                      <label for="cantidad">Cantidad</label>
                      <input type="number" id="servicio_cantidad" min="1" value="1" class="form-control">
                  </div>
                  <div class="col-md-2">
                      <label for="precio">Precio</label>
                      <input type="number" id="servicio_precio" min="0" value="0" class="form-control" readonly>
                  </div>
                  <div class="col-md-2">
                      <label for="distancia">Importe</label>
                      <input type="number" id="servicio_importe" value="0" class="form-control" readonly>
                  </div>
                  
                  <!-- <a href="#" id="btn_add_servicio_orden" class="btn btn-primary btn-sm" style="color:#fff !important;">Añadir</a> -->
                  <CButton color="primary" @click="clickAddServicio()">Añadir</CButton>
              </div>
              
              
          </div>

            
            <div>
              <table class="table" id="tabla_servicios">
                    <thead>
                        <tr>
                        <th scope="col">#</th>
                        <th scope="col">CANTIDAD</th>
                        <th scope="col">CONCEPTO</th>
                        <th scope="col">PRECIO</th>
                        <th scope="col">IMPORTE</th>
                        <th scope="col">OPCIONES</th>
                        </tr>
                    </thead>
                    <tbody id="contenedor_servicios">
                    </tbody>
                    <tfoot style="text-align:center">
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <th>SUBTOTAL</th>
                          <th>$<span id="subtotal_servicios_span">0</span></th>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <th>IVA</th>
                            <th>$<span id="iva_servicios_span">0</span></th>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <th>TOTAL</th>
                            <th>$<span id="total_servicios_span">0</span></th>
                        </tr>
                      </tfoot>
                </table>
            </div>
        </CCardBody>  
      </CCard>
      </transition>
    </CCol>

  </CRow>
</template>

<script>
  // CALCULOS
var subtotal = 0.0;
var iva = 0.0;
var total = 0.0;

/**
 * LOGICA PARA LA LISTA DE SERVICIOS
 */
var servicios_json;

servicios_json = [];

/*
var json = document.getElementById("servicios_json").value; //$("#servicios_json").val();

// Ver ejercicios al editar
if(json != null && json != ""){
    //console.log("JSON AL EDITAAAR")
    //console.log(json);

    servicios_json = JSON.parse(json);
    llenarTabla();
    //recalcularTabla();
}*/

var opciones_servicio_js = [];

import axios from 'axios'
export default {
  name: 'EditUser',
  props: {
    caption: {
      type: String,
      default: 'User id'
    },
  },
  data: () => {
    return {
        consulta: {
          paciente_id: '',
          doctor_id: '',
          resumen: '',
          diagnostico: '',
          prescripcion: '',
          servicios_json: ''
          
        },
        opciones_paciente: [],
        opciones_doctor: [],
        opciones_servicio: [],
        message: '',
        dismissSecs: 7,
        dismissCountDown: 0,
        showDismissibleAlert: false
    }
  },
  methods: {
    irAtras() {
      this.$router.go(-1)
      // this.$router.replace({path: '/users'})
    },
    guardar() {
        let self = this;
        
        // TOMAR LAS LLAVES DESDE LOS CAMPOS SELECT
        self.consulta.paciente_id = document.getElementById("paciente_id").value;
        self.consulta.doctor_id = document.getElementById("doctor_id").value;
        self.consulta.servicios_json = JSON.stringify(servicios_json);

        console.log(self.consulta);
        
        axios.post('/api/consultas',
          self.consulta
        )
        .then(function (response) {
            self.consulta = {
              paciente_id: '',
              doctor_id: '',
              resumen: '',
              diagnostico: '',
              prescripcion: '',
              servicios_json: ''

            };
            self.message = 'Consulta registrada con éxito.';
            self.showAlert();

        }).catch(function (error) {
            if(error.response.data.message == 'Datos inválidos.'){
              self.message = '';
              for (let key in error.response.data.errors) {
                if (error.response.data.errors.hasOwnProperty(key)) {
                  self.message += error.response.data.errors[key][0] + '  ';
                }
              }
              self.showAlert();
            }else{
              console.log(error);
              //self.$router.push({ path: 'login' }); 
            }
        });
    },
    countDownChanged (dismissCountDown) {
      this.dismissCountDown = dismissCountDown
    },
    showAlert () {
      this.dismissCountDown = this.dismissSecs
    },
    clickAddServicio(){
      //console.log("hOla consola desde modulo");
      //alert("Hola desde modulo");
      addServicio();
    },
    clickElemento(){
      alert("Edwin fila");
    },
    
    eliminar_elemento(event){
      var btn_fila = event.target;
      var indice = 0;
      indice = btn_fila.getAttribute("indice");

      console.log("INDICE: "+indice);

      if(indice){
          // Eliminar objeto json del arreglo
          servicios_json.splice(indice,1);
          // Eliminar fila de la tabla
          //$(this).closest('tr').remove();

          //mostrarJSON();
          // Actualizar la tabla
          //llenarTabla();
          llenarTabla();
      }
    },


  },
  mounted: function(){
    let self = this;

    /*
    OBTENER OPCIONES PARA POBLAR SELECT opciones_paciente
    */
    axios.get('/api/pacientes/')
    .then(function (response) {

      self.opciones_paciente = [];
      var tempPacientes = [];
      var paciente;
      
      tempPacientes.push({value: 0, label: "Seleccione"});
      
      // Recorrer la lista de pacientes
      for(var i=0; i<response.data.length; i++){
        // tomar paciente
        paciente = response.data[i];
        // agregar opcion en formato
        tempPacientes.push({value: paciente.id, label: paciente.nombre +" "+ paciente.apellidos});
      }

      // Actualizar lista para el select
      self.opciones_paciente = tempPacientes;    
    }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: 'login' });
    });

    /*
    OBTENER OPCIONES PARA POBLAR SELECT opciones_doctor
    */
    axios.get('/api/doctores/')
    .then(function (response) {

      self.opciones_doctor = [];
      var tempDoctores = [];
      var doctor;
      tempDoctores.push({value: 0, label: "Seleccione"});
      // Recorrer la lista de doctores
      for(var i=0; i<response.data.length; i++){
        // tomar doctor
        doctor = response.data[i];
        // agregar opcion en formato
        tempDoctores.push({value: doctor.id, label: doctor.nombre +" "+ doctor.apellidos+ " [" + doctor.especialidad+"]"});
      }

      // Actualizar lista para el select
      self.opciones_doctor = tempDoctores;      
    }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: 'login' });
    });


    /*
    OBTENER OPCIONES PARA POBLAR SELECT opciones_servicio
    */
    axios.get('/api/servicios/')
    .then(function (response) {

      self.opciones_servicio = [];
      var tempServicios = [];
      var servicio;
      tempServicios.push({value: 0, label: "Seleccione"});
      // Recorrer la lista de servicios
      for(var i=0; i<response.data.length; i++){
        // tomar servicio
        servicio = response.data[i];
        // agregar opcion en formato
        tempServicios.push({value: servicio.id, label: servicio.nombre +" ("+ servicio.costo+ ")" });
        
        opciones_servicio_js.push(servicio);
      }

      // Actualizar lista para el select
      self.opciones_servicio = tempServicios;

    }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: 'login' });
    });
    
  }
}

function calcularImporteSimple(){
  console.dir(opciones_servicio_js);

  var select_servicio = document.getElementById("servicio_id"); //&$("#servicio_id").val();
  var servicio_id = select_servicio.options[select_servicio.selectedIndex].value;

  var servicio = buscarObjServicio(servicio_id);
  var servicio_cantidad = document.getElementById("servicio_cantidad").value; //$("#servicio_cantidad").val();

  console.log(servicio_id);
  console.log(servicio_cantidad);
  console.log(servicio.costo);

  if (isNaN(servicio_cantidad) || isNaN(servicio.costo)){
    return;
  }
  
  var importe = Number(servicio_cantidad) * Number(servicio.costo);

  
  console.log(importe);

  document.getElementById("servicio_precio").value = servicio.costo; //$("#servicio_precio").val(servicio.costo);
  document.getElementById("servicio_importe").value = importe; //$("#servicio_importe").val(importe);

}

function buscarObjServicio(servicio_id){
  var servicio = {};

  // Recorrer la lista de servicios
  for(var i=0; i< opciones_servicio_js.length; i++){
    // tomar servicio
    servicio = opciones_servicio_js[i];

    if (servicio.id == servicio_id){
      return servicio;
    }
  }

  return servicio;
}



function llenarTabla(){

// Calculos Locales
var subtotal_servicios = 0;
var iva_servicios = 0;
var total_servicios = 0;


var indice_serv=0;
// Limpiar tabla
//$("#contenedor_servicios").empty();
document.getElementById("contenedor_servicios").innerHTML="";
for(var serv in servicios_json){

    var servicio = servicios_json[serv];

    // Añadir a la tabla

        // Mostrar el concepto si el servicio es manual
        //$("#contenedor_servicios").append(
        document.getElementById("contenedor_servicios").innerHTML +=
            `<tr>
                <th scope="row">`+(indice_serv+1)+`</th>
                <td>`+servicio.cantidad+`</td>
                <td>`+servicio.nombre+`</td>
                <td>`+formatMoney(servicio.costo)+`</td>
                <td>`+formatMoney(servicio.importe)+`</td>
                <td>
                    <input type="button"  class="btn btn-secondary btn-xs btn-editar" indice="`+indice_serv+`" value="Editar" />
                    <input type="button" id="btn_eliminar_"`+indice_serv+`" class="btn btn-danger btn-xs btn-eliminar" indice="`+indice_serv+`" value="Eliminar" @click.native="clickElemento()" />
                </td>
            </tr>`;
        //);

        //document.getElementById("btn_eliminar_"+indice_serv).addEventListener("click", eliminar_elemento(this), false);
    
    
    
    
    indice_serv++;

    // ACUMULAR CALCULOS
    subtotal_servicios += Number(servicio.importe);
}

// Actualizar campo JSON en el formulario
document.getElementById("servicios_json").value = JSON.stringify(servicios_json);

iva_servicios = subtotal_servicios * 0.16;
total_servicios = subtotal_servicios + iva_servicios;

// ACTUALIZAR CALCULOS GLOBALES 
subtotal += subtotal_servicios;
iva += iva_servicios;
total += total_servicios;

console.log("SUBTOTAL= "+ subtotal_servicios);

document.getElementById("subtotal_servicios_span").innerText = formatMoney(subtotal_servicios);
document.getElementById("iva_servicios_span").innerText = formatMoney(iva_servicios);
document.getElementById("total_servicios_span").innerText = formatMoney(total_servicios);

// Actualizar los TFOOT de la tabla
/*$("#subtotal_servicios_span").text(formatMoney(subtotal_servicios));
$("#iva_servicios_span").text(formatMoney(iva_servicios));
$("#total_servicios_span").text(formatMoney(total_servicios));
*/
}

function addServicio(){
  console.log("ENTRA 1");
    var select_servicio = document.getElementById("servicio_id"); //&$("#servicio_id").val();
    var servicio_id = select_servicio.options[select_servicio.selectedIndex].value;

    var servicio_cantidad = document.getElementById("servicio_cantidad").value; //$("#servicio_cantidad").val();

    var indice_serv = 0;

    var servicio = buscarObjServicio(servicio_id);

    console.log("ENTRA 2");

    // Si se seleccionó un servicio o se agregó en la caja de concepto
    if( servicio_id !=0 && servicio_cantidad !=""){

        // Crear objeto individual JSON
        var servicioCal = {
            id: servicio.id,
            nombre: servicio.nombre,
            costo: servicio.costo,
            cantidad: servicio_cantidad,
            importe: servicio_cantidad * servicio.costo
        }

        console.log("ENTRA 3");
        console.dir(servicioCal);

        // Añadir al objeto JSON maestro
        servicios_json.push(servicioCal);

        console.log("JSON SERVICIOS");
        console.dir(servicios_json);

        //limpiarCampos();
        //mostrarJSON();

        // Actualizar la tabla
        llenarTabla();
        //recalcularTablas();

    }

}


function eliminar_elemento(event){
  var btn_fila = event.target;
  var indice = 0;
  indice = btn_fila.getAttribute("indice");

  if(indice){
      // Eliminar objeto json del arreglo
      servicios_json.splice(indice,1);
      // Eliminar fila de la tabla
      //$(this).closest('tr').remove();

      //mostrarJSON();
      // Actualizar la tabla
      //llenarTabla();
      llenarTabla();
  }
}


function limpiarCampos(){

    // Cargar campos
    document.getElementById("servicio_cantidad").value=0;
    document.getElementById("servicio_importe").value=0;
    document.getElementById("servicio_precio").value=0;

    
    document.getElementById("servicio_id").selectedIndex =0;

}

/*
$("#servicio_cantidad").keyup(function(){
    calcularImporteSimple();
});*/

function formatMoney(number) {
    var decPlaces = 2;
    var decSep = ".";
    var thouSep = ",";

    decPlaces = isNaN(decPlaces = Math.abs(decPlaces)) ? 2 : decPlaces,
    decSep = typeof decSep === "undefined" ? "." : decSep;
    thouSep = typeof thouSep === "undefined" ? "," : thouSep;
    var sign = number < 0 ? "-" : "";
    var i = String(parseInt(number = Math.abs(Number(number) || 0).toFixed(decPlaces)));
    var j = (j = i.length) > 3 ? j % 3 : 0;
    
    return sign +
        (j ? i.substr(0, j) + thouSep : "") +
        i.substr(j).replace(/(\decSep{3})(?=\decSep)/g, "$1" + thouSep) +
        (decPlaces ? decSep + Math.abs(number - i).toFixed(decPlaces).slice(2) : "");
}

function DOM_listo(){
  console.log("DOM LISTO");
  var boton_add = document.getElementById("btn_add_servicio_orden");

  /*
  if(boton_add){
    boton_add.addEventListener("click", addServicio);
  }*/

  boton_add.onclick = function() { addServicio(); };
}




(function() {
   // your page initialization code here
   // the DOM will be available here

  document.addEventListener("keyup", calcularImporteSimple);
  document.addEventListener("change", calcularImporteSimple);

  //document.addEventListener('DOMContentLoaded', DOM_listo, false);

  //document.getElementById("btn_add_servicio_orden").addEventListener("click", clickEdwin);
  
})();




</script>
