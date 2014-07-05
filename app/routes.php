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

// Nos mostrará el formulario de login.
Route::get('/', 'AuthController@showLogin');

Route::get('login', 'AuthController@showLogin');


// Validamos los datos de inicio de sesión.
Route::post('login', 'AuthController@postLogin');


Route::group(array('before' => 'auth'), function () {





    Route::get("usuarios/clave", array('as' => 'usuarios.clave', 'uses' => 'UsuariosController@getCambiarClave'));

    Route::post("usuarios/clave", array('as' => 'usuarios.clave', 'uses' => 'UsuariosController@postCambiarClave'));

    Route::resource('oficios','OficiosController');

    Route::get('oficios/busqueda',array('as'=>'oficios.buscar','uses'=>'OficiosController@index'));




//Permisos para el usuario supervisor, solo el puede editar y para el accesso a la administracion del sistema


    Route::group(array('before' => 'role:1,inicio'), function () {

        Route::resource("admin", "AdminController");
        Route::resource("usuarios", "UsuariosController");
        Route::resource("panel","AdminController");
        Route::resource("mails","CorreosController");



        Route::resource("solicitud_paradero", "OficioSolicitudParaderoController",array('except' => array('show','create')));

        Route::resource("secuestro_elementos", "SecuestroElementosController",array('except' => array('show','create')));

        Route::resource("secuestro_vehicular", "PedidosSecuestroVehicularController",array('except' => array('show','create')));

        Route::resource("prohibicion_salida", "ProhibicionSalidaPaisController",array('except' => array('show','create')));

        Route::resource("pedidos_captura", "PedidosCapturaController",array('except' => array('show','create')));

        Route::resource("medidas_restrictivas", "MedidasRestrictivasController",array('except' => array('show','create')));

        Route::resource("solicitud_paradero_req_jud", "SolicitudParaderoReqJudController",array('except' => array('show','create')));

        Route::resource("habeas_corpus", "HabeasCorpusController",array('except' => array('show','create')));

    });

    //Permisos para el usuario supervisor y de carga, permisos para create (formulario de carga) y store (guardar el formulario en la bbdd)

        Route::get('/', 'OficiosController@inicio');
        Route::get('inicio',array("as"=>"inicio","uses"=>'OficiosController@inicio'));



    Route::group(array('before' => 'role:1-3,inicio'), function () {

        Route::post("oficios/cesar",array('as'=>'oficios.cesar','uses'=>'OficiosController@cesar'));

        Route::resource("solicitud_paradero", "OficioSolicitudParaderoController",array('only' => array('create','store')));

        Route::resource("secuestro_elementos", "SecuestroElementosController",array('only' => array('create','store')));

        Route::resource("secuestro_vehicular", "PedidosSecuestroVehicularController",array('only' => array('create','store')));

        Route::resource("prohibicion_salida", "ProhibicionSalidaPaisController",array('only' => array('create','store')));

        Route::resource("pedidos_captura", "PedidosCapturaController",array('only' => array('create','store')));

        Route::resource("medidas_restrictivas", "MedidasRestrictivasController",array('only' => array('create','store')));

        Route::resource("solicitud_paradero_req_jud", "SolicitudParaderoReqJudController",array('only' => array('create','store')));

        Route::resource("habeas_corpus", "HabeasCorpusController",array('only' => array('create','store')));

        Route::post("oficios/localidad",array("as"=>"combo.localidad","uses"=>"CombosController@getLocalidad"));

        Route::post("oficios/partido",array("as"=>"combo.partido","uses"=>"CombosController@getPartido"));

        Route::get("oficios/confirmar/{id}",array("as"=>"oficios.confirmar","uses"=>"OficiosController@ConfirmarOficio"));

        Route::get("oficios/seguimiento/{id}",array("as"=>"oficios.log","uses"=>"OficiosController@getLog"));

        Route::post("oficios/buscar_dni",array("as"=>"oficios.buscar.dni","uses"=>"OficiosController@tieneOficio"));






    });


    //Permisos para el usuario supervisor , de carga y de consulta,permisos para show(ver el oficio en la web) y pdf para descargar el pdf del mismo

    Route::group(array('before' => 'role:1-2-3,inicio'), function () {
        
        Route::resource("solicitud_paradero", "OficioSolicitudParaderoController",array('only' => array('show')));


        
        Route::resource("secuestro_elementos", "SecuestroElementosController",array('only' => array('show')));

        Route::resource("secuestro_vehicular", "PedidosSecuestroVehicularController",array('only' => array('show')));

        Route::resource("prohibicion_salida", "ProhibicionSalidaPaisController",array('only' => array('show')));

        Route::resource("pedidos_captura", "PedidosCapturaController",array('only' => array('show')));

        Route::resource("medidas_restrictivas", "MedidasRestrictivasController",array('only' => array('show')));

        Route::resource("solicitud_paradero_req_jud", "SolicitudParaderoReqJudController",array('only' => array('show')));

        Route::resource("habeas_corpus", "HabeasCorpusController",array('only' => array('show')));

        Route::get('medidas_restrictivas/pdf/{id}',array('as'=>'medidas_restrictivas.pdf','uses'=>'MedidasRestrictivasController@getPdf'));

        Route::get('pedidos_captura/pdf/{id}',array('as'=>'pedidos_captura.pdf','uses'=>'PedidosCapturaController@getPdf'));

        Route::get('habeas_corpus/pdf/{id}',array('as'=>'habeas_corpus.pdf','uses'=>'HabeasCorpusController@getPdf'));

        Route::get('solicitud_paradero/pdf/{id}',array('as'=>'solicitud_paradero.pdf','uses'=>'OficioSolicitudParaderoController@getPdf'));

        Route::get('solicitud_paradero_req_jud/pdf/{id}',array('as'=>'solicitud_paradero_req_jud.pdf','uses'=>'SolicitudParaderoReqJudController@getPdf'));

        Route::get('prohibicion_salida/pdf/{id}',array('as'=>'prohibicion_salida.pdf','uses'=>'ProhibicionSalidaPaisController@getPdf'));

        Route::get('secuestro_elementos/pdf/{id}',array('as'=>'secuestro_elementos.pdf','uses'=>'SecuestroElementosController@getPdf'));

        Route::get('secuestro_vehicular/pdf/{id}',array('as'=>'secuestro_vehicular.pdf','uses'=>'PedidosSecuestroVehicularController@getPdf'));

        Route::post('oficios',array('as'=>'oficios.buscar','uses'=>'OficiosController@filtrar'));

        Route::get('no/leidos',array('as'=>'oficios.no_leidos','uses'=>'OficiosController@getCantidadOficiosNoVistos'));

        Route::resource("consultas", "OficiosConsultaController");
    });

    Route::get('logout', 'AuthController@logOut');
});


Event::listen('404', function () {
    return Response::error('404');
});



//Route::get('usuarios/dni', array('uses' => 'UsuariosController@validarDni'));


