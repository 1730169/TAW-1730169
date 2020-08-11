<template>
  <CRow>
    <CCol col="12" xl="12">
      <transition name="slide">
      <CCard>
        <CCardBody>
          <CButton color="success" class="btn-lg" @click="registrarCorte()">Hacer corte ahora</CButton>
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
              <template #fecha_corte="{item}">
                <td>
                  <strong>{{item.fecha_corte}}</strong>
                </td>
              </template>

              <template #monto_corte="{item}">
                <td>
                  {{item.monto_corte}}
                </td>
              </template>
              
              <template #usuario="{item}">
                <td>
                  {{item.usuario}}
                </td>  
              </template>

              <template #eliminar="{item}">
                <td>
                  <CButton  color="danger" @click="eliminarCorte( item.id )">Eliminar</CButton>
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
  name: 'Cortes',
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
        {key: 'usuario_type'},
        {key: 'ver'},
        {key: 'edit'},
        {key: 'delete'}
      ],
      */
      fields: ['fecha_corte', 'monto_corte', 'usuario','eliminar'],
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
    eliminarCorte ( id ) {
      let self = this;
      let pacienteId = id;
      axios.post(  '/api/cortecajas/' + id, {
        _method: 'DELETE'
      })
      .then(function (response) {
          self.message = 'Corte eliminada con éxito.';
          self.verAlert();
          self.getCortes();
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    },
    /*registrarCorte () {
      this.$router.push({path: '/cortecajas/registrar'});
    },*/
    countDownChanged (dismissCountDown) {
      this.dismissCountDown = dismissCountDown
    },
    verAlert () {
      this.dismissCountDown = this.dismissSecs
    },
    getCortes (){
      let self = this;
      axios.get(  '/api/cortecajas' )
      .then(function (response) {
        self.items = response.data;
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    },

    registrarCorte() {
      let self = this;
      axios.post('/api/cortecajas?token=' + localStorage.getItem("api_token"),
        []
      )
      .then(function (response) {
          self.message = 'Corte de caja registrado con éxito.';
          self.verAlert();

          self.getCortes();

      }).catch(function (error) {
          if(error.response.data.message == 'Datos inválidos.'){
            self.message = '';
            for (let key in error.response.data.errors) {
              if (error.response.data.errors.hasOwnProperty(key)) {
                self.message += error.response.data.errors[key][0] + '  ';
              }
            }
            self.verAlert();
          }else{
            console.log(error);
            //self.$router.push({ path: 'login' }); 
          }
      });
    }
  },
  mounted: function(){
    this.getCortes();
  }
}
</script>

<style scoped>
.card-body >>> table > tbody > tr > td {
  cursor: pointer;
}
</style>
