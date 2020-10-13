<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', 'LandingController@index');

Route::get('/cart', 'LandingController@cart')
    ->name('cart');

Route::get('/my_orders', 'LandingController@my_orders')
    ->name('my_orders');

Route::get('/my_order_details/{order_id}', 'LandingController@my_order_details')
    ->name('my_order_details');



Auth::routes();

Route::get('/home', 'HomeController@index')
    ->name('home');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
