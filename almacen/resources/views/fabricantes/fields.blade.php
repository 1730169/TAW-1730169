<?php
$opciones;

foreach ($categorias as $c) {
    $opciones[$c->nombre] = $c->id;
}

?>

<div class="list-group list-group-flush">
    <x-crudify-input name="nombre" :value="old('nombre', $fabricante->nombre ?? '')" />
    <x-crudify-textarea name="direccion" :value="old('direccion', $fabricante->direccion ?? '')" />
    <x-crudify-input name="correo" :value="old('correo', $fabricante->correo ?? '')" />
    <x-crudify-input name="telefono" :value="old('telefono', $fabricante->telefono ?? '')" />

    <x-crudify-select name="categoria_fabricante_id" :options="$opciones ?? []" :empty="false" :label="__('Categoria')" :value="old('categoria_fabricante_id', $fabricante->categoria_fabricante_id ?? '')" />

</div>
