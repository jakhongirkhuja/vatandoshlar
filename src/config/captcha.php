<?php

return [
    'disable' => env('CAPTCHA_DISABLE', false),
    'characters' => [
        'A',
        'B',
        'C',
        'D',
        'E',
        'F',
        'G',
        'H',
        'I',
        'J',
        'K',
        'L',
        'M',
        'N',
        'O',
        'P',
        'Q',
        'R',
        'S',
        'T',
        'U',
        'V',
        'W',
        'X',
        'Y',
        'Z',
        'a',
        'b',
        'c',
        'd',
        'e',
        'f',
        'g',
        'h',
        'i',
        'j',
        'k',
        'l',
        'm',
        'n',
        'o',
        'p',
        'q',
        'r',
        's',
        't',
        'u',
        'v',
        'w',
        'x',
        'y',
        'z',
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9
    ],
    'fontsDirectory' => public_path('assets/fonts'),
    'bgsDirectory' => public_path('assets/backgrounds'),
    'default' => [
    'length' => 4,
    'width' => 120,
    'height' => 35,
    'quality' => 95,
    'math' => false,
    'expire' => 60,
    'encrypt' => true,

    // style
    'bgImage' => false,
    'bgColor' => '#e0f2fe',
    'fontColors' => [
    '#ef4444', // qizil
    '#22c55e', // yashil
    '#3b82f6', // ko‘k
    '#a855f7', // binafsha
    '#f59e0b', // sariq
],  
    'lines' => 1,
    'contrast' => 0,
    'angle' => 0,
    'sharpen' => 6,
    'blur' => 0,
],

    'flat' => [
        'length' => 6,
         'fontColors' => ['#1f2937'],
        'width' => 345,
        'height' => 65,
        'math' => false,
        'quality' => 100,
        'lines' => 6,
        'bgImage' => true,
        'bgColor' => '#28faef',
        'contrast' => 0,
    ],
  'mini' => [
    'length' => 3,
    'width'  => 60,
    'height' => 32,
    'quality' => 95,
    'math' => false,
    'expire' => 60,
    'encrypt' => true,

    // style
    'bgImage' => false,
    'bgColor' => '#fef3c7', // och sariq fon
    'fontColors' => [
        '#ef4444', // qizil
        '#22c55e', // yashil
        '#3b82f6', // ko‘k
        '#a855f7', // binafsha
        '#f59e0b', // to‘q sariq
    ],
    'lines' => 1,
    'contrast' => 0,
    'angle' => 5,
    'sharpen' => 6,
    'blur' => 0,
],

    'inverse' => [
        'length' => 5,
        'width' => 120,
        'height' => 36,
        'quality' => 90,
        'sensitive' => true,
        'angle' => 12,
        'sharpen' => 10,
        'blur' => 2,
        'invert' => false,
        'contrast' => -5,
    ],
    'math' => [
        'length' => 9,
        'width' => 120,
        'height' => 36,
        'quality' => 90,
    ],
];
