<div class="list-group list-group-flush">
    <x-crudify-input name="numero" :value="old('numero', $consola->numero ?? '')" />
    <x-crudify-select name="plataforma" :options="['Xbox' => 0,'Nintendo Switch' => 1,'Playstation' => 2,'PC' => 3 ]" :empty="false" :label="__('Plataforma')" :value="old('plataforma', $consola->plataforma ?? '')" />
    <x-crudify-input name="serial" :value="old('serial', $consola->serial ?? '')" />
</div>
