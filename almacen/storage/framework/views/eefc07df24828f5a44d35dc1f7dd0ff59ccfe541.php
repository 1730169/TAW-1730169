<?php $__env->startSection('title', __('Edit Producto')); ?>
<?php $__env->startSection('content'); ?>
    <div class="container">
        <div class="row">
            <div class="col-md">
                <h1><?php echo $__env->yieldContent('title'); ?></h1>
            </div>
            <div class="col-md-auto mb-3 mb-md-0">
                <?php echo $__env->make('productos.actions', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
        </div>

        <form method="post" action="<?php echo e(route('productos.update', $producto->id)); ?>">
            <?php echo csrf_field(); ?>
            <?php echo method_field('patch'); ?>

            <div class="card">
                <?php echo $__env->make('productos.fields', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

                <div class="card-footer text-md-right border-top-0">
                    <button type="submit" name="submit" value="reload" class="btn btn-primary"><?php echo e(__('Update & Continue Edit')); ?></button>
                    <button type="submit" name="submit" value="redirect" class="btn btn-primary"><?php echo e(__('Update')); ?></button>
                </div>
            </div>
        </form>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/jtrevino/UPV/1730169-TAW-42/almacen/resources/views/productos/edit.blade.php ENDPATH**/ ?>