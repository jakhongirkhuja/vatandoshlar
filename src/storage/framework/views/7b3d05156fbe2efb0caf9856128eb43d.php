<?php $__env->startSection('body'); ?>
    <div class="layout">
        <div class="container">
            <div class="projects__apply">
                <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                <div class="projects__apply-wrapper content">
                    <h2 class="title"><?php echo e(staticValue('Participation')); ?></h2>

                    <form class="apply-form" action="<?php echo e(route('participation.create')); ?>" id="myForm"
                        enctype="multipart/form-data" method="post">
                        <?php echo csrf_field(); ?>
                        <input type="hidden" name="type" value="participation">
                        <div class="form-row form-row--name-date">
                            <div class="form-field">
                                <label for="fullname"><?php echo e(staticValue('fullname')); ?></label>
                                <input type="text" id="fullname" name="data[name]" class="form-control"
                                    placeholder="<?php echo e(staticValue('info-add')); ?>" required>
                            </div>
                            <div class="form-field">
                                <label for="birthdate"><?php echo e(staticValue('birthdate')); ?></label>
                                <input type="date" id="birthdate" placeholder="DD-MM-YYYY" name="data[birthdate]"
                                    class="form-control" required>
                            </div>
                        </div>

                        <div class="form-row form-row--three">
                            <div class="form-field form-field--select">
                                <label for="gender"><?php echo e(staticValue('gender')); ?></label>
                                <div class="select-wrapper">
                                    <select id="gender" name="data[gender]" class="form-control" required>
                                        <option value="" disabled selected><?php echo e(staticValue('choose')); ?></option>
                                        <option value="male"><?php echo e(staticValue('erkak')); ?></option>
                                        <option value="female"><?php echo e(staticValue('ayol')); ?></option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-field">
                                <label for="email">E-mail:</label>
                                <input type="email" id="email" name="data[email]" class="form-control"
                                    placeholder="example@gmail.com" required>
                            </div>
                            <div class="form-field">
                                <label for="phone"><?php echo e(staticValue('number')); ?></label>
                                <div class="phone-dropdown">
                                    <button type="button" class="phone-toggle">
                                        <img src="https://greenuniversity.uz/assets/public/apply/flags/uz.png"
                                            data-code="+998">
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
                                    }

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

                            </div>
                        </div>

                        <div class="form-row form-row--two">
                            <div class="form-field form-field--select">
                                <label for="country"><?php echo e(staticValue('owncity')); ?></label>

                                <div class="select-wrapper">
                                    <select id="country" name="data[country]" class="form-control" required>
                                        <option value="" disabled selected><?php echo e(staticValue('choose')); ?></option>
                                        <?php $__currentLoopData = countries(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $country): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($country['name']); ?>"><?php echo e($country['name']); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>

                                </div>
                            </div>
                            <div class="form-field form-field--select">
                                <label for="city"><?php echo e(staticValue('city')); ?></label>
                                <input id="city" name="data[city]" class="form-control"
                                    placeholder="<?php echo e(staticValue('choose')); ?>" required>

                            </div>
                        </div>

                        <div class="form-row form-row--two">
                            <div class="form-field">
                                <label for="workplace"><?php echo e(staticValue('workplace:')); ?></label>
                                <input type="text" id="workplace" name="data[workplace]" class="form-control"
                                    placeholder="<?php echo e(staticValue('info-add')); ?>" required>
                            </div>

                            <div class="form-field">
                                <label for="position"><?php echo e(staticValue('position')); ?></label>
                                <input type="text" id="position" name="data[position]" class="form-control"
                                       placeholder="<?php echo e(staticValue('info-add')); ?>" required>


                            </div>
                        </div>

                        <div class="form-row form-row--two">
                            <div class="form-field">
                                <label for="education"><?php echo e(staticValue('information')); ?></label>
                                <input type="text" id="education" name="data[education]" class="form-control"
                                    placeholder="<?php echo e(staticValue('info-add')); ?>">
                            </div>
                            <?php
                                $jobs = contentSection('job');
                            ?>
                            <div class="form-field">
                                <label for="specialization"><?php echo e(staticValue('select_spec')); ?></label>

                                <select id="specialization" name="data[specialization]" class="form-control">
                                    <option selected disabled ><?php echo e(staticValue('info-add')); ?></option>
                                    <?php $__currentLoopData = $jobs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $job): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e(sectionValue($job,'title')); ?>"><?php echo e(sectionValue($job,'title')); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>

                            </div>
                        </div>

                        <div class="form-row form-row--three">
                            <div class="form-field">
                                <label for="telegram">Telegram:</label>
                                <input type="text" id="telegram" name="data[telegram]" class="form-control"
                                    placeholder="<?php echo e(staticValue('info-add')); ?>">
                            </div>
                            <div class="form-field">
                                <label for="instagram">Instagram:</label>
                                <input type="text" id="instagram" name="data[instagram]" class="form-control"
                                    placeholder="<?php echo e(staticValue('info-add')); ?>">
                            </div>
                            <div class="form-field">
                                <label for="whatsapp">WhatsApp:</label>
                                <input type="text" id="whatsapp" name="data[whatsapp]" class="form-control"
                                    placeholder="<?php echo e(staticValue('info-add')); ?>">
                            </div>
                        </div>

                        <div class="form-field form-field--upload">
                            <label for="file-input"><?php echo e(staticValue('file')); ?></label>
                            <div class="upload-area" id="upload-area">
                                <div class="upload-area__text" id="upload-text">
                                    <span class="upload-area__title">
                                        <img src="<?php echo e(asset('front')); ?>/images/upload.svg" alt="Upload icon">
                                        <?php echo e(staticValue('upload')); ?>

                                    </span>
                                    <p class="upload-area__description"> <?php echo e(staticValue('video')); ?></p>
                                </div>
                                <div class="file-list" id="file-list"></div>
                            </div>
                            <input id="file-input" name="image[]" type="file" multiple hidden
                                accept="video/*,image/*,.pdf,.doc,.docx," required>
                        </div>
                        <div id="recaptcha-container" style="display: none"></div>
                        <div class="form-actions">
                            <button type="button" id="submitBtn" class="submit-btn">
                                <img src="<?php echo e(asset('front')); ?>/images/send.svg" alt="Send icon">
                                <span><?php echo e(staticValue('request')); ?></span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <?php echo $__env->make('front.components.modal', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    <link rel="stylesheet" href="<?php echo e(asset('front/')); ?>/assets/flatpickr/flatpickr.css">
    <script src="<?php echo e(asset('front/')); ?>/assets/js/imask.js"></script>
    <script src="<?php echo e(asset('front/')); ?>/assets/flatpickr/flatpickr.js"></script>
    <style>
        .breadcrumbs-wrapper {
            width: 100%;
        }

        .projects__apply-wrapper {
            max-width: initial;
        }
    </style>


    <script>

        function datePicker(selector) {
            const weekShorthand = "<?php echo e(setting('week_short')); ?>".split(', ');
            const weekLonghand = "<?php echo e(setting('week_long')); ?>".split(', ');
            const monthShorthand = "<?php echo e(setting('month_short')); ?>".split(', ');
            const monthLonghand = "<?php echo e(setting('month_long')); ?>".split(', ');
            flatpickr.localize({
                weekdays: {
                    shorthand: weekShorthand,
                    longhand: weekLonghand
                },
                months: {
                    shorthand: monthShorthand,
                    longhand: monthLonghand
                },
                firstDayOfWeek: 1,
                rangeSeparator: ' — ',
                weekAbbreviation: '<?php echo e(staticValue('week')); ?>',
                scrollTitle: '<?php echo e(staticValue('week', 'content')); ?>',
                toggleTitle: '<?php echo e(staticValue('week', 'short_description')); ?>'
            })

            flatpickr(selector, {
                mode: "single",
                dateFormat: "d-m-Y",
                position: "below",
                placeholder: "DD-MM-YYYY",
            })
        }

        datePicker("#birthdate");

        (function () {
            'use strict';

            // Constants
            const CONFIG = {
                MAX_FILE_SIZE: 10 * 1024 * 1024, // 10MB
                MAX_FILES: 5,
                ALLOWED_TYPES: [
                    'image/jpeg', 'image/png', 'image/gif', 'image/webp',
                    'video/mp4', 'video/mpeg', 'video/quicktime',
                    'application/pdf',
                    'application/msword',
                    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                    'application/vnd.ms-excel',
                    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
                ],
                BG_COLORS: {
                    DEFAULT: '#EFF3F9',
                    HOVER: '#dde5f5'
                }
            };

            // DOM Elements
            const elements = {
                fileInput: document.getElementById('file-input'),
                uploadArea: document.getElementById('upload-area'),
                uploadText: document.getElementById('upload-text'),
                fileList: document.getElementById('file-list')
            };

            // State
            let currentFiles = [];

            // UI Functions
            function toggleError(show = true) {
                elements.uploadArea.classList.toggle('error', show);
            }

            function updateUploadTextVisibility() {
                const hasFiles = currentFiles.length > 0;
                elements.uploadText.style.opacity = hasFiles ? '0.6' : '1';
                elements.uploadText.style.marginBottom = hasFiles ? '24px' : '0';
            }

            function createFileItem(file, index) {
                const sizeKB = (file.size / 1024).toFixed(1);
                const item = document.createElement('div');
                item.className = 'file-item';
                item.innerHTML = `
                <span class="file-name" title="${file.name}">${file.name}</span>
                <span class="file-size">${sizeKB} KB</span>
                <button type="button" class="remove-file" aria-label="Remove file">×</button>
            `;

                item.querySelector('.remove-file').addEventListener('click', (e) => {
                    e.stopPropagation();
                    removeFile(index);
                });

                return item;
            }

            function renderFileList() {
                elements.fileList.innerHTML = '';
                toggleError(false);
                updateUploadTextVisibility();

                if (currentFiles.length === 0) return;

                currentFiles.forEach((file, index) => {
                    elements.fileList.appendChild(createFileItem(file, index));
                });
            }

            // File Management
            function removeFile(index) {
                currentFiles.splice(index, 1);
                renderFileList();
                updateFileInput();
            }

            function updateFileInput() {
                const dataTransfer = new DataTransfer();
                currentFiles.forEach(file => dataTransfer.items.add(file));
                elements.fileInput.files = dataTransfer.files;
            }

            function isFileDuplicate(file) {
                return currentFiles.some(f =>
                    f.name === file.name &&
                    f.size === file.size &&
                    f.lastModified === file.lastModified
                );
            }

            function validateFile(file) {
                if (isFileDuplicate(file)) {
                    return `"${file.name}" allaqachon yuklangan.`;
                }

                if (file.type && !CONFIG.ALLOWED_TYPES.includes(file.type)) {
                    return `"${file.name}" ruxsat etilmagan formatda.`;
                }

                if (file.size > CONFIG.MAX_FILE_SIZE) {
                    return `"${file.name}" juda katta (maksimum 10 MB).`;
                }

                return null;
            }

            function addFiles(newFiles) {
                toggleError(false);

                if (currentFiles.length + newFiles.length > CONFIG.MAX_FILES) {
                    toggleError(true);
                    return false;
                }

                let errorMessage = null;

                for (const file of newFiles) {
                    const error = validateFile(file);
                    if (error) {
                        errorMessage = error;
                        break;
                    }
                    currentFiles.push(file);
                }

                if (errorMessage) {
                    toggleError(true);
                    return false;
                }

                return true;
            }

            // Event Handlers
            function handleFileInputChange(e) {
                e.stopPropagation();
                const files = Array.from(elements.fileInput.files);
                if (files.length > 0 && addFiles(files)) {
                    renderFileList();
                    updateFileInput();
                }
            }

            function handleUploadAreaClick(e) {
                if (!e.target.classList.contains('remove-file')) {
                    e.stopPropagation();
                    elements.fileInput.click();
                }
            }

            function handleDragOver(e) {
                e.preventDefault();
                e.stopPropagation();
                elements.uploadArea.style.backgroundColor = CONFIG.BG_COLORS.HOVER;
            }

            function handleDragLeave(e) {
                e.preventDefault();
                e.stopPropagation();
                elements.uploadArea.style.backgroundColor = CONFIG.BG_COLORS.DEFAULT;
            }

            function handleDrop(e) {
                e.preventDefault();
                e.stopPropagation();
                elements.uploadArea.style.backgroundColor = CONFIG.BG_COLORS.DEFAULT;

                const files = Array.from(e.dataTransfer.files);
                if (files.length > 0 && addFiles(files)) {
                    renderFileList();
                    updateFileInput();
                }
            }

            // Event Listeners
            elements.fileInput.addEventListener('change', handleFileInputChange);
            elements.uploadArea.addEventListener('click', handleUploadAreaClick);
            elements.uploadArea.addEventListener('dragover', handleDragOver);
            elements.uploadArea.addEventListener('dragleave', handleDragLeave);
            elements.uploadArea.addEventListener('drop', handleDrop);
        })(); 
    </script>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.components.recaptchaHandler', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/front/pages/projects/inside/detail/index.blade.php ENDPATH**/ ?>