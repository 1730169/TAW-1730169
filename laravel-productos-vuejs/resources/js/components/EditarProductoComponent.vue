<!--
  DECLARACION DEL COMPONENTE PARA EDITAR UN PRODUCTO
-->

<template>
  <div>
    <h1>Editar Producto</h1>

    <div class="card">
      <h5 class="card-header">Producto</h5>
      <div class="card-body">
        
        <!--
          DECLARACION DEL FORMULARIO CON LOS CAMPOS PARA REGISTRAR
        -->
        <form @submit.prevent="actualizarProducto">
          <div class="row">
            <!-- COLUMNA IZQUIERDA -->
            <div class="col-md-6">
              <div class="form-group">
                <label>Nombre:</label>
                <input type="text" class="form-control" v-model="producto.nombre">
              </div>
          
          
              <div class="form-group">
                <label>Descipción:</label>
                <textarea class="form-control" v-model="producto.descripcion" rows="5"></textarea>
              </div>

            </div>

            <!-- COLUMNA DERECHA -->
            <div class="col-md-6">
              <div class="form-group">
                <label>Cantidad:</label>
                <input type="number" min="0" class="form-control" v-model="producto.cantidad">
              </div>
            
              <div class="form-group">
                <label>Precio Venta:</label>
                <input type="number" class="form-control" v-model="producto.precio_venta">
              </div>
            
              <div class="form-group">
                <label>Precio Compra:</label>
                <input type="number" class="form-control" v-model="producto.precio_compra">
              </div>
            </div>
              
            <br />

            <div class="form-group">
              <button class="btn btn-primary">Actualizar</button>
            </div>
            
          </div>
        </form>
      
      </div>
    </div>
    
  </div>
</template>
<!--
  DECLARACION DE LA LOGICA DEL COMPONENTE PARA TOMAR EL OBJETO DE PRODUCTO Y ENVIARLO AL BACKEND
-->
<script>
    export default {

      data() {
        return {
          producto: {}
        }
      },
      created() {
        let uri = `/api/producto/editar/${this.$route.params.id}`;
        this.axios.get(uri).then((response) => {
            this.producto = response.data;
        });
      },
      methods: {
        actualizarProducto() {
          let uri = `/api/producto/actualizar/${this.$route.params.id}`;
          this.axios.post(uri, this.producto).then((response) => {
            this.$router.push({name: 'productos'});
          });
        }
      }
    }

    //http://localhost:8000
</script>

