<template lang="html">
      <div class="consultas">
        
        <div class="half">
          
          <h1>Create consulta</h1>
          
          <form @submit.prevent="createConsulta">
            
            <div class="form-group">
   
                  <input type="hidden" v-model="form.id"></input>
            </div>
            <div class="form-group">
                  <label>paciente_id</label>
                  <input type="number" v-model="form.paciente_id"></input>
                  <has-error :form="form" field="paciente_id"></has-error>
            </div>
            <div class="form-group">
                  <label>doctor_id</label>
                  <input type="number" v-model="form.doctor_id"></input>
                  <has-error :form="form" field="doctor_id"></has-error>
            </div>
            <div class="form-group">
                  <label>resumen</label>
                  <textarea v-model="form.resumen" ></textarea>
                  <has-error :form="form" field="resumen"></has-error>
            </div>
            <div class="form-group">
                  <label>diagnostico</label>
                  <textarea v-model="form.diagnostico" ></textarea>
                  <has-error :form="form" field="diagnostico"></has-error>
            </div>
            <div class="form-group">
                  <label>prescripcion</label>
                  <textarea v-model="form.prescripcion" ></textarea>
                  <has-error :form="form" field="prescripcion"></has-error>
            </div>
            <div class="form-group">
                  <label>pagada</label>
                  <input type="number" v-model="form.pagada"></input>
                  <has-error :form="form" field="pagada"></has-error>
            </div>
            <div class="form-group">
                  <label>terminada</label>
                  <input type="number" v-model="form.terminada"></input>
                  <has-error :form="form" field="terminada"></has-error>
            </div>
            <div class="form-group">
   
                  <input type="hidden" v-model="form.created_at"></input>
            </div>
            <div class="form-group">
   
                  <input type="hidden" v-model="form.updated_at"></input>
            </div>
        
            <div class="form-group">
                <button class="button" type="submit" :disabled="form.busy" name="button">{{ (form.busy) ? 'Please wait...' : 'Submit'}}</button>
            </div>
          </form>
          
        </div><!-- End first half -->
        
        <div class="half">
          
          <h1>List consultas</h1>
          
          <ul v-if="consultas.length > 0">
            <li v-for="(consulta,index) in consultas" :key="consulta.id">
              
            <router-link :to="'/consulta/'+consulta.id">
              
              consulta {{ index }}

              <button @click.prevent="deleteConsulta(consulta,index)" type="button" :disabled="form.busy" name="button">{{ (form.busy) ? 'Please wait...' : 'Delete'}}</button>
              
            </router-link>
              
            </li>
          </ul>
          
          <span v-else-if="!consultas">Loading...</span>
          <span v-else>No consultas exist</span>
          
        </div><!-- End 2nd half -->
        
      </div>
</template>

<script>
import { Form, HasError, AlertError } from 'vform'
export default {
  name: 'Consulta',
  components: {HasError},
  data: function(){
    return {
      consultas : false,
      form: new Form({
          "id" : "",
          "paciente_id" : "",
          "doctor_id" : "",
          "resumen" : "",
          "diagnostico" : "",
          "prescripcion" : "",
          "pagada" : "",
          "terminada" : "",
          "created_at" : "",
          "updated_at" : "",
      })
    }
  },
  created: function(){
    this.listConsultas();
  },
  methods: {
    listConsultas: function(){
      
      var that = this;
      this.form.get('/api/consultas').then(function(response){
        that.consultas = response.data;
      })
      
    },
    createConsulta: function(){
      
      var that = this;
      this.form.post('/api/consultas').then(function(response){
        that.consultas.push(response.data);
      })
      
    },
    deleteConsulta: function(consulta, index){
      
      var that = this;
      this.form.delete('/api/consultas/'+consulta.id).then(function(response){
        that.consultas.splice(index,1);
      })
      
    }
  }
}
</script>

<style lang="less">
.consultas{
    margin:0 auto;
    width:700px;
    display:flex;
    .half{
      flex:1;
      &:first-of-type{
        margin-right:20px;
      }
    }
    form{
      .form-group{
        margin-bottom:20px;
        label{
          display:block;
          margin-bottom:5px;
          text-transform: capitalize;
        }
        input[type="text"],input[type="number"],textarea{
          width:100%;
          max-width:100%;
          min-width:100%;
          padding:10px;
          border-radius:3px;
          border:1px solid silver;
          font-size:1rem;
          &:focus{
            outline:0;
            border-color:blue;
          }
        }
        .invalid-feedback{
          color:red;
          &::first-letter{
            text-transform:capitalize;
          }
        }
      }
      .button{
        appearance: none;
        background: #3bdfd9;
        font-size: 1rem;
        border: 0px;
        padding: 10px 20px;
        border-radius: 3px;
        font-weight: bold;
        &:hover{
          cursor:pointer;
          background: darken(#3bdfd9,10);
        }
      }
    }
}
</style>