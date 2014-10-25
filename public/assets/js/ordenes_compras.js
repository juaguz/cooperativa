/**
 * Created by juan on 19/10/14.
 */
(function(){
    var utils = new Helper();

    utils.modalOpen(".generar_orden_venta","#modalOrdenVenta",function(e){
        var idOrden = e.attr("data-id");
        utils.ajax(null,'get','ordenes/compras/getOrden',{'id_orden':idOrden},function(html){
            $("#cuerpoCompra").html(html);
        })
    });
})();
