<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('Page.index');
});
Route::get('index','AdminController@getindex');
Route::get('lichcongtac','AdminController@getlichcongtac');
Route::get('tuancongtac','AdminController@gettuancongtac');
Route::get('thanhphan/{id}','AdminController@getthanhphan');
Route::get('themcongtactuan/{id}','AdminController@themcongtactuan');

Route::post('addlichcongtac','AdminController@addlichcongtac');
Route::get('themtuan/{id}','AdminController@themtuan');

Route::get('dialog','AdminController@dialog');


Route::get('test','AdminController@gettest');


Route::get('themgiangvien','AdminController@addgiangvien');
Route::get('addgv/{id}','AdminController@addgv');



//điểm danh
Route::get('diemdanh', 'AdminController@viewdiemdanh')->name('diemdanh');
Route::get('danhsachdiemdanh/{id}','AdminController@getdanhsachdiemdanh');
Route::post('post','AdminController@postdiemdanh')->name('attendence_post');

