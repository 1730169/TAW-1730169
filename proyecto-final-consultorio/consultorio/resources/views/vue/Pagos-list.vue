<template lang="html">
      <div class="pagos">
        
        <div class="half">
          
          <h1>Create pago</h1>
          
          <form @submit.prevent="createPago">
            
            <div class="form-group">
   
                  <input type="hidden" v-model="form.id"></input>
            </div>
            <div class="form-group">
                  <label>consulta_id</label>
                  <input type="number" v-model="form.consulta_id"></input>
                  <has-error :form="form" field="consulta_id"></has-error>
            </div>
            <div class="form-group">
                  <label>monto</label>
                  <input type="number" v-model="form.monto"></input>
                  <has-error :form="form" field="monto"></has-error>
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
          
          <h1>List pagos</h1>
          
          <ul v-if="pagos.length > 0">
            <li v-for="(pago,index) in pagos" :key="pago.id">
              
            <router-link :to="'/pago/'+pago.id">
              
              pago {{ index }}

              <button @click.prevent="deletePago(pago,index)" type="button" :disabled="form.busy" name="button">{{ (form.busy) ? 'Please wait...' : 'Delete'}}</button>
              
            </router-link>
              
            </li>
          </ul>
          
          <span v-else-if="!pagos">Loading...</span>
          <span v-else>No pagos exist</span>
          
        </div><!-- End 2nd half -->
        
      </div>
</template>

<script>
import { Form, HasError, AlertError } from 'vform'
export default {
  name: 'Pago',
  components: {HasError},
  data: function(){
    return {
      pagos : false,
      form: new Form({
          "id" : "",
          "consulta_id" : "",
          "monto" : "",
          "created_at" : "",
          "updated_at" : "",
      })
    }
  },
  created: function(){
    this.listPagos();
  },
  methods: {
    listPagos: function(){
      
      var that = this;
      this.form.get('/api/pagos').then(function(response){
        that.pagos = response.data;
      })
      
    },
    createPago: function(){
      
      var that = this;
      this.form.post('/api/pagos').then(function(response){
        that.pagos.push(response.data);
      })
      
    },
    deletePago: function(pago, index){
      
      var that = this;
      this.form.delete('/api/pagos/'+pago.id).then(function(response){
        that.pagos.splice(index,1);
      })
      
    }
  }
}
</script>

<style lang="less">
.pagos{
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