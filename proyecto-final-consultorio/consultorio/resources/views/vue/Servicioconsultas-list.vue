<template lang="html">
      <div class="servicioconsultas">
        
        <div class="half">
          
          <h1>Create servicioconsulta</h1>
          
          <form @submit.prevent="createServicioconsulta">
            
            <div class="form-group">
   
                  <input type="hidden" v-model="form.id"></input>
            </div>
            <div class="form-group">
                  <label>consulta_id</label>
                  <input type="number" v-model="form.consulta_id"></input>
                  <has-error :form="form" field="consulta_id"></has-error>
            </div>
            <div class="form-group">
                  <label>servicio_id</label>
                  <input type="number" v-model="form.servicio_id"></input>
                  <has-error :form="form" field="servicio_id"></has-error>
            </div>
            <div class="form-group">
                  <label>cantidad</label>
                  <input type="number" v-model="form.cantidad"></input>
                  <has-error :form="form" field="cantidad"></has-error>
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
          
          <h1>List servicioconsultas</h1>
          
          <ul v-if="servicioconsultas.length > 0">
            <li v-for="(servicioconsulta,index) in servicioconsultas" :key="servicioconsulta.id">
              
            <router-link :to="'/servicioconsulta/'+servicioconsulta.id">
              
              servicioconsulta {{ index }}

              <button @click.prevent="deleteServicioconsulta(servicioconsulta,index)" type="button" :disabled="form.busy" name="button">{{ (form.busy) ? 'Please wait...' : 'Delete'}}</button>
              
            </router-link>
              
            </li>
          </ul>
          
          <span v-else-if="!servicioconsultas">Loading...</span>
          <span v-else>No servicioconsultas exist</span>
          
        </div><!-- End 2nd half -->
        
      </div>
</template>

<script>
import { Form, HasError, AlertError } from 'vform'
export default {
  name: 'Servicioconsulta',
  components: {HasError},
  data: function(){
    return {
      servicioconsultas : false,
      form: new Form({
          "id" : "",
          "consulta_id" : "",
          "servicio_id" : "",
          "cantidad" : "",
          "created_at" : "",
          "updated_at" : "",
      })
    }
  },
  created: function(){
    this.listServicioconsultas();
  },
  methods: {
    listServicioconsultas: function(){
      
      var that = this;
      this.form.get('/api/servicioconsultas').then(function(response){
        that.servicioconsultas = response.data;
      })
      
    },
    createServicioconsulta: function(){
      
      var that = this;
      this.form.post('/api/servicioconsultas').then(function(response){
        that.servicioconsultas.push(response.data);
      })
      
    },
    deleteServicioconsulta: function(servicioconsulta, index){
      
      var that = this;
      this.form.delete('/api/servicioconsultas/'+servicioconsulta.id).then(function(response){
        that.servicioconsultas.splice(index,1);
      })
      
    }
  }
}
</script>

<style lang="less">
.servicioconsultas{
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