<template>
  <CRow>
    <CCol col="12" lg="6">
      <CCard>
        <CCardBody>
          <h3>
            Editar Cita
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
              label="Paciente" 
              :value.sync="cita.paciente_id"
              v-model="cita.paciente_id"
              :plain="true"
              :options="opciones_paciente" id="paciente_id">
            </CSelect>
            
            <CSelect
              label="Doctor" 
              :value.sync="cita.doctor_id"
              v-model="cita.doctor_id"
              :plain="true"
              :options="opciones_doctor" id="doctor_id">
            </CSelect>

            <CInput label="Fecha de la cita" type="datetime-local" v-model="cita.fecha_cita"></CInput>
            <CInput label="Motivo" type="text" placeholder="Motivo" v-model="cita.motivo"></CInput>
            
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
      cita: {
          paciente_id: '',
          cita_id: '',
          fecha_cita: '',
          motivo: ''
          
        },
        opciones_paciente: [],
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
        self.cita.paciente_id = document.getElementById("paciente_id").value;
        self.cita.doctor_id = document.getElementById("doctor_id").value;

        axios.post(  '/api/citas/' + self.$route.params.id,
        {
            _method: 'PUT',

            /*
              ENVIAR LOS CAMPOS DEL DOCTOR A ACTUALIZAR
            */
            paciente_id: self.cita.paciente_id,
            doctor_id: self.cita.doctor_id,
            fecha_cita: self.cita.fecha_cita,
            motivo: self.cita.motivo
            
        })
        .then(function (response) {
            self.message = 'Información de la Cita actualizada con éxito.';
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
      TRAER LOS DATOS DE LA CITA EDITANDO
    */
    let self = this;
    axios.get('/api/citas/' + self.$route.params.id)
    .then(function (response) {
        self.cita = response.data;

        // DAR FORMATO A LA FECHA PARA MOSTRARLA
        var DateFechaCita = new Date(self.cita.fecha_cita);
        self.cita.fecha_cita = (DateFechaCita.toISOString()).split(":")[0]+":"+(DateFechaCita.toISOString()).split(":")[1];
    
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
