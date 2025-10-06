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
