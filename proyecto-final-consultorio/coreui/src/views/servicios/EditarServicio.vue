<template>
  <CRow>
    <CCol col="12" lg="6">
      <CCard>
        <CCardBody>
          <h3>
            Editar Servicio
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
              :value.sync="servicio.doctor_id"
              v-model="servicio.doctor_id"
              :plain="true"
              :options="opciones_doctor" id="doctor_id">
            </CSelect>

            <CInput label="Nombre" type="text" placeholder="Nombre" v-model="servicio.nombre"></CInput>
            <CInput textarea="true" label="Descripción" :rows="10" placeholder="Descripción del servicio..." v-model="servicio.descripcion"></CInput>
            <CInput label="Costo" type="number" placeholder="Costo" v-model="servicio.costo"></CInput>
            
          <!-- TERMINAN CAMPOS DE FORMULARIO-->

          <CButton color="primary" @click="actualizar()">Guardar</CButton>
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
      servicio: {
          doctor_id: '',
          nombre: '',
          descripcion: '',
          costo: 0
          
        },
        opciones_doctor: [],
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
    actualizar() {
        let self = this;
        // TOMAR LAS LLAVES DESDE LOS CAMPOS SELECT
        self.servicio.doctor_id = document.getElementById("doctor_id").value;

        axios.post(  '/api/servicios/' + self.$route.params.id,
        {
            _method: 'PUT',

            /*
              ENVIAR LOS CAMPOS DEL DOCTOR A ACTUALIZAR
            */
            doctor_id: self.servicio.doctor_id,
            nombre: self.servicio.nombre,
            descripcion: self.servicio.descripcion,
            costo: self.servicio.costo
        })
        .then(function (response) {
            self.message = 'Datos del servicio actualizados con éxito.';
            self.showAlert();

            // LIMPIAR CAMPOS
            self.servicio = {
              //doctor_id: '',
              nombre: '',
              descripcion: '',
              costo: 0
            };
          
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
  },
  mounted: function(){

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
      TRAER LOS DATOS DEL SERVICIO EDITANDO
    */
    let self = this;
    axios.get('/api/servicios/' + self.$route.params.id)
    .then(function (response) {
        self.servicio = response.data;

        
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

</script>
