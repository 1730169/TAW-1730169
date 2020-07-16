<template lang="html">
      <div class="citas">
        
        <div class="half">
          
          <h1>Create cita</h1>
          
          <form @submit.prevent="createCita">
            
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
                  <label>fecha_cita</label>
                  <input type="number" v-model="form.fecha_cita"></input>
                  <has-error :form="form" field="fecha_cita"></has-error>
            </div>
            <div class="form-group">
                  <label>motivo</label>
                  <input type="text" v-model="form.motivo"  maxlength="255" ></input>
                  <has-error :form="form" field="motivo"></has-error>
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
          
          <h1>List citas</h1>
          
          <ul v-if="citas.length > 0">
            <li v-for="(cita,index) in citas" :key="cita.id">
              
            <router-link :to="'/cita/'+cita.id">
              
              cita {{ index }}

              <button @click.prevent="deleteCita(cita,index)" type="button" :disabled="form.busy" name="button">{{ (form.busy) ? 'Please wait...' : 'Delete'}}</button>
              
            </router-link>
              
            </li>
          </ul>
          
          <span v-else-if="!citas">Loading...</span>
          <span v-else>No citas exist</span>
          
        </div><!-- End 2nd half -->
        
      </div>
</template>

<script>
import { Form, HasError, AlertError } from 'vform'
export default {
  name: 'Cita',
  components: {HasError},
  data: function(){
    return {
      citas : false,
      form: new Form({
          "id" : "",
          "paciente_id" : "",
          "doctor_id" : "",
          "fecha_cita" : "",
          "motivo" : "",
          "created_at" : "",
          "updated_at" : "",
      })
    }
  },
  created: function(){
    this.listCitas();
  },
  methods: {
    listCitas: function(){
      
      var that = this;
      this.form.get('/api/citas').then(function(response){
        that.citas = response.data;
      })
      
    },
    createCita: function(){
      
      var that = this;
      this.form.post('/api/citas').then(function(response){
        that.citas.push(response.data);
      })
      
    },
    deleteCita: function(cita, index){
      
      var that = this;
      this.form.delete('/api/citas/'+cita.id).then(function(response){
        that.citas.splice(index,1);
      })
      
    }
  }
}
</script>

<style lang="less">
.citas{
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