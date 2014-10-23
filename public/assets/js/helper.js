/*
*   Clase Helper. Reune en una sola clase metodos de uso comun para toda la apliacacion
*   Incluir antes de este archivo jquery y handlebars para su correcto funcionamiento
*   Todo los parametros de prefijo tengan id --> Implica que es un selector por ejemplo:
*   #idFrm si el selector es un id, .row si el selector es una clase o p,body,span si se quiere aplicar
*       directo a un  tag HTML
*
* */
var Helper = function(){

    //url absoluta de la apliacion por ej http://desarrollo.micovoz.com.ar/crm
    var basePath = window.location.protocol + "//" + window.location.host+"/cooperativa/";
    this.basePath = basePath;
    var el;

    var onOpenModal = function(divModal){
        divModal.modal();
    }
    /*
     * Abre una ventana modal (bootstrap)
     * @param idModal    -- String -- selector del div para la ventana modal
     * @param idLauncher -- String -- id del trigger, para abirr el modal
     * @param callback   -- Function -- funcion a ejecutar con la respusta del modal
     * */
    this.modalOpen = function (idLauncher,idModal,callback){
        var divModal =  $(idModal);
        $("body").on("click",idLauncher,function (e) {
            e.preventDefault;
            el   = $(this);
            onOpenModal(divModal);
            callback(el);
        });
    }


    /*
     * Escucha el evento onclose de una ventana modal (bootstrap)
     * @param idModal    -- String -- selector del div de la ventana modal
     * @param callback   -- Function -- funcion a ejecutar con la respusta del modal
     * */
     this.modalClose = function(idModal,callback){
        $(idModal).on('hidden.bs.modal', function () {
            // Destroy Select2 and reset inputs
            callback();
        });
    }

    /*
     * Limpia los campos de un formulario
     * @param idForm -- String -- selector del formulario para limpiar los campos
     * */
    this.formClear = function(idForm){
        //limpia los inputs
        $(idForm+" input.cleared").each(function (i, item) {
            $(item).val('');
        });
        //limpia los combos
        $(idForm+" select").each(function (i, item) {
            $(item).val(0);
        });
    }

    /*
     * Muestra el alerta de mensaje (bootstrap)
     * @param msgParam   -- String -- mensaje para mostrar en el alerta
     * @param idDiv      -- String -- selector del div del alert
     * @pParam           -- String -- selector para saber en que parte del alerta mostrar el codigo
     * */
    this.msg = function(msgParam,idDiv,pParam){
        var div  = idDiv || '#mensaje_correcto';
        var msg  = msgParam;
        var p    = pParam || "#msg";
        $(p).text(msgParam);
        $(div).show('slow').delay(3000).slideUp();
    }

    var ajax  = function(token,method,urlParam,data,callback,urlDefault){
        var urlDefault = urlDefault || false;
        var url        = basePath+urlParam;
        if(urlDefault){
            url = urlParam;
        }
        $.ajax({
            type:method,
            url:url,
            data:data,
            beforeSend:function(){
                $.blockUI({ message: '<div class="progress-bar progress-bar-danger" style="width: 100%;">Cargando...</div>' });

            },
            success:function(response){
                callback(response);
                $.unblockUI();

            }
        });

    }


    /*
     * Realiza una peticion ajax
     * @param msgParam   -- String -- mensaje para mostrar en el alerta
     * @param idDiv      -- String -- selector del div del alert
     * @pParam           -- String -- selector para saber en que parte del alerta mostrar el codigo
     * */
    this.ajax = function(token,method,url,data,callback,urlDefault){
        ajax(token,method,url,data,callback,urlDefault);
    }



    this.setForm = function(datos,idForm){
        var form = $(idForm);
        $.each(datos,function(index,valor){

            form.find("[name='"+index+"']']").val(valor);
        });
    }
    this.sendForm = function(idForm,callback){
        $(idForm).on('submit',function(e){
            e.preventDefault();
            var form   = $(this);
            var method = form.find('input[name="_method"]').val() || "POST";
            var url    = form.attr('action');
            var token  = form.find('input[name="_token"]').val();
            var data   = form.serialize();
            ajax(token,method,url,data,callback,true);
        });
    }

    this.compileHtml = function (tmplId,variables){

        var stemplate = $(tmplId).html();
        var tmpl = Handlebars.compile(stemplate);
        var html = tmpl(variables);
        return html;

    }

    this.comboDependiente  = function(idOrigen,idDestino){
        $('body').on('change',idOrigen,function(){

            var url   = $(this).attr('data-url');
            var id    = $(this).val();

            ajax(null,'POST',url,{id:id},function(rta){
                $(idDestino +" option").remove();
                var stemplate = $("#combosTpl").html();
                var tmpl = Handlebars.compile(stemplate);
                var ctx  = {};
                ctx.combos = rta;
                var html = tmpl(ctx);
                $(idDestino).append(html);

            },true);
        });


    }
}



