<div class="list-group list-group-flush">
     <?php if (isset($component)) { $__componentOriginal5f4e246340dad6046d5426cc38f75df845d700d1 = $component; } ?>
<?php $component = $__env->getContainer()->make(Kejojedi\Crudify\Components\Input::class, ['name' => 'nombre','value' => old('nombre', $categoria_producto->nombre ?? '')]); ?>
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
</div>
<?php /**PATH /home/jtrevino/UPV/1730169-TAW-42/almacen/resources/views/categoria_productos/fields.blade.php ENDPATH**/ ?>