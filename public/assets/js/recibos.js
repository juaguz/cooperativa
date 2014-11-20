/**
 * Created by juan on 19/10/14.
 */
(function(){
    var utils = new Helper();

    utils.modalOpen(".generar_recibo","#modalRecibo",function(e){
        var idRecibo= e.attr("data-id");
        utils.ajax(null,'get','recibos/getRecibo',{'id_recibo':idRecibo},function(html){
            $("#cuerpoRecibo").html(html);
        })
    });
})();
/**
 * Created by juan on 20/11/14.
 */
