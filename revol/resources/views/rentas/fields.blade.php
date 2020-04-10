<?php
$gamers;
$consolas;

foreach ($gamersQuery as $p) {
    $gamers[$p->nombre.' '.$p->apellidos.' ('.$p->gamertag.')'] = $p->id;
}

foreach ($consolasQuery as $c) {
    $consolas[$c->numero.' - '.$c->plataforma] = $c->id;
}

?>
<div class="list-group list-group-flush">
    <x-crudify-select name="gamer_id" id="gamer_id" :options="$gamers ?? []" :empty="false" :label="__('Gamer')" :value="old('gamer_id', $renta->gamer_id ?? '')" />
    <x-crudify-select name="consola_id" id="consola_id" :options="$consolas ?? []" :empty="false" :label="__('Consola')" :value="old('consola_id', $renta->consola_id ?? '')" />
    <x-crudify-input name="nhoras" id="nhoras" type="number" :value="old('nhoras', $renta->nhoras ?? '1')" />

    <x-crudify-input name="subtotal" id="subtotal" readonly="readonly" type="number" :value="old('subtotal', $renta->subtotal ?? '')" />
    <x-crudify-input name="iva" id="iva" readonly="readonly" type="number" :value="old('iva', $renta->iva ?? '')" />
    <x-crudify-input name="total" id="total" readonly="readonly" type="number" :value="old('total', $renta->total ?? '')" />

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>

function getTotal(){
    var consola_id = $("#consola_id").val();
    var nhoras = $("#nhoras").val();

    $.ajax({
        method: "POST",
        url: "/getTotalRenta",
        data: {
            "_token": "{{ csrf_token() }}",
            "nhoras": nhoras,
            "consola_id": consola_id
        },
    }).done(function( respuesta ) {
        if(respuesta){
            $("#subtotal").val(respuesta.subtotal);
            $("#iva").val(respuesta.iva);
            $("#total").val(respuesta.total);
        }
    });
}

$("#nhoras").on('change paste keyup', function() {
  getTotal();
});

getTotal();
</script>