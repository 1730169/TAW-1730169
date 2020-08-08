<template>
  <CRow>
    <CCol col="12" xl="12">
      <transition name="slide">
      <CCard>
        <CCardBody>
            <CButton color="primary" @click="registrarConsulta()">Registrar Consulta</CButton>
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
              <template #fecha="{item}">
                <td>
                  <strong>{{item.fecha}}</strong>
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
              <template #diagnostico="{item}">
                <td>
                  {{item.diagnostico}}
                </td>
              </template>
              
              <template #cobrar="{item}">
                <td>
                  <CButton color="success" @click="cobrarConsulta( item.id )">Cobrar</CButton>
                </td>
              </template>
              <template #compartir="{item}">
                <td>
                  <CButton  color="warning" @click="compartirConsulta( item.id )">Compartir</CButton>
                  <!-- v-if="you!=item.id" -->
                </td>
              </template>
              <template #eliminar="{item}">
                <td>
                  <CButton  color="danger" @click="eliminarConsulta( item.id )">Eliminar</CButton>
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
  name: 'Consultas',
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
      fields: ['fecha', 'doctor', 'paciente', 'diagnostico', 'cobrar','compartir', 'eliminar'],
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
      return `consultas/${id.toString()}`
    },
    cobrarLink (id) {
      return `consultas/${id.toString()}/cobrar`
    },
    compartirLink (id) {
      return `compartirs/${id.toString()}/registrar`
    },
    verConsulta ( id ) {
      const pacienteLink = this.pacienteLink( id );
      this.$router.push({path: pacienteLink});
    },
    cobrarConsulta ( id ) {
      const cobrarLink = this.cobrarLink( id );
      this.$router.push({path: cobrarLink});
    },
    compartirConsulta ( id ) {
      const compartirLink = this.compartirLink( id );
      this.$router.push({path: compartirLink});
    },
    eliminarConsulta ( id ) {
      let self = this;
      let pacienteId = id;
      axios.post(  '/api/consultas/' + id, {
        _method: 'DELETE'
      })
      .then(function (response) {
          self.message = 'Consulta eliminada con éxito.';
          self.verAlert();
          self.getConsultas();
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    },
    registrarConsulta () {
      this.$router.push({path: '/consultas/registrar'});
    },
    countDownChanged (dismissCountDown) {
      this.dismissCountDown = dismissCountDown
    },
    verAlert () {
      this.dismissCountDown = this.dismissSecs
    },
    getConsultas (){
      let self = this;
      axios.get(  '/api/consultas?token=' + localStorage.getItem("api_token"))
      .then(function (response) {
        self.items = response.data;
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    }
  },
  mounted: function(){
    this.getConsultas();
  }
}
</script>

<style scoped>
.card-body >>> table > tbody > tr > td {
  cursor: pointer;
}
</style>
