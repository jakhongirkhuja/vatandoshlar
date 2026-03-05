<?php
// echo shell_exec('ffmpeg -version 2>&1');
// var_dump(function_exists('shell_exec'));

$output = shell_exec('ffmpeg -version 2>&1');
if ($output) {
    echo "<pre>FFMPEG is installed globally:\n$output</pre>";
} else {
    echo "FFMPEG not found on server!";
}
// chdir(__DIR__ . '/..');

// exec('composer require php-ffmpeg/php-ffmpeg 2>&1', $output, $code);

// echo "<pre>";
// echo implode("\n", $output);
// echo "</pre>";

// if ($code === 0 && file_exists(__DIR__ . '/../vendor/php-ffmpeg/php-ffmpeg')) {

//     require __DIR__ . '/../vendor/autoload.php';

//     if (class_exists(\FFMpeg\FFMpeg::class)) {
//         echo "<b style='color:green'>Installed successfully in ROOT vendor ✅</b>";
//     } else {
//         echo "<b style='color:red'>Folder exists but class not found ❌</b>";
//     }
// } else {
//     echo "<b style='color:red'>Installation failed ❌</b>";
// }
