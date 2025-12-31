<?php

use App\Http\Middleware\SetLocale;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\Admin\SupportController;
use App\Http\Controllers\Admin\Auth\AuthController;

Route::get('login', [AuthController::class, 'login'])->name('login');
Route::post('loginForm', [AuthController::class, 'loginForm'])->name('loginForm');
Route::get('reload-captcha', [AuthController::class, 'captch'])->name('reload.captcha');
Route::post('support', [SupportController::class, 'createForm'])->name('support.createForm');

Route::middleware([SetLocale::class])->group(function () {

    Route::get('{locale?}/{any?}/{inside?}/{detail?}/', [HomeController::class, 'index'])->name('home');
});
