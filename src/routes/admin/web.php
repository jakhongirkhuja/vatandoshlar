<?php


use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\LangController;
use App\Http\Controllers\Admin\MenuController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\FileManagerController;
use App\Http\Controllers\Admin\ContentController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\MenuMainController;
use App\Http\Controllers\Admin\Auth\AuthController;
use App\Http\Controllers\Admin\SocialLinkController;
use App\Http\Controllers\Admin\PageSectionController;
use App\Http\Controllers\Admin\ContentSettingController;
use App\Http\Controllers\Admin\MenuMainSettingsController;

Route::middleware('auth')->prefix('admin')->group(function () {
    Route::get('', [AdminController::class, 'index'])->name('admin.index');
    Route::any('file-manager', [FileManagerController::class, 'handleRequest'])->name('admin.file-manager');

    Route::middleware('admin')->group(function () {
        Route::get('menu', [MenuController::class, 'index'])->name('admin.menu');
        Route::get('settings', [SettingController::class, 'settings'])->name('admin.settings');
        Route::post('settings/create', [SettingController::class, 'settingscreate'])->name('admin.settings.create');
        Route::get('logout', [AuthController::class, 'logout'])->name('logout');
        Route::delete('delete/{section_id}', [PageSectionController::class, 'deleteSelection'])->name('pages.delete');
        Route::prefix('menu-main')->name('admin.menu_main.')->group(function () {
            Route::get('', [MenuMainController::class, 'index'])->name('index');
            Route::get('create', [MenuMainController::class, 'create'])->name('create');
            Route::get('edit/{id}', [MenuMainController::class, 'edit'])->name('edit');
            Route::post('update-sort/{id}', [MenuMainController::class, 'updateSort'])->name('update-sort');
            Route::post('update-sort', [MenuMainController::class, 'updateSortMenu'])->name('update-sort-menu');
            Route::post('store', [MenuMainController::class, 'store'])->name('store');
            Route::put('update/{id}', [MenuMainController::class, 'update'])->name('update');
            Route::get('settings', [MenuMainSettingsController::class, 'index'])->name('settings');
            Route::post('settings/create', [MenuMainSettingsController::class, 'create'])->name('settings.create');
            Route::delete('delete/menu/{id}', [MenuMainController::class, 'delete'])->name('delete');
        });


        Route::prefix('users')->group(function () {
            Route::get('', [UserController::class, 'users'])->name('admin.users');
            Route::post('', [UserController::class, 'usersCreate'])->name('admin.users.create');
            Route::get('create', [UserController::class, 'usersCreateView'])->name('admin.users.create.view');
            Route::get('{user}', [UserController::class, 'usersEdit'])->name('admin.users.edit');
            Route::put('{user}', [UserController::class, 'usersUpdate'])->name('admin.users.update');
            Route::delete('{user}', [UserController::class, 'usersDelete'])->name('admin.users.delete');
        });
        Route::prefix('roles')->group(function () {
            Route::get('', [RoleController::class, 'roles'])->name('admin.roles');
            Route::post('', [RoleController::class, 'rolesCreate'])->name('admin.roles.create');
            Route::get('create', [RoleController::class, 'rolesCreateView'])->name('admin.roles.create.view');
            Route::get('{role}', [RoleController::class, 'rolesEdit'])->name('admin.roles.edit');
            Route::put('{role}', [RoleController::class, 'rolesUpdate'])->name('admin.roles.update');
            Route::delete('{roles}', [RoleController::class, 'delete'])->name('admin.roles.delete');
        });
        Route::resource('langs', LangController::class);
        Route::get('langs-status/{id}', [LangController::class, 'lang_status'])->name('admin.langs.status');


        Route::prefix('pages/{slug}/section/{id}')->name('admin.pages.section.')->controller(PageSectionController::class)->group(function () {
            Route::get('/items/{parent_id?}/{category_slug?}', 'index')->name('index');
            Route::post('/update-sort/{section_id}', 'updateSort')->name('update-sort');
            Route::get('/update-status/{section_id}', 'updateStatus')->name('update-status');
            Route::get('/create/{parent_id?}/{category_slug?}', 'createSection')->name('create');
            Route::post('/store/{parent_id?}/{category_slug?}', 'storeSection')->name('store');
            Route::get('/edit/{section_id}/{parent_id?}/{category_slug?}', 'editSection')->name('edit');
            Route::put('/update/{section_id}', 'updateSection')->name('update');
            Route::get('/settings/{parent_id?}/{category_slug?}', 'create')->name('settings.create');
            Route::post('/settings-store/{parent_id?}/{category_slug?}', 'storeSettings')->name('settings.store');
        });
    });
    Route::resource('social_links', SocialLinkController::class);
    Route::prefix('content-main')->name('admin.content.')->group(function () {
        Route::get('', [ContentController::class, 'index'])->name('index');
        Route::get('create', [ContentController::class, 'create'])->name('create');
        Route::get('edit/{id}', [ContentController::class, 'edit'])->name('edit');
        Route::post('update-sort/{id}', [ContentController::class, 'updateSort'])->name('update-sort');

        Route::post('store', [ContentController::class, 'store'])->name('store');
        Route::put('update/{id}', [ContentController::class, 'update'])->name('update');
        Route::get('settings', [ContentSettingController::class, 'index'])->name('settings');
        Route::post('settings/create', [ContentSettingController::class, 'create'])->name('settings.create');
        Route::delete('delete/{id}', [ContentController::class, 'delete'])->name('delete');
    });
    Route::post('image-delete', [MenuMainController::class, 'imageDelete'])->name('admin.menu_main.imageDelete');
});
