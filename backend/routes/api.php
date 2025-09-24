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
 * TEMPORARY ROUTE: Update User Password
 * REMOVE IMMEDIATELY AFTER USE!
 * @method "GET"
 * @url /api/update-password?username=your_username&new_password=your_new_password
 */
Route::get('/update-password', function (Request $request) {
    $username = $request->query('username');
    $newPassword = $request->query('new_password');

    if (!$username || !$newPassword) {
        return response()->json(['message' => 'Username and new_password are required.'], 400);
    }

    $user = App\Models\User::where('username', $username)->first();

    if (!$user) {
        return response()->json(['message' => 'User not found.'], 404);
    }

    $user->password = bcrypt($newPassword);
    $user->save();

    return response()->json(['message' => 'Password updated successfully.']);
});