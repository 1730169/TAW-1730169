<template>
  <CContainer class="d-flex align-items-center min-vh-100">
    <CRow class="w-100 justify-content-center">
      <CCol md="6">
        <div class="w-100">
        <div class="clearfix">
          <h1 class="float-left display-3 mr-4">404</h1>
          <h4 class="pt-3">No se ha encontrado.</h4>
          <p class="text-muted">No se encuentra la página que solicitaste.</p>
        </div>
        <CInput
          class="mb-3"
          placeholder="Qué estás buscando?"
        >
          <template #prepend-content><CIcon name="cil-magnifying-glass"/></template>
          <template #append>
            <CButton color="info">Búscar</CButton>
          </template>
        </CInput>
      </div>
      </CCol>
    </CRow>
  </CContainer>
</template>

<script>
export default {
  name: 'Page404'
}
</script>
