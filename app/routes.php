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
use Carbon\Carbon;

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

        Route::get("prestamos/getOrden",["as"=>"prestamos.getOrden","uses"=>"PrestamosController@getOrdenPago"]);

        Route::get("ordenes/compras/getOrden","OrdenesComprasController@getOrdenCompra");

        Route::resource("prestamos", "PrestamosController");

        Route::resource("ordenes/compras","OrdenesComprasController");


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

        //Ventas//
        Route::resource("ventas","VentasController");
        Route::post("ventas/getTablaVenta",["as"=>"ventas.getTablaVentas","uses"=>"VentasController@getTablaVenta"]);
        Route::post("ventas/getTabla",["as"=>"ventas.getTabla","uses"=>"VentasController@getTabla"]);
        Route::post("ventas/actualizar",["as"=>"ventas.actualizar","uses"=>"VentasController@actualizar"]);

        //Servicios//
        Route::resource("servicios","ServiciosController");
        Route::post("servicios/getTablaServicio",["as"=>"servicios.getTablaServicios","uses"=>"ServiciosController@getTablaServicio"]);
        Route::post("servicios/getTabla",["as"=>"servicios.getTabla","uses"=>"ServiciosController@getTabla"]);
        Route::post("servicios/actualizar",["as"=>"servicios.actualizar","uses"=>"ServiciosController@actualizar"]);

        //Recibos
        Route::resource("recibos","RecibosController");
        Route::post("recibos/getTablaRecibos",["as"=>"recibos.getTablaRecibos","uses"=>"RecibosController@getTablaRecibos"]);
        Route::post("recibos/getTabla",["as"=>"recibos.getTabla","uses"=>"RecibosController@getTabla"]);
        Route::post("recibos/actualizar",["as"=>"recibos.actualizar","uses"=>"RecibosController@actualizar"]);
        Route::get("recibos/exportar/excel",array("uses"=>"RecibosController@exportarExcel","as"=>"recibos.exportar.excel"));

        //Rifas
        Route::get("rifas/vender/{id}",["uses"=>"RifasController@vender","as"=>"rifas.vender"]);
        Route::post("rifas/vender/{id}",["uses"=>"RifasController@saveVender","as"=>"rifas.venta"]);


});



//Route::get('usuarios/dni', array('uses' => 'UsuariosController@validarDni'));


