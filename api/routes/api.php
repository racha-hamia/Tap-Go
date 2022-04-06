<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RestaurantController;
use App\Http\Controllers\MenuController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/register',[UserController::class ,'create']);
Route::get('/users', [UserController::class, 'index']);

Route::post('/auth',[LoginController::class ,'authentification']);

Route::get('/restaurants', [RestaurantController::class, 'index']);
Route::post('/restaurant', [RestaurantController::class, 'create']);
Route::put('/restaurant/{id}', [RestaurantController::class, 'edit']);
Route::delete('/restaurant/{id}', [RestaurantController::class, 'destroy']);

Route::post('/restaurant/{id}/menu', [MenuController::class, 'create']);
Route::get('/restaurant/{id}/menus', [MenuController::class, 'index']);
Route::put('/restaurant/{restaurant_id}/menu/{menu_id}', [MenuController::class, 'edit']);
Route::delete('/restaurant/{restaurant_id}/menu/{menu_id}', [MenuController::class, 'destroy']);

