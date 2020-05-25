<?php $__env->startSection('title', __('Producto')); ?>
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

        <div class="card">
            <div class="list-group list-group-flush">
                <?php $__currentLoopData = $producto->toArray(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $attribute => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="list-group-item py-3">
                        <div class="row">
                            <div class="col-md-2 text-secondary">
                                <?php echo e(Str::title(str_replace('_', ' ', $attribute))); ?>

                            </div>
                            <div class="col-md">
                                <?php if(is_array($value)): ?>
                                    <pre class="mb-0"><?php echo e(json_encode($value, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES)); ?></pre>
                                <?php else: ?>
                                    <?php echo e($value ?? __('N/A')); ?>

                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/jtrevino/UPV/1730169-TAW-42/almacen/resources/views/productos/show.blade.php ENDPATH**/ ?>