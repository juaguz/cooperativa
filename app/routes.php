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
        Route::resource("comercios", "ComerciosController");
        Route::resource("rifas", "RifasController");
        Route::resource("cocheria/facturas","FacturasController");
        Route::resource("circulos", "CirculosController");
        Route::resource("prestamos","PrestamosController");

        Route::post("prestamos/getTabla",["as"=>"prestamos.getTabla","uses"=>"PrestamosController@getTabla"]);

        Route::post("circulos/getTabla",["as"=>"circulos.getTabla","uses"=>"CirculosController@getTabla"]);



        Route::post("prestamos/actualizar",["as"=>"prestamos.actualizar","uses"=>"PrestamosController@actualizar"]);

        Route::post("prestamos/getTablaPrestamo",["as"=>"prestamos.getTablaPrestamo","uses"=>"PrestamosController@getTablaPrestamo"]);

        Route::post("circulos/getTablaCirculo",["as"=>"circulos.getTablaCirculo","uses"=>"CirculosController@getTablaCirculo"]);

        Route::get("cocheria/facturas/exportar/excel",array("uses"=>"FacturasController@exportarExcel","as"=>"cocheria.facturas.exportar.excel"));

        Route::get("socios/buscar/{slug?}",["as"=>"socios.buscar","uses"=>"SociosController@buscar"]);
        Route::get("socios/exportar/excel",array("uses"=>"SociosController@exportarExcel","as"=>"socios.exportar.excel"));

        //Familiares//

        Route::get("familiares/create/{id_socio}",array("uses"=>"FamiliaresController@create","as"=>"familiares.create"));

        Route::get("familiares/{id_familiar}",array("uses"=>"FamiliaresController@edit","as"=>"familiares.edit"));

        Route::get("familiares",array("uses"=>"FamiliaresController@index","as"=>"familiares.index"));

        Route::get("familiares/exportar/excel",array("uses"=>"FamiliaresController@exportarExcel","as"=>"familiares.exportar.excel"));

        Route::post("familiares/{id_socio}",array("uses"=>"FamiliaresController@store","as"=>"familiares.store"));


        Route::post("socios/familiares",array("uses"=>"FamiliaresController@getFamiliaresSocio","as"=>"getFamiliaresSocios"));

        Route::patch("familiares/{id_socio}",array("uses"=>"FamiliaresController@update","as"=>"familiares.update"));

        Route::get("comercios/exportar/excel",array("uses"=>"ComerciosController@exportarExcel","as"=>"comercios.exportar.excel"));
        Route::get("rifas/exportar/excel",array("uses"=>"RifasController@exportarExcel","as"=>"rifas.exportar.excel"));
        Route::get("circulos/exportar/excel",array("uses"=>"CirculosController@exportarExcel","as"=>"circulos.exportar.excel"));



        //Fin Familiares//



});



//Route::get('usuarios/dni', array('uses' => 'UsuariosController@validarDni'));


