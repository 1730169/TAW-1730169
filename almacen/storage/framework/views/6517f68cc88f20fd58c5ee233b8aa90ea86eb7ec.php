<div class="list-group-item py-3">
    <div class="row">
        <label for="<?php echo e($id); ?>" class="col-form-label col-md-2"><?php echo e($label); ?></label>
        <div class="col-md">
            <textarea name="<?php echo e($name); ?>"
                      id="<?php echo e($id); ?>"
                      class="form-control <?php $__errorArgs = [$name];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                      rows="<?php echo e($rows); ?>"
                      <?php echo e($disabled ? 'disabled' : ''); ?>

                      <?php echo e($readonly ? 'readonly' : ''); ?>><?php echo e($value); ?></textarea>
            <?php $__errorArgs = [$name];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> <span class="invalid-feedback font-weight-bold"><?php echo e($message); ?></span> <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
            <?php if($hint): ?> <small class="form-text text-secondary"><?php echo e($hint); ?></small> <?php endif; ?>
        </div>
    </div>
</div>
<?php /**PATH /home/jtrevino/UPV/1730169-TAW-42/almacen/vendor/kejojedi/crudify/src/Providers/../../resources/views/textarea.blade.php ENDPATH**/ ?>