<div class="list-group list-group-flush">
    <x-crudify-input name="nombre" :value="old('nombre', $plataforma->nombre ?? '')" />
    <x-crudify-input name="costo" :value="old('costo', $plataforma->costo ?? '')" />
</div>