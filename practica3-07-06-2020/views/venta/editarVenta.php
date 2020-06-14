<?php

	session_start();

	if(!$_SESSION["validar"]){
		header("location:index.php?action=ingresar");
		exit();
	}
	
?>

<h1>Ver Venta</h1>

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
              

              <!-- LLENAR EL CAMPO JSON DE LA ORDEN PARA DESPLEGAR LOS PRODUCTOS -->
              <?php
					$editarVenta = new VentaController();
					$editarVenta -> editarVentaController();
					
			    ?>
              
            </div>
        </div>
    </div>
    <div class="col-md-6">
        &nbsp;
    </div>
</div>


