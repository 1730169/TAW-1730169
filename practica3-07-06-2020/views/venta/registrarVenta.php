<?php
session_start();

if(!$_SESSION["validar"]){
  header("location:index.php?action=ingresar");
  exit();
}


    $registro = new VentaController();
    
    $registro -> registroVentaController();

?>

<h1>Venta</h1>

<div class="row">
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
                <h5 class="title">Orden de compra</h5>
            </div>
            
            <div class="card-body">
              <table class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Artículo</th>
                  <th>Precio Unit</th>
                  <th>Cantidad</th>
                  <th>Subtotal</th>
                </tr>
                </thead>
                <tbody id="contenido_tabla_orden">
                
                </tbody>
              </table>
            </div>
            
            <div class="card-footer">
              <table class="table" id="cart-details">
                <tfoot class="hidden-xs hidden-sm hidden-md">
                <tr class="active">
                <td width="200" class="text-left"><b>Cantidad de productos ( <span id="cant-productos">0</span> )</td>
                <td width="150" class="text-right hidden-xs"></td>
                <td width="150" class="text-right">SUBTOTAL</td>
                <td width="90" class="text-right"><span id="subtotal">$ 0.00</span></td>
                </tr>
                <tr class="active">
                <td></td>
                <td></td>
                <td class="text-right cart-discount-notice-area">DESCUENTO</td>
                <td class="text-right cart-discount-remove-wrapper"><span class="cart-discount pull-right" id="descuento">$ 0.00</span></td>
                </tr>
                
                <tr class="alert-primary">
                <td></td>
                <td></td>
                <td class="text-right">
                <strong>
                TOTAL A PAGAR </strong></td>
                <td class="text-right"><span class="cart-topay pull-right" id="total" style="text-weight:bold; font-size:22px;">$ 0.00</span></td>
                </tr>
                </tfoot>
              </table>
              <div class="row">
                <div class="col-md-6">&nbsp;</div>
                <div class="col-md-2">DESCUENTO</div>
                <div class="col-md-4">
                <div class="input-group mb-3">
                  <input type="number" id="input-descuento" value="0" min="0" class="form-control" placeholder="Descuento" aria-describedby="basic-addon2">
                  <div class="input-group-append">
                    <span class="input-group-text" id="basic-addon2">%</span>
                  </div>                  
                </div>
                </div>
              </div>

              <!-- FORMULARIO QUE CONCENTRA LOS DATOS GENERALES DE LA ORDEN -->
              <form method="post">
                <input type="hidden" name="orden_json" id="orden_json" />
                <input type="hidden" name="subtotal_form" id="subtotal_form" />
                <input type="hidden" name="descuento_form" id="descuento_form" />
                <input type="hidden" name="total_form" id="total_form" />
                
                <div class="float-right">

                  <a href="#" class="btn btn-fill btn-secondary btn-lg" onclick="aplicar_descuento();">Aplicar Descuento</a>
                  <button type="submit" class="btn btn-fill btn-primary btn-lg">Vender</button>
                </div>
              </form>
              
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
              <h3 class="card-title">Productos</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="dataTable" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Añadir?</th>
                  <th>Código</th>
                  <th>Nombre</th>
                  <th>Precio</th>
                  <th>Categoría</th>
                </tr>
                </thead>
                <tbody>
                  <?php
                    $vistaProducto = new ProductoController();
                    $vistaProducto -> listaProductosVenta();
                  ?>
                
                </tbody>
                <!--
                <tfoot>
                <tr>
                  <th>Rendering engine</th>
                  <th>Browser</th>
                  <th>Platform(s)</th>
                  <th>Engine version</th>
                  <th>CSS grade</th>
                </tr>
                </tfoot>
                -->
              </table>
            </div>
            <!-- /.card-body -->
        </div>
    </div>
</div>


