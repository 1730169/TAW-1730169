<template>
  <CContainer class="d-flex content-center min-vh-100">
    <CRow>
      <CCol>
        <CCardGroup>
          <CCard class="p-4">
            <CCardBody>
              <CForm @submit.prevent="login" method="POST">
                <h1>Iniciar sesión</h1>
                <p class="text-muted">Inicia sesión en tu cuenta</p>
                <CInput
                  v-model="email"
                  prependHtml="<i class='cui-user'></i>"
                  placeholder="Email"
                  autocomplete="username email"
                >
                  <template #prepend-content><CIcon name="cil-user"/></template>
                </CInput>
                <CInput
                  v-model="password"
                  prependHtml="<i class='cui-lock-locked'></i>"
                  placeholder="Contraseña"
                  type="password"
                  autocomplete="curent-password"
                >
                  <template #prepend-content><CIcon name="cil-lock-locked"/></template>
                </CInput>
                <CRow>
                  <CCol col="6">
                    <CButton type="submit" color="primary" class="px-4">Iniciar Sesión</CButton>
                  </CCol>
                  <CCol col="6" class="text-right">
                    <CButton color="link" class="px-0">Olvidó su contraseña?</CButton>
                  </CCol>
                </CRow>
              </CForm>
            </CCardBody>
          </CCard>
          <!--<CCard
            color="primary"
            text-color="white"
            class="text-center py-5 d-md-down-none"
            body-wrapper
          >
            <h2>Registrarse</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            <CButton
              color="primary"
              class="active mt-3"
              @click="goRegister()"
            >
              Registrarse ahora!
            </CButton>
          </CCard> -->
        </CCardGroup>
      </CCol>
    </CRow>
  </CContainer>
</template>

<script>

import axios from "axios";

    export default {
      name: 'Login',
      data() {
        return {
          email: '',
          password: '',
          showMessage: false,
          message: '',
        }
      },
      methods: {
        goRegister(){
          this.$router.push({ path: 'register' });
        },
        login() {
          let self = this;
          axios.post(  '/api/login', {
            email: self.email,
            password: self.password,
          }).then(function (response) {
            self.email = '';
            self.password = '';
            localStorage.setItem("api_token", response.data.access_token);
            self.$router.push({ path: 'dashboard' });
          })
          .catch(function (error) {
            self.message = 'Datos de acceso incorrectos';
            self.showMessage = true;
            console.log(error);
          });
  
        }
      }
    }

</script>
