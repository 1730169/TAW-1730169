<template>
  <CRow>
    <CCol col="12" lg="12">
      <CCard>
        <CCardBody>
          <h3>
            Cobrar Consulta
          </h3>
          <CAlert
            :show.sync="dismissCountDown"
            color="primary"
            fade
          >
            ({{dismissCountDown}}) {{ message }}
          </CAlert>
            
            <!-- DECLARACION DE CAMPOS PARA EL FORMULARIO DE REGISTRO -->
            <div>
              <table class="table" id="tabla_servicios">
                    <thead>
                        <tr>
                        <th scope="col">#</th>
                        <th scope="col">CANTIDAD</th>
                        <th scope="col">CONCEPTO</th>
                        <th scope="col">PRECIO</th>
                        <th scope="col">IMPORTE</th>
                        
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
            
            <h2> TOTAL A PAGAR: <span id="total_pagar">$0.0</span></h2>
            <br>
            <CInput label="Monto paga" type="number" min="0" id="monto" v-on:keyup="calcularCambio()"></CInput>
            <CInput label="Cambio" type="number" min="0" id="cambio" readonly></CInput>
            
            
          <!-- TERMINAN CAMPOS DE FORMULARIO-->

          <CButton color="primary" class="btn-lg" @click="cobrar()">Cobrar</CButton>&nbsp;&nbsp;&nbsp;
          <CButton color="secondary" @click="irAtras">Atrás</CButton>
        </CCardBody>
      </CCard>
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
      pago: {
          consulta_id: '',
          
        },
        message: '',
        dismissSecs: 7,
        dismissCountDown: 0,
    }
  },
  methods: {
    irAtras() {
      this.$router.go(-1)
      // this.$router.replace({path: '/users'})
    },
    cobrar() {
        let self = this;
        // TOMAR LAS LLAVES DESDE LOS CAMPOS SELECT
        //self.consulta.paciente_id = document.getElementById("paciente_id").value;
        //self.consulta.doctor_id = document.getElementById("doctor_id").value;

        axios.post('/api/pagos/',
        {
            //_method: 'PUT',

            /*
              ENVIAR LOS CAMPOS DEL DOCTOR A ACTUALIZAR
            */
            consulta_id: self.$route.params.id,
            monto: total
            
        })
        .then(function (response) {
            self.message = 'Consulta pagada con éxito.';
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
              //self.$router.push({ path: '/login' }); 
            }
        });
    },
    showAlert () {
      this.dismissCountDown = this.dismissSecs
    },

    calcularCambio(){
      var monto = Number(document.getElementById("monto").value)
      var total_pagar = Number(total);
      var cambio = monto - total_pagar;

      // Desplegar cambio
      document.getElementById("cambio").value = cambio;
      
    },
  },
  mounted: function(){

    // OBTENER LOS SERVICIOS DE ESTA CONSULTA
    let self = this;

    axios.get('/api/servicioconsultas/lista/' + self.$route.params.id)
    .then(function (response) {
        //self.consulta = response.data;
        console.log("..... SERVICIOS.....");
        console.dir(response.data);

        //llenarTabla();
        servicios_json = response.data;

        llenarTabla();

        // Desplegar total a pagar
        document.getElementById("total_pagar").innerText = "$"+formatMoney(total);

    }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
    });

    
  }
}

/*
      items: (id) => {
        const user = usersData.find( user => user.id.toString() === id)
        const userDetails = user ? Object.entries(user) : [['id', 'Not found']]
        return userDetails.map(([key, value]) => {return {key: key, value: value}})
      },
*/
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
      var importe = Number(servicio.cantidad) * Number(servicio.costo);
      // Añadir a la tabla

          // Mostrar el concepto si el servicio es manual
          //$("#contenedor_servicios").append(
          document.getElementById("contenedor_servicios").innerHTML +=
              `<tr>
                  <th scope="row">`+(indice_serv+1)+`</th>
                  <td>`+servicio.cantidad+`</td>
                  <td>`+servicio.nombre+`</td>
                  <td>`+formatMoney(servicio.costo)+`</td>
                  <td>`+formatMoney(importe)+`</td>
              </tr>`;
          //);

          //document.getElementById("btn_eliminar_"+indice_serv).addEventListener("click", eliminar_elemento(this), false);
      
      
      
      
      indice_serv++;

      // ACUMULAR CALCULOS
      subtotal_servicios += Number(importe);
  }

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

</script>
