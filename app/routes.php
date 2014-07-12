<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/


//hola hola hola hgjh
// Nos mostrará el formulario de login.
Route::get('/', 'AuthController@showLogin');

Route::get('login', 'AuthController@showLogin');


// Validamos los datos de inicio de sesión.
Route::post('login', 'AuthController@postLogin');


//Route::group(array('before' => 'auth'), function () {

        Route::resource("usuarios", "UsuariosController");

//});



//Route::get('usuarios/dni', array('uses' => 'UsuariosController@validarDni'));


