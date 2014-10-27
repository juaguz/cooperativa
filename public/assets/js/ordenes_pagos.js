(function(){
    var utils = new Helper();

    utils.modalOpen(".generar_orden","#modalOrden",function(el){
           var url = el.attr("data-url");
           var method  = "POST";
           utils.ajax(null,method,url,null,function(respuesta){
               $("#modalOrdenBody").html(respuesta);
           },true)
    });

    utils.modalClose("#modalOrden",function(){
        $("#modalOrdenBody").html("");
    });


})();