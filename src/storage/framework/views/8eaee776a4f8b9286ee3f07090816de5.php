<?php $__env->startSection('body'); ?>
 <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
  <script src="<?php echo e(asset('front/')); ?>/assets/js/imask.js"></script>
    <div class="layout">
        <div class="container">
            <div class="contacts-page">
                <div class="contacts-page__data">
                    <h2 class="contacts-page__data--title"><?php echo e(staticValue('contactmessage')); ?></h2>

                    
                  <?php if(session('success')): ?>
                    
                    <div class="modal fade"  id="supportResponseModal" tabindex="-1" role="dialog">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                
                                <div class="modal-header bg-primary text-white">
                                    <h5 class="modal-title"><?php echo e(staticValue('info')); ?></h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body text-center py-4">
                                    <h4 class="text-primary mb-2"><?php echo e(staticValue('thanks')); ?></h4>
                                    <p class="mb-0"><?php echo e(session('success')); ?></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal"><?php echo e(staticValue('close')); ?></button>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            var myModal = new bootstrap.Modal(document.getElementById('supportResponseModal'));
                            myModal.show();
                        });
                    </script>
                <?php endif; ?>

                    
                    <?php if($errors->any()): ?>
                        <div class="alert alert-danger" style="padding: 15px; margin-bottom: 20px; background: #f8d7da; color: #721c24; border-radius: 5px;">
                            <ul style="margin: 0; padding-left: 20px;">
                                <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <li><?php echo e($error); ?></li>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </ul>
                        </div>
                    <?php endif; ?>

                    <form action="<?php echo e(route('support.createForm')); ?>" class="contacts-page__data--form" method="post">
                        <?php echo csrf_field(); ?>
                           <input type="hidden" name="type" value="form">
                        <div class="contacts-page__data--form-group">
                            <label><?php echo e(staticValue('fullname')); ?></label>
                            <input class="form-control"
                                   type="text"
                                   placeholder="<?php echo e(staticValue('info-add')); ?>"
                                   name="data[name]"
                                   required />
                            <?php $__errorArgs = ['data.name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                <span class="text-danger" style="color: red; font-size: 14px;"><?php echo e($message); ?></span>
                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>
                        
                        <div class="contacts-page__data--form-row">
                            <div class="contacts-page__data--form-group">
                                <label><?php echo e(staticValue('number')); ?></label>
                                <input id="phone"
                                       class="form-control"
                                       type="text"
                                       name="data[phone]"
                                       required />
                                <?php $__errorArgs = ['data.phone'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <span class="text-danger" style="color: red; font-size: 14px;"><?php echo e($message); ?></span>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                            </div>

                            <div class="contacts-page__data--form-group">
                                <label><?php echo e(staticValue('email')); ?></label>
                                <input class="form-control"
                                       type="email"
                                       placeholder="example@gmail.com"
                                       name="data[email]"
                                       required />
                                <?php $__errorArgs = ['data.email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <span class="text-danger" style="color: red; font-size: 14px;"><?php echo e($message); ?></span>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                            </div>
                        </div>

                        <div class="contacts-page__data--form-group">
                            <label><?php echo e(staticValue('message')); ?></label>
                            <textarea class="form-control"
                                      placeholder="Kiriting"
                                      name="data[description]"
                                      required> </textarea>
                            <?php $__errorArgs = ['data.description'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                <span class="text-danger" style="color: red; font-size: 14px;"><?php echo e($message); ?></span>
                            <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                        </div>

                        <button type="submit" class="btn-submit">
                            <img src="<?php echo e(asset('front/images/send.svg')); ?>" alt="Send">
                            <?php echo e(staticValue('request')); ?>

                        </button>
                    </form>
                </div>

                <div class="contacts-page__contact">
                    <h2 class="contacts-page__data--title"><?php echo e(staticValue('contacts')); ?></h2>
                    <div class="contacts-page__contact--info">
                        <a href="tel:+998712345678" class="contacts-page__contact--info-item">
                            <div class="contacts-page__contact--info-item-img">
                                <div class="contacts-page__contact--info-item-img-circle">
                                    <img src="<?php echo e(asset('front/images/contacts-1.svg')); ?>" alt="Phone">
                                </div>
                            </div>
                            <div class="contacts-page__contact--info-item-numbers">
                                <p><?php echo e(staticValue('phone')); ?></p>
                                <span>+998 71 234 56 78</span>
                            </div>
                        </a>

                        <a href="mailto:info@example.com" class="contacts-page__contact--info-item">
                            <div class="contacts-page__contact--info-item-img">
                                <div class="contacts-page__contact--info-item-img-circle">
                                    <img src="<?php echo e(asset('front/images/contacts-2.svg')); ?>" alt="Email">
                                </div>
                            </div>
                            <div class="contacts-page__contact--info-item-numbers">
                                <p><?php echo e(staticValue('email')); ?></p>
                                <span>info@example.com</span>
                            </div>
                        </a>

                        <div class="contacts-page__contact--info-item">
                            <div class="contacts-page__contact--info-item-img">
                                <div class="contacts-page__contact--info-item-img-circle">
                                    <img src="<?php echo e(asset('front/images/contacts-3.svg')); ?>" alt="Time">
                                </div>
                            </div>
                            <div class="contacts-page__contact--info-item-numbers">
                                <p><?php echo e(staticValue('work-time')); ?></p>
                                <span><?php echo e(staticValue('work-days')); ?> 09:00 – 18:00</span>
                            </div>
                        </div>

                        <div class="contacts-page__contact--info-item">
                            <div class="contacts-page__contact--info-item-img">
                                <div class="contacts-page__contact--info-item-img-circle">
                                    <img src="<?php echo e(asset('front/images/contacts-4.svg')); ?>" alt="Address">
                                </div>
                            </div>
                            <div class="contacts-page__contact--info-item-numbers">
                                <p><?php echo e(staticValue('address')); ?></p>
                                <span><?php echo e(staticValue('adres')); ?></span>
                            </div>
                        </div>
                    </div>
                </div>

                <?php if(isset($items[0])): ?>
                <?php echo sectionValue($items[0],'map'); ?>

                <?php endif; ?>

            </div>
            <script>
                const input = document.querySelector('#phone');
                IMask(input, {
                    mask: '+998 00-000-00-00',
                    lazy: false
                });
            </script>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/contacts/index.blade.php ENDPATH**/ ?>