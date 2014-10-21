/**
 * Created by juan on 19/10/14.
 */
(function(){
    var utils = new Helper();

    utils.modalOpen(".generar_orden","#modalPrestamos",function(e){
        var idPrestamo = e.attr("data-id");
        utils.ajax(null,'get','prestamos/getOrden',{'id_prestamo':idPrestamo},function(html){
            $("#cuerpo").html(html);
        })
    });
})();
