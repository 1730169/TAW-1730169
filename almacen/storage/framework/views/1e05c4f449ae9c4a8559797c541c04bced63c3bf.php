<div class="list-group-item py-3">
    <div class="row">
        <label for="<?php echo e($id); ?>" class="col-form-label col-md-2"><?php echo e($label); ?></label>
        <div class="col-md">
            <select name="<?php echo e($name); ?>"
                    id="<?php echo e($id); ?>"
                    class="custom-select <?php $__errorArgs = [$name];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>"
                    <?php echo e($disabled ? 'disabled' : ''); ?>>
                <?php if($empty): ?>
                    <option value=""></option>
                <?php endif; ?>
                <?php $__currentLoopData = $options; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $option_label => $option_value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($option_value); ?>" <?php echo e($option_value == $value ? 'selected' : ''); ?>><?php echo e($option_label); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
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
<?php /**PATH /home/jtrevino/UPV/1730169-TAW-42/almacen/vendor/kejojedi/crudify/src/Providers/../../resources/views/select.blade.php ENDPATH**/ ?>