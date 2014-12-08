(function(){
    var utils = new Helper();
    $(".imprimir_comprobante").click(function(event){
        var url = $(this).attr('data-url');
        $.ajax({
            url:url,
            beforeSend:function(){
                $.blockUI({ message: '<div class="progress-bar progress-bar-danger" style="width: 100%;">Imprimiendo...</div>' });
            },
            success:function(){
                $.unblockUI();
            }
        })


    });



})();
