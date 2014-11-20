/**
 * Created by juan on 19/10/14.
 */
(function(){
    var utils = new Helper();

    utils.modalOpen(".generar_bono","#modalBono",function(e){
        var idBono = e.attr("data-id");
        utils.ajax(null,'get','bonos/getBono',{'id_bono':idBono},function(html){
            $("#cuerpoBono").html(html);
        })
    });
})();
