<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/**
 * route "/register"
 * @method "POST"
 */
Route::post('/register', App\Http\Controllers\Api\RegisterController::class)->name('register');

/**
 * route "/login"
 * @method "POST"
 */
Route::post('/login', App\Http\Controllers\Api\LoginController::class)->name('login');

/**
 * route "/dosen"
 * @method "GET"
 */
Route::get('/dosen', App\Http\Controllers\Api\DosenController::class . '@index')->name('dosen.index');

Route::get('/dosen/{id}', App\Http\Controllers\Api\DosenController::class . '@show')->name('dosen.index');

Route::put('/dosen/{id}', App\Http\Controllers\Api\DosenController::class . '@update')->name('dosen.update');

Route::delete('/dosen/{id}', App\Http\Controllers\Api\DosenController::class . '@destroy')->name('dosen.destroy');

Route::get('/jabatans', App\Http\Controllers\Api\JabatanController::class . '@index')->name('jabatans.index');

Route::get('/skills', App\Http\Controllers\Api\SkillController::class . '@index')->name('skills.index');

Route::post('/dosen', App\Http\Controllers\Api\DosenController::class . '@store')->name('dosen.store');

Route::get('/prodi', App\Http\Controllers\Api\ProdiController::class . '@index')->name('dosen.store');


/**
 * route "/user"
 * @method "GET"
 */
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

/**
 * route "/kerjasama"
 * @method "GET"
 */
Route::get('/kerjasama', App\Http\Controllers\Api\KerjasamaProdiController::class . '@index')->name('kerjasama.index');

/**
 * route "/riset"
 * @method "GET"
 */
Route::get('/riset', App\Http\Controllers\Api\RisetController::class . '@index')->name('riset.index');
