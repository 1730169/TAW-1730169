<template>
  <CRow>
    <CCol col="12" lg="6">
      <CCard no-header>
        <CCardBody>
          <h3>
            Registrar Doctor
          </h3>
          <CAlert
            :show.sync="dismissCountDown"
            color="primary"
            fade
          >
            ({{dismissCountDown}}) {{ message }}
          </CAlert>

          <!-- DECLARACION DE CAMPOS PARA EL FORMULARIO DE REGISTRO -->
            <CInput label="Nombre" type="text" placeholder="Nombre" v-model="doctor.nombre"></CInput>
            <CInput label="Apellidos" type="text" placeholder="Apellidos" v-model="doctor.apellidos"></CInput>
            <CInput textarea="true" label="Dirección" :rows="9" placeholder="Calle, numero, colonia, ciudad" v-model="doctor.direccion"></CInput>
            <CInput label="Teléfono" type="text" placeholder="Teléfono" v-model="doctor.telefono"></CInput>
            <CInput label="Fecha de nacimiento" type="date" v-model="doctor.fecha_nacimiento"></CInput>
            <CInput label="Título" type="text" placeholder="Título" v-model="doctor.titulo"></CInput>
            <CInput label="Especialidad" type="text" placeholder="Especialidad" v-model="doctor.especialidad"></CInput>
            <CInput label="Cédula Profesional" type="text" placeholder="Cédula Profesional" v-model="doctor.cedula"></CInput>
            <CInput label="Consultorio" type="text" placeholder="Consultorio" v-model="doctor.consultorio"></CInput>
            
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
        doctor: {
          nombre: '',
          apellidos: '',
          direccion: '',
          telefono: '',
          fecha_nacimiento: '',
          titulo: '',
          especialidad: '',
          cedula: '',
          consultorio: '',
          
        },
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
        axios.post(  '/api/doctores',
          self.doctor
        )
        .then(function (response) {
            self.doctor = {
              nombre: '',
              apellidos: '',
              direccion: '',
              telefono: '',
              fecha_nacimiento: '',
              titulo: '',
              especialidad: '',
              cedula: '',
              consultorio: '',

            };
            self.message = 'Doctor registrado con éxito.';
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
  }
}

</script>
