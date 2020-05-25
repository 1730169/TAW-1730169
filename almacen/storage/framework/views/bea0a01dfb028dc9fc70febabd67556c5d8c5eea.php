<?php $__env->startSection('title', __('Create Fabricante')); ?>
<?php $__env->startSection('content'); ?>
    <div class="container">
        <h1><?php echo $__env->yieldContent('title'); ?></h1>

        <form method="post" action="<?php echo e(route('fabricantes.store')); ?>">
            <?php echo csrf_field(); ?>

            <div class="card">
                <?php echo $__env->make('fabricantes.fields', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

                <div class="card-footer text-md-right border-top-0">
                    <button type="submit" name="submit" value="reload" class="btn btn-primary"><?php echo e(__('Create & Add Another')); ?></button>
                    <button type="submit" name="submit" value="redirect" class="btn btn-primary"><?php echo e(__('Create')); ?></button>
                </div>
            </div>
        </form>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/jtrevino/UPV/1730169-TAW-42/almacen/resources/views/fabricantes/create.blade.php ENDPATH**/ ?>