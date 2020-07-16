<template>
  <CRow>
    <CCol col="12" lg="6">
      <CCard>
        <CCardBody>
          <h3>
            Editar Paciente
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
        axios.post(  '/api/pacientes/' + self.$route.params.id,
        {
            _method: 'PUT',

            /*
              ENVIAR LOS CAMPOS DEL PACIENTE A ACTUALIZAR
            */
            nombre: self.paciente.nombre,
            apellidos: self.paciente.apellidos,
            telefono: self.paciente.telefono,
            direccion: self.paciente.direccion,
            sexo: self.paciente.sexo,
            fecha_nacimiento: self.paciente.fecha_nacimiento,
            alergias: self.paciente.alergias,
            enfermedades_cronicas: self.paciente.enfermedades_cronicas
        })
        .then(function (response) {
            self.message = 'Información del Paciente actualizada con éxito.';
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
  },
  mounted: function(){
    /*
      TRAER LOS DATOS DEL PACIENTE EDITANDO
    */
    let self = this;
    axios.get('/api/pacientes/' + self.$route.params.id)
    .then(function (response) {
        self.paciente = response.data;

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
