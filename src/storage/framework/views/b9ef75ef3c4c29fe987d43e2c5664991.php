<?php $__env->startSection('body'); ?>
    <div class="layout">
        <div class="container">
            <div class="projects__apply  w-100">

                <?php echo $__env->make('front.components.breadcrumbs', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                <div class="projects__apply-wrapper content">
                    <h2 class="title">{{staticValue('button1')}}</h2>
                    <?php echo $__env->make('admin.components.error', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

                    <form class="apply-form" action="<?php echo e(route('support.create')); ?>" method="post">
                        <input type="hidden" name="type" value="application">
                        <?php echo csrf_field(); ?>
                        <div class="form-row form-row--name-date">
                            <div class="form-field">
                                <label for="fullname">{{staticValue('pleasure')}}</label>
                                <input type="text" id="fullname" name="data[name]" class="form-control" placeholder="Kiriting"
                                       required>
                            </div>

                            <div class="form-field">
                                <label for="birthdate">{{staticValue('birthdate')}}</label>
                                <input type="date" id="birthdate" name="data[birthdate]" class="form-control" required>
                            </div>
                        </div>
                        <?php
                            $jobs= contentSection('job');

                        ?>
                        <div class="form-field">
                            <label for="specialization">{{staticValue('Specialization')}}</label>
                            <select name="data[job]" id="specialization" class="form-control" required>
                                <option value="">{{staticValue('select_spec')}}</option>
                                <?php $__currentLoopData = $jobs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $job): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($job->id); ?>">
                                        <?php echo e(sectionValue($job,'title')); ?>

                                    </option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>

                        <div class="form-field">
                            <label for="address">{{staticValue('turar-joy')}}</label>
                            <input type="text" id="address" name="data[address]" class="form-control"
                                   placeholder="Manzilni kiriting" required>
                        </div>

                        <div class="form-field">
                            <label for="extra_info">{{staticValue('add-info')}}</label>
                            <input type="text" id="extra_info" name="data[extra_info]" class="form-control"
                                   placeholder="Bog‘lanish ma’lumoti" required>
                        </div>
                        <div class="form-field">
                            <label for="description">{{staticValue('taklif')}}</label>
                            <input type="text" id="description" name="data[description]" class="form-control" placeholder="Kiriting"
                                   required>
                        </div>

                        <button type="submit">{{staticValue('request')}}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="<?php echo e(asset('front/')); ?>/assets/js/imask.js"></script>
    <style>
        .breadcrumbs-wrapper{
            width: 100%;
        }
        .projects__apply-wrapper{
            max-width: initial;
        }
    </style>



    <script>

        function datePicker(selector) {
            flatpickr.localize({
                weekdays: {
                    shorthand: ['Yak', 'Du', 'Se', 'Ch', 'Pa', 'Ju', 'Sha'],
                    longhand: ['Yakshanba', 'Dushanba', 'Seshanba', 'Chorshanba', 'Payshanba', 'Juma', 'Shanba']
                },
                months: {
                    shorthand: ['Yan', 'Fev', 'Mar', 'Apr', 'May', 'Iyn', 'Iyl', 'Avg', 'Sen', 'Okt', 'Noy', 'Dek'],
                    longhand: ['Yanvar', 'Fevral', 'Mart', 'Aprel', 'May', 'Iyun', 'Iyul', 'Avgust', 'Sentabr', 'Oktabr', 'Noyabr', 'Dekabr']
                },
                firstDayOfWeek: 1,
                rangeSeparator: ' — ',
                weekAbbreviation: 'Hafta',
                scrollTitle: 'O‘zgartirish uchun aylantiring',
                toggleTitle: 'Ochiq/Yopiq'
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

<?php echo $__env->make('front.layouts.layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/resources/views/front/pages/ariza_topshirish/index.blade.php ENDPATH**/ ?>