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
Route::get('logout', 'AuthController@logout');


// Validamos los datos de inicio de sesión.
Route::post('login', 'AuthController@postLogin');


Route::group(array('before' => 'auth'), function () {

        Route::resource("usuarios", "UsuariosController");
        Route::resource("inicio", "SociosController");
        Route::resource("socios", "SociosController");
        Route::resource("cocheria/facturas","FacturasController");
        Route::get("cocheria/facturas/exportar/excel",array("uses"=>"FacturasController@exportarExcel","as"=>"cocheria.facturas.exportar.excel"));

        Route::get("socios/buscar/{slug?}",["as"=>"socios.buscar","uses"=>"SociosController@buscar"]);

        //Familiares//

        Route::get("familiares/create/{id_socio}",array("uses"=>"FamiliaresController@create","as"=>"familiares.create"));

        Route::get("familiares/{id_familiar}",array("uses"=>"FamiliaresController@edit","as"=>"familiares.edit"));

        Route::get("familiares",array("uses"=>"FamiliaresController@index","as"=>"familiares.index"));

        Route::get("familiares/exportar/excel",array("uses"=>"FamiliaresController@exportarExcel","as"=>"familiares.exportar.excel"));

        Route::post("familiares/{id_socio}",array("uses"=>"FamiliaresController@store","as"=>"familiares.store"));


        Route::post("socios/familiares",array("uses"=>"FamiliaresController@getFamiliaresSocio","as"=>"getFamiliaresSocios"));

        Route::patch("familiares/{id_socio}",array("uses"=>"FamiliaresController@update","as"=>"familiares.update"));



        //Fin Familiares//



});



//Route::get('usuarios/dni', array('uses' => 'UsuariosController@validarDni'));


