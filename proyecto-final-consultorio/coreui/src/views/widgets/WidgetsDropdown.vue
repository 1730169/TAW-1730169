<template>
  <CRow>
    <CCol sm="6" lg="3">
      <!--<CWidgetDropdown
        color="danger"
        header="9.823"
        text="Caja"
        v-model="widgets.caja_num"
      >
        <template #default>
          <CDropdown
            color="transparent p-0"
            placement="bottom-end"
          >
            <template #toggler-content>
             <CIcon name="cil-settings"/>
            </template>
            <CDropdownItem>Action</CDropdownItem>
            <CDropdownItem>Another action</CDropdownItem>
            <CDropdownItem>Something else here...</CDropdownItem>
            <CDropdownItem disabled>Disabled action</CDropdownItem>
          </CDropdown>
        </template>
        <template #footer>
          <CChartBarSimple
            class="mt-3 mx-3"
            style="height:70px"
            background-color="rgb(250, 152, 152)"
            label="Members"
            labels="months"
          />
        </template>
      </CWidgetDropdown>-->

      <div class="card bg-danger text-white">
        <div class="card-body pb-5 d-flex justify-content-between">
          <div>
            <div class="text-value-lg" id="lbl_caja">0.0</div>
            <div>Caja actual</div>
          </div>
        </div>
      </div>


    </CCol>

    <CCol sm="6" lg="3">

      <div class="card bg-primary text-white">
        <div class="card-body pb-5 d-flex justify-content-between">
          <div>
            <div class="text-value-lg" id="lbl_citas">0</div>
            <div>Citas registradas</div>
          </div>
        </div>
      </div>

      <!--<CWidgetDropdown color="primary" header="9.823" text="Citas" v-model="widgets.citas_num">
        <template #default>
          <CDropdown
            color="transparent p-0"
            placement="bottom-end"
          >
            <template #toggler-content>
              <CIcon name="cil-settings"/>
            </template>
            <CDropdownItem>Action</CDropdownItem>
            <CDropdownItem>Another action</CDropdownItem>
            <CDropdownItem>Something else here...</CDropdownItem>
            <CDropdownItem disabled>Disabled action</CDropdownItem>
          </CDropdown>
        </template>
        <template #footer>
          <CChartLineSimple
            pointed
            class="mt-3 mx-3"
            style="height:70px"
            :data-points="[65, 59, 84, 84, 51, 55, 40]"
            point-hover-background-color="primary"
            label="Members"
            labels="months"
          />
        </template>
      </CWidgetDropdown>-->
    </CCol>
    <CCol sm="6" lg="3">

      <!--<CWidgetDropdown color="info" header="9.823" text="Consultas" v-model="widgets.pacientes_num">
        <template #default>
          <CDropdown
            color="transparent p-0"
            placement="bottom-end"
            :caret="false"
          >
            <template #toggler-content>
              <CIcon name="cil-location-pin"/>
            </template>
            <CDropdownItem>Action</CDropdownItem>
            <CDropdownItem>Another action</CDropdownItem>
            <CDropdownItem>Something else here...</CDropdownItem>
            <CDropdownItem disabled>Disabled action</CDropdownItem>
          </CDropdown>
        </template>
        <template #footer>
          <CChartLineSimple
            pointed
            class="mt-3 mx-3"
            style="height:70px"
            :data-points="[1, 18, 9, 17, 34, 22, 11]"
            point-hover-background-color="info"
            :options="{ elements: { line: { tension: 0.00001 }}}"
            label="Members"
            labels="months"
          />
        </template>
      </CWidgetDropdown>-->

      <div class="card bg-success text-white">
        <div class="card-body pb-5 d-flex justify-content-between">
          <div>
            <div class="text-value-lg" id="lbl_consultas">0</div>
            <div>Consultas registradas</div>
          </div>
        </div>
      </div>

    </CCol>
    <CCol sm="6" lg="3">
      <!--
      <CWidgetDropdown
        color="warning"
        header="9.823"
        text="Médicos registrados"
        v-model="widgets.doctores_num"
      >
        <template #default>
          <CDropdown
            color="transparent p-0"
            placement="bottom-end"
          >
            <template #toggler-content>
              <CIcon name="cil-settings"/>
            </template>
            <CDropdownItem>Action</CDropdownItem>
            <CDropdownItem>Another action</CDropdownItem>
            <CDropdownItem>Something else here...</CDropdownItem>
            <CDropdownItem disabled>Disabled action</CDropdownItem>
          </CDropdown>
        </template>
        <template #footer>
          <CChartLineSimple
            class="mt-3"
            style="height:70px"
            background-color="rgba(255,255,255,.2)"
            :data-points="[78, 81, 80, 45, 34, 12, 40]"
            :options="{ elements: { line: { borderWidth: 2.5 }}}"
            point-hover-background-color="warning"
            label="Members"
            labels="months"
          />
        </template>
      </CWidgetDropdown>
      -->

      <div class="card bg-warning text-white">
        <div class="card-body pb-5 d-flex justify-content-between">
          <div>
            <div class="text-value-lg" id="lbl_doctores">0</div>
            <div>Doctores registrados</div>
          </div>
        </div>
      </div>

    </CCol>
    
  </CRow>
