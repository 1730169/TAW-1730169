<!--
  - ESTE BLOQUE TEMPLATE CONTIENE LA PLANTILLA PRINCIPAL DE LA APLICACION
  - TIENE UN COMPORTAMIENTO SIMILAR A EL LAYOUT.BLADE
-->
<template>
  <div class="container">

    <!-- ESTE ES UN MENU PRINCIPAL PARA LA APLICACION -->
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
      <ul class="navbar-nav">
        <li class="nav-item">
          <router-link to="/" class="nav-link">Inicio</router-link>
        </li>
        <li class="nav-item">
          <router-link to="/crear" class="nav-link">Registrar un Producto</router-link>
        </li>
        <li class="nav-item">
          <router-link to="/productos" class="nav-link">Productos</router-link>
        </li>
      </ul>
    </nav><br />
    
    <!-- 
      -EL COMPONENTE TRANSITION REALIZA UN ANIMACION CON LAS ETIQUETAS QUE ESTEN DENTRO DE EL
    -->
    <transition name="">
      <!-- EL COMPONENTE ROUTER-VIEW CARGA LOS COMPONENTES QUE FUERON ENRUTADOS Y CONFIGURADOS EN APP.JS -->
      <router-view></router-view>
    </transition>
  </div>
</template>


<script>

    export default{
    }
</script>