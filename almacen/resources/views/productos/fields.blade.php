<?php
$opcionesC;
$opcionesF;

foreach ($categorias as $c) {
    $opcionesC[$c->nombre] = $c->id;
}

foreach ($fabricantes as $f) {
    $opcionesF[$f->nombre] = $f->id;
}

?>

<div class="list-group list-group-flush">
    <x-crudify-input name="nombre" :value="old('nombre', $producto->nombre ?? '')" />
    <x-crudify-textarea name="descripcion" :value="old('descripcion', $producto->descripcion ?? '')" />
    <x-crudify-input name="precio_venta" type="number" :value="old('precio_venta', $producto->precio_venta ?? '0.0')" />
    <x-crudify-input name="precio_compra" type="number" :value="old('precio_compra', $producto->precio_compra ?? '0.0')" />
    <x-crudify-input name="color" :value="old('color', $producto->color ?? '')" />

    <x-crudify-select name="categoria_producto_id" :options="$opcionesC ?? []" :empty="false" :label="__('Categoria')" :value="old('categoria_producto_id', $producto->categoria_producto_id ?? '')" />
    <x-crudify-select name="fabricante_id" :options="$opcionesF ?? []" :empty="false" :label="__('Fabricante')" :value="old('fabricante_id', $producto->fabricante_id ?? '')" />


</div>
