<template>
  <div>
      <h1>Productos</h1>
        <div class="row">
          <div class="col-md-10"></div>
          <div class="col-md-2">
            <router-link :to="{ name: 'crear' }" class="btn btn-primary">Registrar un Producto</router-link>
          </div>
        </div><br />

        <table class="table table-hover" style="background-color: white;">
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Precio Venta</th>
                <th>Opciones</th>
            </tr>
            </thead>
            <tbody>
                <tr v-for="producto in productos" :key="producto.id">
                    <td>{{ producto.id }}</td>
                    <td>{{ producto.nombre }}</td>
                    <td>{{ producto.precio_venta }}</td>
                    <td>
                      <router-link :to="{name: 'editar', params: { id: producto.id }}" class="btn btn-primary btn-sm">Editar</router-link>
                      <button class="btn btn-danger btn-sm" @click = "eliminarProducto(producto.id)">Eliminar</button>
                    </td>
                </tr>
            </tbody>
        </table>
  </div>
</template>
<!--
  DECLARACION DE LA LOGICA DEL COMPONENTE PARA SOLICITAR AL BACKEND TODO EL LISTADO DE PRODUCTOS
-->
<script>
  export default {
      data() {
        return {
          productos: []
        }
      },
      created() {
      let uri = '/api/productos';
      this.axios.get(uri).then(response => {
        this.productos = response.data.data;
      });
    },
    methods: {
      eliminarProducto(id)
      {
        let uri = `/api/producto/eliminar/${id}`;
        this.axios.delete(uri).then(response => {
          this.productos.splice(this.productos.indexOf(id), 1);
        });
      }
    }
  }
</script>
