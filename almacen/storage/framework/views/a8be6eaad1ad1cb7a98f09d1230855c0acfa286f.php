<div class="text-nowrap text-md-right">
    <a href="<?php echo e(route('categoria_fabricantes.show', $categoria_fabricante->id)); ?>" class="btn <?php echo e(!request()->ajax() ? 'btn-primary' : 'btn-link text-secondary p-1'); ?>" title="<?php echo e(__('Show')); ?>">
        <i class="far fa-eye <?php echo e(!request()->ajax() ? 'fa-fw' : ''); ?>"></i>
    </a>

    <a href="<?php echo e(route('categoria_fabricantes.edit', $categoria_fabricante->id)); ?>" class="btn <?php echo e(!request()->ajax() ? 'btn-primary' : 'btn-link text-secondary p-1'); ?>" title="<?php echo e(__('Edit')); ?>">
        <i class="far fa-edit <?php echo e(!request()->ajax() ? 'fa-fw' : ''); ?>"></i>
    </a>

    <a href="<?php echo e(route('categoria_fabricantes.destroy', $categoria_fabricante->id)); ?>" class="btn <?php echo e(!request()->ajax() ? 'btn-primary' : 'btn-link text-secondary p-1'); ?>" title="<?php echo e(__('Delete')); ?>"
       onclick="event.preventDefault(); if (confirm('<?php echo e(__('Delete This Categoria Fabricante?')); ?>')) $('#delete_categoria_fabricante_<?php echo e($categoria_fabricante->id); ?>_form').submit();">
        <i class="far fa-trash-alt <?php echo e(!request()->ajax() ? 'fa-fw' : ''); ?>"></i>
    </a>

    <form method="post" action="<?php echo e(route('categoria_fabricantes.destroy', $categoria_fabricante->id)); ?>" id="delete_categoria_fabricante_<?php echo e($categoria_fabricante->id); ?>_form" class="d-none">
        <?php echo csrf_field(); ?>
        <?php echo method_field('delete'); ?>
    </form>
</div>
<?php /**PATH /home/jtrevino/UPV/1730169-TAW-42/almacen/resources/views/categoria_fabricantes/actions.blade.php ENDPATH**/ ?>