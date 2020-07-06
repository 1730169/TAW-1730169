require('./bootstrap');

window.Vue = require('vue');

import VueRouter from 'vue-router';
Vue.use(VueRouter);

import VueAxios from 'vue-axios';
import axios from 'axios';

import App from './App.vue';
Vue.use(VueAxios, axios);

// IMPORTAR LOS COMPONENTES QUE SE ENCUENTRAN DETRO DE LA CARPETA COMPONENTS
import HomeComponent from './components/HomeComponent.vue';
import CrearProductoComponent from './components/CrearProductoComponent.vue';
import ListadoProductosComponent from './components/ListadoProductosComponent.vue';
import EditarProductoComponent from './components/EditarProductoComponent.vue';

/* 
    - DECLARAR LAS RUTAS PARA EL ENRUTAMIENTO PARA LA APLICACION VUE.
    - LAS RUTAS SE COMPONEN DE UN NOMBRE, UNA RUTA, Y LA REFERENCIA AL COMPONENTE
*/
const routes = [
  {
      name: 'home',
      path: '/',
      component: HomeComponent
  },
  {
      name: 'crear',
      path: '/crear',
      component: CrearProductoComponent
  },
  {
      name: 'productos',
      path: '/productos',
      component: ListadoProductosComponent
  },
  {
      name: 'editar',
      path: '/editar/:id',
      component: EditarProductoComponent
  }
];

// DECLARACION DEL MODULO ROUTER CON LAS RUTAS DECLARADAS
const router = new VueRouter({ mode: 'history', routes: routes});

// ESTA VARIABLE MONTA LA APLICACION Y HACE REFERENIA AL CONTENEDOR "APP"
const app = new Vue(Vue.util.extend({ router }, App)).$mount('#app');