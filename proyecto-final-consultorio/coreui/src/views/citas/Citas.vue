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

            <br><br><br>
            <FullCalendar :options="calendarOptions"  :plugins="calendarPlugins" :events="events" />      
            
        </CCardBody>  
      </CCard>

      

      </transition>
    </CCol>

  </CRow>

  
</template>

<script>
var eventos;
eventos = [];

import axios from 'axios'

import FullCalendar from '@fullcalendar/vue'
import dayGridPlugin from '@fullcalendar/daygrid'
import interactionPlugin from '@fullcalendar/interaction'
import timeGridPlugin from '@fullcalendar/timegrid'

export default {
  name: 'Citas',
  components: {
    FullCalendar // make the <FullCalendar> tag available
  },
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
      calendarPlugins: [dayGridPlugin, interactionPlugin, timeGridPlugin],
      calendarOptions: {
        plugins: [ dayGridPlugin, interactionPlugin, timeGridPlugin],
        //initialView: 'dayGridMonth'
        //dateClick: this.handleDateClick,
        events: [
          { title: 'event 1', start: '2019-04-01' },
          { title: 'event 2', start: '2019-04-02' }
        ] 
      },
      events: [],
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
  created(){
    this.getCitas();
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
      
      axios.get(  '/api/citas?token=' + localStorage.getItem("api_token"))
      .then(function (response) {
        self.items = response.data;

        var eventos = [];

        // Recorrer la lista de pacientes
      for(var i=0; i<response.data.length; i++){
        // tomar paciente
        var cita = response.data[i];
        // agregar opcion en formato
        var fecha = cita.fecha_cita;
        var fecha_split = fecha.split(" ")[0];
        eventos.push({
          title: "-CITA- Paciente: "+cita.paciente +" Doctor: "+ cita.doctor,
          start: fecha_split,
          url: ""
        });
        
        /*
        var opciones = {
          plugins: [ dayGridPlugin, interactionPlugin, timeGridPlugin],
          initialView: 'dayGridMonth',
          //dateClick: this.handleDateClick,
          events: eventos
        };
        let self = this;

        
        self.calendarOptions.events = eventos;
        */
       
        //return opciones;
      }

      console.log("EVENTOS ............................");
      console.dir(eventos);
      self.events = eventos;
      self.calendarOptions.events = eventos;
        
        


      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
      
    },

    /*
    handleDateClick: function(arg) {
      alert('date click! ' + arg.dateStr)
    }*/


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


<!--
<script>
  $(document).ready(function() {
      // page is now ready, initialize the calendar...
      $('#calendar').fullCalendar({
          // put your options and callbacks here
          events : [
              @foreach($tasks as $task)
              {
                  title : '{{ $task->name }}',
                  start : '{{ $task->task_date }}',
                  url : '{{ route('tasks.edit', $task->id) }}'
              },
              @endforeach
          ]
      })
  });
</script>
-->


