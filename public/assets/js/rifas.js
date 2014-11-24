$(function(){
    var utils = new Helper();

    utils.modalOpen(".cuotas_rifas","#modalRifas",function(el){
        $("#myModalLabel").html("Cuotas");
        var url = el.attr("data-url");
        var idRifaSocio = el.attr("data-id_rifa_socio");
        utils.ajax(null,'post',url,{'id_rifa_socio':idRifaSocio},function(html){
            $("#rifasModalBody").html(html);
        },true);
    });

    utils.modalClose("#modalRifas",function(){
        $("#rifasModalBody").html("");
    });

    $("#guardarCuotasRifas").click(function(event){
        event.preventDefault();
        var formulario  = $("#formCuotasRifas");
        var url         = formulario.attr("action");
        var method      = formulario.attr("method");
        var data        = formulario.serialize();
        utils.ajax(null,method,url,data,function(data){
            if(data.success){
                $("#mensajeCorrecto").show();
                $('html, body,#modalRifas').animate({ scrollTop: 0 }, 0)
            }
        },true)

    });

        $("#guardarNumero").click(function(event){
            event.preventDefault();
            var ganador = $("#nroGanador").val();
            var url = $(this).attr("data-url");
            if(ganador.length>0){
                utils.ajax(null,'get',url,{ganador:ganador},function(data){
                    console.log(data);
                    if(data.success){

                        buscar(ganador);
                        utils.onOpenModal("#modalRifas");
                    }
                },true);
            }else{
                $("#myModalLabel").html("No se Especifico Nro Ganador");
                $("#rifasModalBody").html("<center>Por Favor Indique un numero</center>");
                utils.onOpenModal("#modalRifas");
            }

        });

    function buscar(nro) {
        var url =$("#buscar").attr("data-url");
        $('html, body,#modalRifas').animate({scrollTop: 0}, 0)
        if (nro.length > 0) {
            $("#myModalLabel").html("Buscar nro:" + nro);

            utils.ajax(null, "get", url, {nro: nro}, function (data) {
                console.log(data.success);
                if (data.success) {
                    var socio = data.respuesta.socio;
                    $("#rifasModalBody").html("<b><center>El Dueño de este Numero es: " + socio.nombre + " " +
                    socio.apellido + " legajo: " + socio.nro_legajo + "</center></b>");

                } else {
                    $("#rifasModalBody").html(data.respuesta);
                }
            }, true)

        } else {
            $("#myModalLabel").html("No se Especifico Nro de Busqueda");
            $("#rifasModalBody").html("<center>Por Favor Indique un numero</center>");

        }
    }
    function buscarModal(selector){

    utils.modalOpen("#buscar","#modalRifas",function(el){
        var nro = $(selector).val();
        buscar(nro);
    });
    }

    utils.modalOpen("#buscarNumeroGanador","#modalRifas",function(el){
        var nro = $("#nroGanador").val();
        buscar(nro);
    });

    buscarModal("#nroBuscar");

});