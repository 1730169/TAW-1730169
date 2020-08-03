<template lang="html">
      <div class="ServicioconsultaSingle">
        <h1>Update Servicioconsulta</h1>
        
        <form @submit.prevent="updateServicioconsulta" v-if="loaded">
          
          <router-link to="/servicioconsultas">< Back to servicioconsultas</router-link>
          
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
              <button class="button" type="submit" :disabled="form.busy" name="button">{{ (form.busy) ? 'Please wait...' : 'Update'}}</button>
              <button @click.prevent="deleteServicioconsulta">{{ (form.busy) ? 'Please wait...' : 'Delete'}}</button>
          </div>
        </form>
        
        <span v-else>Loading servicioconsulta...</span>
      </div>
</template>

<script>
import { Form, HasError, AlertError } from 'vform'
export default {
  name: 'Servicioconsulta',
  components: {HasError},
  data: function(){
    return {
      loaded: false,
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
    this.getServicioconsulta();
  },
  methods: {
    getServicioconsulta: function(Servicioconsulta){
      
      var that = this;
      this.form.get('/api/servicioconsultas/'+this.$route.params.id).then(function(response){
        that.form.fill(response.data);
        that.loaded = true;
      }).catch(function(e){
          if (e.response && e.response.status == 404) {
              that.$router.push('/404');
          }
      });
      
    },
    updateServicioconsulta: function(){
      
      var that = this;
      this.form.put('/api/servicioconsultas/'+this.$route.params.id).then(function(response){
        that.form.fill(response.data);
      })
      
    },
    deleteServicioconsulta: function(){
      
      var that = this;
      this.form.delete('/api/servicioconsultas/'+this.$route.params.id).then(function(response){
        that.form.fill(response.data);
        that.$router.push('/servicioconsultas');
      })
      
    }
  }
}
</script>

<style lang="less">
.ServicioconsultaSingle{
  margin:0 auto;
  width:700px;
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
      .invalid-feedback{
        color:red;
        &::first-letter{
          text-transform:capitalize;
        }
      }
    }
  }
}
</style>