$(function(){
    var utils = new Helper();

    utils.modalOpen(".cuotas_rifas","#modalRifas",function(el){
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


});