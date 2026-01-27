<?php $__env->startSection('body'); ?>
    <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <script src="<?php echo e(asset('front/')); ?>/assets/js/imask.js"></script>
    <div class="layout">
        <div class="container">
            <div class="contacts-page">
                <div class="contacts-page__data">
                    <h2 class="contacts-page__data--title"><?php echo e(staticValue('contactmessage')); ?></h2>

                    
                    <?php echo $__env->make('front.components.modal', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

                    

                    <form action="<?php echo e(route('support.createForm')); ?>" class="contacts-page__data--form" id="myForm"
                        method="post">
                        <?php echo csrf_field(); ?>
                        <input type="hidden" name="type" value="form">
                        <div class="contacts-page__data--form-group">
                            <label><?php echo e(staticValue('fullname')); ?></label>
                            <input class="form-control" type="text" placeholder="<?php echo e(staticValue('info-add')); ?>"
                                name="data[name]" required />
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
                                <!-- <input id="phone" class="form-control" type="text" name="data[phone]" required /> -->
                                <div class="phone-dropdown">
                                    <button type="button" class="phone-toggle">
                                        <img src="" data-code="+998">
                                        <i class="i-dropdown"></i>
                                    </button>

                                    <input type="tel" class="form-control" id="phone" name="data[phone]" required>

                                    <div class="phone-menu">
                                        <div class="phone-search">
                                            <i class="i-search"></i>
                                            <input type="text" placeholder="<?php echo e(staticValue('search')); ?>">
                                        </div>
                                        <ul>
                                            <?php $__currentLoopData = countries(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $country): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <li data-code="+<?php echo e($country['phonecode']); ?>"
                                                    data-flag="<?php echo e(asset('front')); ?>/images/flags/<?php echo e(strtolower($country['iso'])); ?>.png">
                                                    <img
                                                        src="<?php echo e(asset('front')); ?>/images/flags/<?php echo e(strtolower($country['iso'])); ?>.png">
                                                    <span><?php echo e($country['iso3']); ?></span>
                                                    <small>+<?php echo e($country['phonecode']); ?></small>
                                                </li>

                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                        </ul>
                                    </div>
                                </div>

                                <script>
                                    document.addEventListener('DOMContentLoaded', () => {
                                        const phoneInput = document.getElementById('phone')
                                        const toggle = document.querySelector('.phone-toggle')
                                        const menu = document.querySelector('.phone-menu')
                                        const search = document.querySelector('.phone-search input')
                                        if (!phoneInput || !toggle || !menu || !search) {
                                            console.error('Required DOM elements missing')
                                            console.groupEnd()
                                            return
                                        }
                                        document.addEventListener('click', e => {
                                            if (!menu.classList.contains('active')) return
                                            if (e.target.closest('.phone-dropdown')) return
                                            menu.classList.remove('active')
                                        })
                                        let mask
                                        const masks = {
                                            <?php $__currentLoopData = countries(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $country): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php
                                                    // Trim all country data before processing
                                                    $phonecode = trim(strval($country['phonecode']));
                                                    $code = '+' . ltrim(trim($phonecode), '+');
                                                    $phonemask = !empty($country['phonemask']) ? trim($country['phonemask']) : '00 000-00-00';
                                                    // Escape each digit in the phone code for IMask literal format
                                                    $codeDigits = ltrim(trim($phonecode), '+');
                                                    $escapedCode = '+' . implode('', array_map(fn($c) => "\\\\$c", str_split($codeDigits)));
                                                    $mask = trim("{$escapedCode} {$phonemask}");
                                                ?>
                                                '<?php echo e(trim($code)); ?>': '<?php echo e(trim($mask)); ?>',
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    };

                                    const updateToggleFromCode = code => {
                                        if (!code) return
                                        const img = toggle.querySelector('img')
                                        if (!img) return
                                        const match = Array.from(menu.querySelectorAll('li')).find(li => li.dataset.code === code)
                                        if (match) {
                                            img.src = match.dataset.flag
                                            img.dataset.code = match.dataset.code
                                        }
                                    }

                                    const setMask = code => {
                                        mask && mask.destroy()
                                        phoneInput.value = ''

                                        // Create fallback with escaped code digits
                                        let fallbackMask = code ? code.split('').map(c => c === '+' ? '+' : '\\' + c).join('') + ' 00 000-00-00' : '+\\0\\0\\0 00 000-00-00';
                                        const selectedMaskPattern = masks[code] || fallbackMask;


                                        // Use IMask with simple pattern
                                        mask = IMask(phoneInput, {
                                            mask: selectedMaskPattern,
                                            lazy: false
                                        })

                                        // share mask instance for other scripts (e.g., persistence)
                                        phoneMaskInstance = mask

                                        mask.value = ''
                                        phoneInput.focus()
                                        phoneInput.blur()
                                    }

                                    // choose initial mask: saved phone_code from sessionStorage if present, else current toggle flag, else fallback to +998
                                    let initialMaskCode = '+998'
                                    try {
                                        const savedRaw = sessionStorage.getItem('form_apply_data')
                                        if (savedRaw) {
                                            const savedObj = JSON.parse(savedRaw)
                                            if (savedObj?.inputs?.phone_code) {
                                                initialMaskCode = savedObj.inputs.phone_code
                                            }
                                        }
                                    } catch (e) {
                                        // ignore parse errors, keep default
                                    }

                                    const toggleImg = toggle.querySelector('img')
                                    if (toggleImg?.dataset?.code && (!initialMaskCode || initialMaskCode === '+998')) {
                                        initialMaskCode = toggleImg.dataset.code
                                    }

                                    setMask(initialMaskCode)
                                    updateToggleFromCode(initialMaskCode)

                                    toggle.onclick = () => {
                                        menu.classList.toggle('active')
                                    }

                                    menu.onclick = e => {
                                        const li = e.target.closest('li')
                                        if (!li) {
                                            return
                                        }


                                        toggle.querySelector('img').src = li.dataset.flag
                                        toggle.querySelector('img').dataset.code = li.dataset.code
                                        setMask(li.dataset.code)
                                        menu.classList.remove('active')
                                    }

                                    search.oninput = () => {
                                        const v = search.value.toLowerCase()

                                        menu.querySelectorAll('li').forEach(li => {
                                            const visible = li.querySelector('span').textContent.toLowerCase().includes(v)
                                            li.style.display = visible ? 'flex' : 'none'
                                        })
                                    }

                                    console.groupEnd()
                                                    })
                                </script>

                                <!-- <?php $__errorArgs = ['data.phone'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <span class="text-danger" style="color: red; font-size: 14px;"><?php echo e($message); ?></span>
                                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?> -->
                            </div>

                            <div class="contacts-page__data--form-group">
                                <label><?php echo e(staticValue('email')); ?></label>
                                <input class="form-control" type="email" placeholder="example@gmail.com" name="data[email]"
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
                            <textarea class="form-control" placeholder="Kiriting" name="data[description]"
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
                        <div id="recaptcha-container"></div>
                        <button type="submit" id="submitBtn" class="submit-btn"> <img
                                src="<?php echo e(asset('front/images/send.svg')); ?>" alt="Send"> <?php echo e(staticValue('request')); ?></button>
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
                                <span><?php echo e(staticValue('phone', 'description')); ?></span>
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
                                <span><?php echo e(staticValue('email', 'description')); ?></span>
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
                                <span><?php echo e(staticValue('work-days')); ?> <?php echo e(staticValue('work-days', 'description')); ?></span>
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
                                <span><?php echo e(staticValue('address', 'content')); ?></span>
                            </div>
                        </div>
                    </div>
                </div>

                <?php if(isset($items[0])): ?>
                    <?php echo sectionValue($items[0], 'map'); ?>

                <?php endif; ?>

            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.components.recaptchaHandler', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/pages/contacts/index.blade.php ENDPATH**/ ?>