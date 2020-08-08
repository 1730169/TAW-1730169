<template>
  <CRow>
    <CCol col="12" lg="6">
      <CCard no-header>
        <CCardBody>
          <h3>
            Compartir Consulta
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
              :value.sync="compartir.doctor_afiliado_id"
              v-model="compartir.doctor_afiliado_id"
              :plain="true"
              :options="opciones_doctor" id="doctor_afiliado_id">
            </CSelect>

            <!-- TERMINAN CAMPOS DE FORMULARIO-->
            

          <CButton color="primary" @click="guardar()">Guardar</CButton>
          <CButton color="primary" @click="irAtras">Atrás</CButton>
        </CCardBody>
      </CCard>
    </CCol>
  </CRow>
</template>

<script>

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
        compartir: {
          consulta_id: '',
          doctor_afiliado_id: ''
        },
        opciones_doctor: [],
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
        self.compartir.doctor_afiliado_id = document.getElementById("doctor_afiliado_id").value;
        // Asociar ID de consulta
        self.compartir.consulta_id = self.$route.params.id;


        console.log(self.compartir);
        
        axios.post('/api/compartirs',
          self.compartir
        )
        .then(function (response) {
            self.compartir = {
              consulta_id:'',
              doctor_afiliado_id: ''

            };
            self.message = 'Consulta compartida con éxito.';
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
    
  },
  mounted: function(){
    let self = this;

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

    
  }
}

</script>
