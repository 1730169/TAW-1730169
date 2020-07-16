<template lang="html">
      <div class="CitaSingle">
        <h1>Update Cita</h1>
        
        <form @submit.prevent="updateCita" v-if="loaded">
          
          <router-link to="/citas">< Back to citas</router-link>
          
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
              <button class="button" type="submit" :disabled="form.busy" name="button">{{ (form.busy) ? 'Please wait...' : 'Update'}}</button>
              <button @click.prevent="deleteCita">{{ (form.busy) ? 'Please wait...' : 'Delete'}}</button>
          </div>
        </form>
        
        <span v-else>Loading cita...</span>
      </div>
</template>

<script>
import { Form, HasError, AlertError } from 'vform'
export default {
  name: 'Cita',
  components: {HasError},
  data: function(){
    return {
      loaded: false,
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
    this.getCita();
  },
  methods: {
    getCita: function(Cita){
      
      var that = this;
      this.form.get('/api/citas/'+this.$route.params.id).then(function(response){
        that.form.fill(response.data);
        that.loaded = true;
      }).catch(function(e){
          if (e.response && e.response.status == 404) {
              that.$router.push('/404');
          }
      });
      
    },
    updateCita: function(){
      
      var that = this;
      this.form.put('/api/citas/'+this.$route.params.id).then(function(response){
        that.form.fill(response.data);
      })
      
    },
    deleteCita: function(){
      
      var that = this;
      this.form.delete('/api/citas/'+this.$route.params.id).then(function(response){
        that.form.fill(response.data);
        that.$router.push('/citas');
      })
      
    }
  }
}
</script>

<style lang="less">
.CitaSingle{
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