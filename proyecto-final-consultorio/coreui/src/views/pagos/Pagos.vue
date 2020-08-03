<template>
  <CRow>
    <CCol col="12" xl="12">
      <transition name="slide">
      <CCard>
        <CCardBody>
            
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

              <template #monto="{item}">
                <td>
                  {{item.monto}}
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
  name: 'Pagos',
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
      fields: ['fecha', 'doctor', 'paciente', 'diagnostico', 'monto'],
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
      return `pagos/${id.toString()}`
    },
    cobrarLink (id) {
      return `pagos/${id.toString()}/cobrar`
    },
    verPago ( id ) {
      const pacienteLink = this.pacienteLink( id );
      this.$router.push({path: pacienteLink});
    },
    cobrarPago ( id ) {
      const cobrarLink = this.cobrarLink( id );
      this.$router.push({path: cobrarLink});
    },
    eliminarPago ( id ) {
      let self = this;
      let pacienteId = id;
      axios.post(  '/api/pagos/' + id, {
        _method: 'DELETE'
      })
      .then(function (response) {
          self.message = 'Pago eliminada con éxito.';
          self.verAlert();
          self.getPagos();
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    },
    registrarPago () {
      this.$router.push({path: '/pagos/registrar'});
    },
    countDownChanged (dismissCountDown) {
      this.dismissCountDown = dismissCountDown
    },
    verAlert () {
      this.dismissCountDown = this.dismissSecs
    },
    getPagos (){
      let self = this;
      axios.get(  '/api/pagos' )
      .then(function (response) {
        self.items = response.data;
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    }
  },
  mounted: function(){
    this.getPagos();
  }
}
</script>

<style scoped>
.card-body >>> table > tbody > tr > td {
  cursor: pointer;
}
</style>
