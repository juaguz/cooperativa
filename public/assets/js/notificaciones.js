/**
 * Created by juan on 07/06/14.
 */
function notificaciones(data) {
    if (Notification) {
        if (Notification.permission !== "granted") {
            Notification.requestPermission()
        }
        console.log(data.mensaje);
        var title = "Sistema Integrado de Requerimientos Judiciales";
        var extra = {
            icon: "http://173.10.1.149/oficios/assets/js/aviso.png",
            body: data.mensaje
        }
        var noti = new Notification( title, extra);
        noti.onclick =function(){
            window.location.assign(data.ruta);

        }



        noti.onclose = {
            // Al cerrar
        }
        setTimeout( function() { noti.close() }, 10000)
    }else{
        notificacionWeb(mensaje);
    }
}