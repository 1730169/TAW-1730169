<style>
.sep{
    margin-left:2%;
    padding:10px;
}
</style>
<div class="list-group list-group-flush">
    <div class="sep">
        <h3>Dulcería</h3>
    </div>
    
    <!--<hr>-->
    <x-crudify-input name="monto_dulceria" type="number" :value="old('monto_dulceria', $promocion->monto_dulceria ?? 0)" />
    <x-crudify-input name="monedas_dulceria" type="number" :value="old('monedas_dulceria', $promocion->monedas_dulceria ?? 0)" />
    
    <div class="sep">
        <h3>Invitaciones</h3>
    </div>
    <x-crudify-input name="cantidad_invitacion" type="number" :value="old('cantidad_invitacion', $promocion->cantidad_invitacion ?? 0)" />
    <x-crudify-input name="monedas_invitacion" type="number" :value="old('monedas_invitacion', $promocion->monedas_invitacion ?? 0)" />
</div>
