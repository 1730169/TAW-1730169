<template>
  <CRow>
    <CCol col="12" xl="12">
      <transition name="slide">
      <CCard>
        <CCardBody>
            <CButton color="primary" @click="registrarCita()">Registrar Cita</CButton>
            <br>
            <CDataTable
              hover
              :items="items"
              :fields="fields"
              :items-per-page="10"
              column-filter
              table-filter
              pagination
            >
              <template #fecha_cita="{item}">
                <td>
                  <strong>{{item.fecha_cita}}</strong>
                </td>
              </template>

              <template #doctor="{item}">
                <td>
                  <strong>{{item.doctor}}</strong>
                </td>
              </template>
              
              <template #paciente="{item}">
                <td>
                  {{item.paciente}}
                </td>  
              </template>
              <template #motivo="{item}">
                <td>
                  {{item.motivo}}
                </td>
              </template>
              
              <template #editar="{item}">
                <td>
                  <CButton color="primary" @click="editarCita( item.id )">Editar</CButton>
                </td>
              </template>
              <template #eliminar="{item}">
                <td>
                  <CButton  color="danger" @click="eliminarCita( item.id )">Eliminar</CButton>
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
  name: 'Citaes',
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
      fields: ['fecha_cita', 'doctor', 'paciente', 'motivo', 'editar', 'eliminar'],
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
      return `citas/${id.toString()}`
    },
    editLink (id) {
      return `citas/${id.toString()}/editar`
    },
    verCita ( id ) {
      const pacienteLink = this.pacienteLink( id );
      this.$router.push({path: pacienteLink});
    },
    editarCita ( id ) {
      const editLink = this.editLink( id );
      this.$router.push({path: editLink});
    },
    eliminarCita ( id ) {
      let self = this;
      let pacienteId = id;
      axios.post(  '/api/citas/' + id, {
        _method: 'DELETE'
      })
      .then(function (response) {
          self.message = 'Cita eliminada con éxito.';
          self.verAlert();
          self.getCitas();
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    },
    registrarCita () {
      this.$router.push({path: '/citas/registrar'});
    },
    countDownChanged (dismissCountDown) {
      this.dismissCountDown = dismissCountDown
    },
    verAlert () {
      this.dismissCountDown = this.dismissSecs
    },
    getCitas (){
      let self = this;
      axios.get(  '/api/citas' )
      .then(function (response) {
        self.items = response.data;
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    }
  },
  mounted: function(){
    this.getCitas();
  }
}
</script>

<style scoped>
.card-body >>> table > tbody > tr > td {
  cursor: pointer;
}
</style>
