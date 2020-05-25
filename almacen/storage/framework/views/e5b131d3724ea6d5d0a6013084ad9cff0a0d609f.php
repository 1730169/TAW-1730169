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
     <?php if (isset($component)) { $__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1 = $component; } ?>
<?php $component = $__env->getContainer()->make(Kejojedi\Crudify\Components\Input::class, ['name' => 'nombre','value' => old('nombre', $producto->nombre ?? '')]); ?>
<?php $component->withName('crudify-input'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes([]); ?>
<?php if (isset($__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1)): ?>
<?php $component = $__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1; ?>
<?php unset($__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?> 
     <?php if (isset($component)) { $__componentOriginalc9c6544c9b50d793975aaaa1f95d51e9fcb6000b = $component; } ?>
<?php $component = $__env->getContainer()->make(Kejojedi\Crudify\Components\Textarea::class, ['name' => 'descripcion','value' => old('descripcion', $producto->descripcion ?? '')]); ?>
<?php $component->withName('crudify-textarea'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes([]); ?>
<?php if (isset($__componentOriginalc9c6544c9b50d793975aaaa1f95d51e9fcb6000b)): ?>
<?php $component = $__componentOriginalc9c6544c9b50d793975aaaa1f95d51e9fcb6000b; ?>
<?php unset($__componentOriginalc9c6544c9b50d793975aaaa1f95d51e9fcb6000b); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?> 
     <?php if (isset($component)) { $__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1 = $component; } ?>
<?php $component = $__env->getContainer()->make(Kejojedi\Crudify\Components\Input::class, ['name' => 'precio_venta','type' => 'number','value' => old('precio_venta', $producto->precio_venta ?? '0.0')]); ?>
<?php $component->withName('crudify-input'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes([]); ?>
<?php if (isset($__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1)): ?>
<?php $component = $__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1; ?>
<?php unset($__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?> 
     <?php if (isset($component)) { $__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1 = $component; } ?>
<?php $component = $__env->getContainer()->make(Kejojedi\Crudify\Components\Input::class, ['name' => 'precio_compra','type' => 'number','value' => old('precio_compra', $producto->precio_compra ?? '0.0')]); ?>
<?php $component->withName('crudify-input'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes([]); ?>
<?php if (isset($__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1)): ?>
<?php $component = $__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1; ?>
<?php unset($__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?> 
     <?php if (isset($component)) { $__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1 = $component; } ?>
<?php $component = $__env->getContainer()->make(Kejojedi\Crudify\Components\Input::class, ['name' => 'color','value' => old('color', $producto->color ?? '')]); ?>
<?php $component->withName('crudify-input'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes([]); ?>
<?php if (isset($__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1)): ?>
<?php $component = $__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1; ?>
<?php unset($__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?> 

     <?php if (isset($component)) { $__componentOriginaleb6998f312072839c6e5eda02805f24947f1ea43 = $component; } ?>
<?php $component = $__env->getContainer()->make(Kejojedi\Crudify\Components\Select::class, ['name' => 'categoria_producto_id','options' => $opcionesC ?? [],'empty' => false,'label' => __('Categoria'),'value' => old('categoria_producto_id', $producto->categoria_producto_id ?? '')]); ?>
<?php $component->withName('crudify-select'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes([]); ?>
<?php if (isset($__componentOriginaleb6998f312072839c6e5eda02805f24947f1ea43)): ?>
<?php $component = $__componentOriginaleb6998f312072839c6e5eda02805f24947f1ea43; ?>
<?php unset($__componentOriginaleb6998f312072839c6e5eda02805f24947f1ea43); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?> 
     <?php if (isset($component)) { $__componentOriginaleb6998f312072839c6e5eda02805f24947f1ea43 = $component; } ?>
<?php $component = $__env->getContainer()->make(Kejojedi\Crudify\Components\Select::class, ['name' => 'fabricante_id','options' => $opcionesF ?? [],'empty' => false,'label' => __('Fabricante'),'value' => old('fabricante_id', $producto->fabricante_id ?? '')]); ?>
<?php $component->withName('crudify-select'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes([]); ?>
<?php if (isset($__componentOriginaleb6998f312072839c6e5eda02805f24947f1ea43)): ?>
<?php $component = $__componentOriginaleb6998f312072839c6e5eda02805f24947f1ea43; ?>
<?php unset($__componentOriginaleb6998f312072839c6e5eda02805f24947f1ea43); ?>
<?php endif; ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?> 


</div>
<?php /**PATH /home/jtrevino/UPV/1730169-TAW-42/almacen/resources/views/productos/fields.blade.php ENDPATH**/ ?>