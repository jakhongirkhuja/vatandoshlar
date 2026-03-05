@extends('front.layouts.layout')
@section('body')
@include('front.components.breadcrumbs')
<div class="layout">
    <div class="container">
        <div class="projects__apply">
            <div class="projects__apply-wrapper content">

                @php

                $forms =pageSectionChilds($id,'form',null,false);

                @endphp
                @if(count($forms))
                <h2 class="title">{{ staticValue('Participation') }}</h2>
                <form class="apply-form" action="{{ route('participation.create') }}" id="myForm" enctype="multipart/form-data" method="post">
                    @csrf
                    <input type="hidden" name="type" value="participation">
                    <div class="row">
                        @foreach($forms as $data)
                        @php
                        $label= sectionValue($data,'title');
                        $key= sectionValue($data,'key');
                        $type= sectionValue($data,'type');
                        $value= sectionValue($data,'value');
                        $placeholder= sectionValue($data,'placeholder');
                        $required= sectionValue($data,'required');
                        $column= sectionValue($data,'column');
                        @endphp
                        <div class="col-md-{{$column?? 12}}">
                            <div class="form-field">
                                <label for="{{$key}}">{{$label}}:</label>
                                @if($type=='select' || $type=='country')
                                <select id="{{$key}}" name="data[{{$key}}]" class="form-control" @if($required=='1' ) required @endif>
                                    <option value="" disabled selected>{{$placeholder}}</option>
                                    @if($type=='select')
                                    @php $splitvalues=explode(',',$value) @endphp
                                    @foreach($splitvalues as $splitvalue)
                                    <option value="{{$splitvalue}}">{{$splitvalue}}</option>
                                    @endforeach
                                    @else
                                    @foreach(countries() as $country)
                                    <option value="{{ $country['name'] }}">{{ $country['name'] }}</option>
                                    @endforeach
                                    @endif

                                </select>
                                @elseif($type=='tel')
                                <div class="phone-dropdown">
                                    <button type="button" class="phone-toggle">
                                        <img src="https://greenuniversity.uz/assets/public/apply/flags/uz.png" data-code="+998">
                                        <i class="i-dropdown"></i>
                                    </button>

                                    <input type="{{$type}}" class="form-control" id="{{$key}}" name="data[{{$key}}]" required>

                                    <div class="phone-menu">
                                        <div class="phone-search">
                                            <i class="i-search"></i>
                                            <input type="text" placeholder="{{staticValue('search')}}">
                                        </div>
                                        <ul>
                                            @foreach(countries() as $country)
                                            <li data-code="+{{$country['phonecode']}}" data-flag="{{ asset('front') }}/images/flags/{{ strtolower($country['iso']) }}.png">
                                                <img src="{{ asset('front') }}/images/flags/{{ strtolower($country['iso'])  }}.png">
                                                <span>{{ $country['iso3'] }}</span>
                                                <small>+{{$country['phonecode']}}</small>
                                            </li>

                                            @endforeach

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
                                                        @foreach(countries() as $country)
                                        @php
                                        // Trim all country data before processing
                                        $phonecode = trim(strval($country['phonecode']));
                                        $code = '+'.ltrim(trim($phonecode), '+');
                                        $phonemask = !empty($country['phonemask']) ? trim($country['phonemask']) : '00 000-00-00';
                                        // Escape each digit in the phone code for IMask literal format
                                        $codeDigits = ltrim(trim($phonecode), '+');
                                        $escapedCode = '+'.implode('', array_map(fn($c) => "\\\\$c", str_split($codeDigits)));
                                        $mask = trim("{$escapedCode} {$phonemask}");
                                        @endphp '{{ trim($code) }}': '{{ trim($mask) }}',
                                            @endforeach
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
                                @elseif($type=='file')
                                <div class="upload-area" id="upload-area">
                                    <div class="upload-area__text" id="upload-text">
                                        <span class="upload-area__title">
                                            <img src="{{ asset('front') }}/images/upload.svg" alt="Upload icon">
                                            {{staticValue('upload')}}
                                        </span>
                                        <p class="upload-area__description"> {{$placeholder}}</p>
                                    </div>
                                    <div class="file-list" id="file-list"></div>
                                </div>
                                <input id="file-input" name="{{$key}}[]" type="file" multiple hidden accept="{{$value}}" @if($required=='1' ) required @endif>
                                @else
                                <input type="{{$type}}" id="{{$key}}" name="data[{{$key}}]" class="form-control" placeholder="{{$placeholder}}" @if($required=='1' ) required @endif value="{{$value}}">
                                @endif

                            </div>
                        </div>
                        @endforeach

                    </div>




                    <div id="recaptcha-container"></div>
                    <div class="form-actions">
                        <button type="submit" id="submitBtn" class="submit-btn">
                            <img src="{{ asset('front') }}/images/send.svg" alt="Send icon">
                            <span>{{staticValue('request')}}</span>
                        </button>
                    </div>
                </form>
                @endif
            </div>
        </div>
    </div>
</div>

<link rel="stylesheet" href="{{ asset('front/') }}/assets/flatpickr/flatpickr.css">
<script src="{{ asset('front/') }}/assets/js/imask.js"></script>
<script src="{{ asset('front/') }}/assets/flatpickr/flatpickr.js"></script>
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
        const weekShorthand = "{{ setting('week_short') }}".split(', ');
        const weekLonghand = "{{ setting('week_long') }}".split(', ');
        const monthShorthand = "{{ setting('month_short') }}".split(', ');
        const monthLonghand = "{{ setting('month_long') }}".split(', ');
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
            weekAbbreviation: "{{staticValue('week')}}",
            scrollTitle: "{{staticValue('week')}}",
            toggleTitle: "{{staticValue('week')}}",
            short_description: "{{staticValue('week')}}"
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
            MAX_FILE_SIZE: 3 * 1024 * 1024, // 10MB
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
@include('front.components.recaptchaHandler')
@endsection