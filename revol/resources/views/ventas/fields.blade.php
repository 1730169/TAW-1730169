<?php 
$opcionG;
$opcionA;

foreach ($articulos as $a) {
	$opcionA[$a->nombre_articulo . ' $' . $a->costo] = $a->id;
}

foreach ($gamers as $g) {
	$opcionG[$g->gamertag] = $g->id;
}
?>

<div class="list-group list-group-flush">
    <x-crudify-select name="gamer_id" id="gamer_id" :options="$opcionG ?? []" :empty="false" :label="__('Gamer')" :value="old('gamer_id', $ventas->gamer_id ?? '')" />
    <x-crudify-select name="nombre_articulo" id="nombre_articulo" :options="$opcionA ?? []" :empty="false" :label="__('Articulo')" :value="old('nombre_articulo', $ventas->nombre_articulo ?? '')" />
    <x-crudify-input name="cantidad" id="cantidad" type="number" :value="old('cantidad', $venta->cantidad ?? '1')"/>
    <x-crudify-input name="monto_total" id="monto_total" type="number" :value="old('monto_total', $venta->monto_total ?? '')" disabled/>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	function actualizarCosto() {
		var costo = $("#consola_id").val();
		var monto_total = $('#monto_total').val();
	}

</script>
