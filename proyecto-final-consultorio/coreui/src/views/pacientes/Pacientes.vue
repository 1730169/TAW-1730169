<template>
  <CRow>
    <CCol col="12" xl="12">
      <transition name="slide">
      <CCard>
        <CCardBody>
            <CButton color="primary" @click="registrarPaciente()">Registrar Paciente</CButton>
            <br>
            <CDataTable
              hover
              :items="items"
              :fields="fields"
              :items-per-page="10"
              pagination
            >
              <template #nombre="{item}">
                <td>
                  <strong>{{item.nombre}}</strong>
                </td>
              </template>

              <template #apellidos="{item}">
                <td>
                  <strong>{{item.apellidos}}</strong>
                </td>
              </template>
              
              <template #telefono="{item}">
                <td>
                  {{item.telefono}}
                </td>  
              </template>
              <template #sexo="{item}">
                <td>
                  {{item.sexo}}
                </td>
              </template>
              
              
              <template #editar="{item}">
                <td>
                  <CButton color="primary" @click="editarPaciente( item.id )">Editar</CButton>
                </td>
              </template>
              <template #eliminar="{item}">
                <td>
                  <CButton  color="danger" @click="eliminarPaciente( item.id )">Eliminar</CButton>
                  <!-- v-if="you!=item.id" -->
                </td>
              </template>
            </CDataTable>
        </CCardBody>  
      </CCard>
      </transition>
    </CCol>
  </CRow>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Pacientes',
  data: () => {
    return {
      items: [],
      /*
      fields: [
        {key: 'author'},
        {key: 'title'},
        {key: 'content'},
        {key: 'applies_to_date'},
        {key: 'status'},
        {key: 'paciente_type'},
        {key: 'ver'},
        {key: 'edit'},
        {key: 'delete'}
      ],
      */
      fields: ['nombre', 'apellidos', 'telefono', 'sexo', 'editar', 'eliminar'],
      currentPage: 1,
      perPage: 5,
      totalRows: 0,
      you: null,
      message: '',
      verMessage: false,
      dismissSecs: 7,
      dismissCountDown: 0,
      verDismissibleAlert: false
    }
  },
  computed: {
  },
  methods: {
    getRowCount (items) {
      return items.length
    },
    pacienteLink (id) {
      return `pacientes/${id.toString()}`
    },
    editLink (id) {
      return `pacientes/${id.toString()}/editar`
    },
    verPaciente ( id ) {
      const pacienteLink = this.pacienteLink( id );
      this.$router.push({path: pacienteLink});
    },
    editarPaciente ( id ) {
      const editLink = this.editLink( id );
      this.$router.push({path: editLink});
    },
    eliminarPaciente ( id ) {
      let self = this;
      let pacienteId = id;
      axios.post(  '/api/pacientes/' + id, {
        _method: 'DELETE'
      })
      .then(function (response) {
          self.message = 'Paciente eliminado con éxito.';
          self.verAlert();
          self.getPacientes();
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    },
    registrarPaciente () {
      this.$router.push({path: '/pacientes/registrar'});
    },
    countDownChanged (dismissCountDown) {
      this.dismissCountDown = dismissCountDown
    },
    verAlert () {
      this.dismissCountDown = this.dismissSecs
    },
    getPacientes (){
      let self = this;
      axios.get(  '/api/pacientes' )
      .then(function (response) {
        self.items = response.data;
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    }
  },
  mounted: function(){
    this.getPacientes();
  }
}
</script>

<style scoped>
.card-body >>> table > tbody > tr > td {
  cursor: pointer;
}
</style>
