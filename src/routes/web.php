<?php

use App\Http\Middleware\SetLocale;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\Admin\SupportController;
use App\Http\Controllers\Admin\Auth\AuthController;
use App\Http\Controllers\Admin\SearchController;
use App\Http\Middleware\CheckSiteStatus;
Route::get('login', [AuthController::class, 'login'])->name('login');
Route::post('loginForm', [AuthController::class, 'loginForm'])->name('loginForm');
Route::get('reload-captcha', [AuthController::class, 'captch'])->name('reload.captcha');
Route::middleware(CheckSiteStatus::class)->group(function () {
    Route::post('support', [SupportController::class, 'createForm'])->name('support.createForm');
    Route::get('support/create', [SupportController::class, 'createApp'])->name('support.createApp');
    Route::post('support/create', [SupportController::class, 'create'])->name('support.create');
    Route::get('participation', [SupportController::class, 'participation'])->name('participation');
    Route::post('participation/create', [SupportController::class, 'participate'])->name('participation.create');
    Route::middleware([SetLocale::class])->group(function () {
        Route::get('{locale?}/search', [SearchController::class, 'search'])->name('search');
        Route::get('{locale?}/{any?}/{inside?}/{detail?}/', [HomeController::class, 'index'])->name('home');
    });
});


