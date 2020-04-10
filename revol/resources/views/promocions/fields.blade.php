<div class="list-group list-group-flush">
    <x-crudify-input name="monto_dulceria" type="number" :value="old('monto_dulceria', $promocion->monto_dulceria ?? '')" />
    <x-crudify-input name="monedas" type="number" :value="old('monedas', $promocion->monedas ?? '')" />
</div>