</template>

<script>
import { CChartLineSimple, CChartBarSimple } from '../charts/index.js'
import axios from 'axios'

export default {
  name: 'WidgetsDropdown',
  components: { CChartLineSimple, CChartBarSimple },
  data: () => {
    return {
        widgets: {
          caja_num: '',
          citas_num: '',
          doctores_num: '',
          pacientes_num: ''
          
        }
    }
  },
  computed: {
  },
  methods: {
    // FUNCION PARA OBETENER EL DINERO ACTUAL EN LA CAJA
    getCaja (){
      let self = this;
      axios.get(  '/api/montocaja' )
      .then(function (response) {
        //console.dir(response);
        
        document.getElementById("lbl_caja").innerText = "$"+formatMoney(response.data);
      }).catch(function (error) {
        console.log(error);
        //self.$router.push({ path: '/login' });
      });
    },

    getCitas (){
      let self = this;
      axios.get(  '/api/citas?token=' + localStorage.getItem("api_token") )
      .then(function (response) {
        document.getElementById("lbl_citas").innerText = response.data.length;
      }).catch(function (error) {
        console.log(error);
      });
    },

    getConsultas (){
      let self = this;
      axios.get(  '/api/consultas?token=' + localStorage.getItem("api_token"))
      .then(function (response) {
        document.getElementById("lbl_consultas").innerText = response.data.length;
      }).catch(function (error) {
        console.log(error);
      });
    },

    getDoctores (){
      let self = this;
      axios.get(  '/api/doctores' )
      .then(function (response) {
        document.getElementById("lbl_doctores").innerText = response.data.length;
      }).catch(function (error) {
        console.log(error);
      });
    }

    
  },
  mounted: function(){
    this.getCaja();
    this.getCitas();
    this.getDoctores();
    this.getConsultas();
  }
}

function formatMoney(number) {
    var decPlaces = 2;
    var decSep = ".";
    var thouSep = ",";

    decPlaces = isNaN(decPlaces = Math.abs(decPlaces)) ? 2 : decPlaces,
    decSep = typeof decSep === "undefined" ? "." : decSep;
    thouSep = typeof thouSep === "undefined" ? "," : thouSep;
    var sign = number < 0 ? "-" : "";
    var i = String(parseInt(number = Math.abs(Number(number) || 0).toFixed(decPlaces)));
    var j = (j = i.length) > 3 ? j % 3 : 0;
    
    return sign +
        (j ? i.substr(0, j) + thouSep : "") +
        i.substr(j).replace(/(\decSep{3})(?=\decSep)/g, "$1" + thouSep) +
        (decPlaces ? decSep + Math.abs(number - i).toFixed(decPlaces).slice(2) : "");
}


</script>
