<div class="text-nowrap text-md-right">
    <a href="<?php echo e(route('productos.show', $producto->id)); ?>" class="btn <?php echo e(!request()->ajax() ? 'btn-primary' : 'btn-link text-secondary p-1'); ?>" title="<?php echo e(__('Show')); ?>">
        <i class="far fa-eye <?php echo e(!request()->ajax() ? 'fa-fw' : ''); ?>"></i>
    </a>

    <a href="<?php echo e(route('productos.edit', $producto->id)); ?>" class="btn <?php echo e(!request()->ajax() ? 'btn-primary' : 'btn-link text-secondary p-1'); ?>" title="<?php echo e(__('Edit')); ?>">
        <i class="far fa-edit <?php echo e(!request()->ajax() ? 'fa-fw' : ''); ?>"></i>
    </a>

    <a href="<?php echo e(route('productos.destroy', $producto->id)); ?>" class="btn <?php echo e(!request()->ajax() ? 'btn-primary' : 'btn-link text-secondary p-1'); ?>" title="<?php echo e(__('Delete')); ?>"
       onclick="event.preventDefault(); if (confirm('<?php echo e(__('Delete This Producto?')); ?>')) $('#delete_producto_<?php echo e($producto->id); ?>_form').submit();">
        <i class="far fa-trash-alt <?php echo e(!request()->ajax() ? 'fa-fw' : ''); ?>"></i>
    </a>

    <form method="post" action="<?php echo e(route('productos.destroy', $producto->id)); ?>" id="delete_producto_<?php echo e($producto->id); ?>_form" class="d-none">
        <?php echo csrf_field(); ?>
        <?php echo method_field('delete'); ?>
    </form>
</div>
<?php /**PATH /home/jtrevino/UPV/1730169-TAW-42/almacen/resources/views/productos/actions.blade.php ENDPATH**/ ?>