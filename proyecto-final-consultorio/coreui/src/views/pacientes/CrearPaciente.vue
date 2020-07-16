<template>
  <CRow>
    <CCol col="12" lg="6">
      <CCard no-header>
        <CCardBody>
          <h3>
            Registrar paciente
          </h3>
          <CAlert
            :show.sync="dismissCountDown"
            color="primary"
            fade
          >
            ({{dismissCountDown}}) {{ message }}
          </CAlert>

          <!-- DECLARACION DE CAMPOS PARA EL FORMULARIO DE REGISTRO -->
            <CInput label="Nombre" type="text" placeholder="Nombre" v-model="paciente.nombre"></CInput>
            <CInput label="Apellidos" type="text" placeholder="Apellidos" v-model="paciente.apellidos"></CInput>
            <CInput textarea="true" label="Dirección" :rows="9" placeholder="Calle, numero, colonia, ciudad" v-model="paciente.direccion"></CInput>
            <CInput label="Teléfono" type="text" placeholder="Teléfono" v-model="paciente.telefono"></CInput>
            <CSelect
              label="Sexo" 
              :value.sync="paciente.sexo"
              :plain="true"
              :options="opciones_sexo">
            </CSelect>

            <CInput label="Fecha de nacimiento" type="date" v-model="paciente.fecha_nacimiento"></CInput>

            <CInput textarea="true" label="Alergias" :rows="9" placeholder="Enlistar alergias del paciente" v-model="paciente.alergias"></CInput>
            <CInput textarea="true" label="Enfermedades crónicas" :rows="9" placeholder="Enlistar enfermedades crónicas del paciente" v-model="paciente.enfermedades_cronicas"></CInput>

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
        paciente: {
          nombre: '',
          apellidos: '',
          direccion: '',
          telefono: '',
          sexo: '',
          fecha_nacimiento: '',
          alergias: '',
          enfermedades_cronicas: '',
          
        },
        opciones_sexo: [{ value: 0, label: 'Seleccione' },{ value: 'F', label: 'Femenino' }, { value: 'M', label: 'Masculino' }],
        message: '',
        dismissSecs: 5,
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
        axios.post(  '/api/pacientes',
          self.paciente
        )
        .then(function (response) {
            self.paciente = {
              nombre: '',
              apellidos: '',
              direccion: '',
              telefono: '',
              sexo: '',
              fecha_nacimiento: '',
              alergias: '',
              enfermedades_cronicas: '',

            };
            self.message = 'Paciente registrado con éxito.';
            self.showAlert();
            // Redireccionar al listado
            self.$router.push({ path: '/pacientes' });
        
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
    axios.get(  '/api/pacientes/create?token=' + localStorage.getItem("api_token"))
    .then(function (response) {
        //self.opciones_sexo = //''Femenino', Masculino'response.data;
    }).catch(function (error) {
        console.log(error);
        self.$router.push({ path: 'login' });
    });
    */
  }
}

</script>
