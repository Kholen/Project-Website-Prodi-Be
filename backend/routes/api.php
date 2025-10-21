<?php

use App\Http\Controllers\Api\BeritaController;
use App\Http\Controllers\Api\DosenController;
use App\Http\Controllers\Api\JabatanController;
use App\Http\Controllers\Api\KerjasamaProdiController;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\PengumumanController;
use App\Http\Controllers\Api\ProdiController;
use App\Http\Controllers\Api\RegisterController;
use App\Http\Controllers\Api\RisetController;
use App\Http\Controllers\Api\SkillController;
use App\Http\Controllers\Api\BeritaController;
use App\Http\Controllers\Api\SettingsController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/**
 * route "/register"
 * @method "POST"
 */
Route::post('/register', RegisterController::class)->name('register');

/**
 * route "/login"
 * @method "POST"
 */
Route::post('/login', LoginController::class)->name('login');

/**
 * route "/dosen"
 * @method "GET"
 */
Route::get('/dosen', [DosenController::class, 'index'])->name('dosen.index');
Route::get('/dosen/{id}', [DosenController::class, 'show'])->name('dosen.show');
Route::post('/dosen', [DosenController::class, 'store'])->name('dosen.store');
Route::put('/dosen/{dosen}', [DosenController::class, 'update'])->name('dosen.update');
Route::delete('/dosen/{id}', [DosenController::class, 'destroy'])->name('dosen.destroy');

Route::get('/jabatans', [JabatanController::class, 'index'])->name('jabatans.index');
Route::get('/skills', [SkillController::class, 'index'])->name('skills.index');
Route::get('/prodi', [ProdiController::class, 'index'])->name('prodi.index');


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
Route::get('/kerjasama', [KerjasamaProdiController::class, 'index'])->name('kerjasama.index');

/**
 * route "/riset"
 * @method "GET"
 */
Route::get('/riset', [RisetController::class, 'index'])->name('riset.index');
Route::get('/riset/{id}', [RisetController::class, 'show'])->name('riset.show');
Route::put('/riset/{id}', [RisetController::class, 'update'])->name('riset.update');
Route::post('/riset', [RisetController::class, 'store'])->name('riset.store');
Route::delete('/riset/{id}', [RisetController::class, 'destroy'])->name('riset.destroy');

/**
 * route "/berita"
 * @method "GET"
*/
Route::get('/berita', [BeritaController::class, 'index']);
Route::get('/berita/{berita:slug}', [BeritaController::class, 'show']);
Route::post('/berita', [BeritaController::class, 'store']);
Route::put('/berita/{berita:slug}', [BeritaController::class, 'update']);
Route::delete('/berita/{berita:slug}', [BeritaController::class, 'destroy']);

/**
 * route "/settings"
 * @method "GET"
*/
Route::get('/settings', [SettingsController::class, 'index']);
Route::post('/settings', [SettingsController::class, 'update']);
 
Route::get('/pengumuman', [PengumumanController::class, 'index']);
Route::get('/pengumuman/{pengumuman}', [PengumumanController::class, 'show']);
Route::post('/pengumuman', [PengumumanController::class, 'store']);
Route::put('/pengumuman/{pengumuman}', [PengumumanController::class, 'update']);
Route::delete('/pengumuman/{pengumuman}', [PengumumanController::class, 'destroy']);
