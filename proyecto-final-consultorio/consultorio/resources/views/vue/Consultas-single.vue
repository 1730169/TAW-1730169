<template lang="html">
      <div class="ConsultaSingle">
        <h1>Update Consulta</h1>
        
        <form @submit.prevent="updateConsulta" v-if="loaded">
          
          <router-link to="/consultas">< Back to consultas</router-link>
          
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
              <button class="button" type="submit" :disabled="form.busy" name="button">{{ (form.busy) ? 'Please wait...' : 'Update'}}</button>
              <button @click.prevent="deleteConsulta">{{ (form.busy) ? 'Please wait...' : 'Delete'}}</button>
          </div>
        </form>
        
        <span v-else>Loading consulta...</span>
      </div>
</template>

<script>
import { Form, HasError, AlertError } from 'vform'
export default {
  name: 'Consulta',
  components: {HasError},
  data: function(){
    return {
      loaded: false,
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
    this.getConsulta();
  },
  methods: {
    getConsulta: function(Consulta){
      
      var that = this;
      this.form.get('/api/consultas/'+this.$route.params.id).then(function(response){
        that.form.fill(response.data);
        that.loaded = true;
      }).catch(function(e){
          if (e.response && e.response.status == 404) {
              that.$router.push('/404');
          }
      });
      
    },
    updateConsulta: function(){
      
      var that = this;
      this.form.put('/api/consultas/'+this.$route.params.id).then(function(response){
        that.form.fill(response.data);
      })
      
    },
    deleteConsulta: function(){
      
      var that = this;
      this.form.delete('/api/consultas/'+this.$route.params.id).then(function(response){
        that.form.fill(response.data);
        that.$router.push('/consultas');
      })
      
    }
  }
}
</script>

<style lang="less">
.ConsultaSingle{
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