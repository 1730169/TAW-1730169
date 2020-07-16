<template>
  <CRow>
    <CCol col="12" xl="12">
      <transition name="slide">
      <CCard>
        <CCardBody>
            <CButton color="primary" @click="registrarDoctor()">Registrar Doctor</CButton>
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
              <template #titulo="{item}">
                <td>
                  {{item.titulo}}
                </td>
              </template>
              <template #especialidad="{item}">
                <td>
                  {{item.especialidad}}
                </td>
              </template>
              
              <template #editar="{item}">
                <td>
                  <CButton color="primary" @click="editarDoctor( item.id )">Editar</CButton>
                </td>
              </template>
              <template #eliminar="{item}">
                <td>
                  <CButton  color="danger" @click="eliminarDoctor( item.id )">Eliminar</CButton>
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
  name: 'Doctores',
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
      fields: ['nombre', 'apellidos', 'telefono', 'titulo', 'especialidad', 'editar', 'eliminar'],
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
      return `doctores/${id.toString()}`
    },
    editLink (id) {
      return `doctores/${id.toString()}/editar`
    },
    verDoctor ( id ) {
      const pacienteLink = this.pacienteLink( id );
      this.$router.push({path: pacienteLink});
    },
    editarDoctor ( id ) {
      const editLink = this.editLink( id );
      this.$router.push({path: editLink});
    },
    eliminarDoctor ( id ) {
      let self = this;
      let pacienteId = id;
      axios.post(  '/api/doctores/' + id, {
        _method: 'DELETE'
      })
      .then(function (response) {
          self.message = 'Doctor eliminado con éxito.';
          self.verAlert();
          self.getDoctores();
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    },
    registrarDoctor () {
      this.$router.push({path: '/doctores/registrar'});
    },
    countDownChanged (dismissCountDown) {
      this.dismissCountDown = dismissCountDown
    },
    verAlert () {
      this.dismissCountDown = this.dismissSecs
    },
    getDoctores (){
      let self = this;
      axios.get(  '/api/doctores' )
      .then(function (response) {
        self.items = response.data;
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    }
  },
  mounted: function(){
    this.getDoctores();
  }
}
</script>

<style scoped>
.card-body >>> table > tbody > tr > td {
  cursor: pointer;
}
</style>
