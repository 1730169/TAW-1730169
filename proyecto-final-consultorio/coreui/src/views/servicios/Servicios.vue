<template>
  <CRow>
    <CCol col="12" xl="12">
      <transition name="slide">
      <CCard>
        <CCardBody>
            <CButton color="primary" @click="registrarServicio()">Registrar Servicio</CButton>
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
              

              <template #doctor="{item}">
                <td>
                  <strong>{{item.doctor}}</strong>
                </td>
              </template>

              <template #nombre="{item}">
                <td>
                  <strong>{{item.nombre}}</strong>
                </td>
              </template>
              
              <template #costo="{item}">
                <td>
                  {{item.costo}}
                </td>  
              </template>

              <template #editar="{item}">
                <td>
                  <CButton color="primary" @click="editarServicio( item.id )">Editar</CButton>
                </td>
              </template>
              <template #eliminar="{item}">
                <td>
                  <CButton  color="danger" @click="eliminarServicio( item.id )">Eliminar</CButton>
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
  name: 'Servicios',
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
        {key: 'costo_type'},
        {key: 'ver'},
        {key: 'edit'},
        {key: 'delete'}
      ],
      */
      fields: ['doctor','nombre', 'costo', 'editar', 'eliminar'],
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
    costoLink (id) {
      return `servicios/${id.toString()}`
    },
    editLink (id) {
      return `servicios/${id.toString()}/editar`
    },
    verServicio ( id ) {
      const costoLink = this.costoLink( id );
      this.$router.push({path: costoLink});
    },
    editarServicio ( id ) {
      const editLink = this.editLink( id );
      this.$router.push({path: editLink});
    },
    eliminarServicio ( id ) {
      let self = this;
      let costoId = id;
      axios.post(  '/api/servicios/' + id, {
        _method: 'DELETE'
      })
      .then(function (response) {
          self.message = 'Servicio eliminado con éxito.';
          self.verAlert();
          self.getServicios();
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    },
    registrarServicio () {
      this.$router.push({path: '/servicios/registrar'});
    },
    countDownChanged (dismissCountDown) {
      this.dismissCountDown = dismissCountDown
    },
    verAlert () {
      this.dismissCountDown = this.dismissSecs
    },
    getServicios (){
      let self = this;
      axios.get(  '/api/servicios' )
      .then(function (response) {
        self.items = response.data;
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    }
  },
  mounted: function(){
    this.getServicios();
  }
}
</script>

<style scoped>
.card-body >>> table > tbody > tr > td {
  cursor: pointer;
}
</style>
