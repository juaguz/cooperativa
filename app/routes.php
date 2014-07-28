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
        Route::resource("socios", "SociosController");
        Route::get("familiares/create/{id_socio}",array("uses"=>"FamiliaresController@create","as"=>"familiares.create"));
        Route::get("familiares/{id_familiar}",array("uses"=>"FamiliaresController@edit","as"=>"familiares.edit"));
        Route::post("familiares/{id_socio}",array("uses"=>"FamiliaresController@store","as"=>"familiares.store"));
        Route::patch("familiares/{id_socio}",array("uses"=>"FamiliaresController@update","as"=>"familiares.update"));
        Route::get("socios/buscar/{slug?}",["as"=>"socios.buscar","uses"=>"SociosController@buscar"]);


//});



//Route::get('usuarios/dni', array('uses' => 'UsuariosController@validarDni'));


