<script src="http://173.10.1.149:3000/socket.io/socket.io.js"></script>

<!-- javascript
================================================== -->
{{ HTML::script('assets/js/jquery.js') }}

<!-- Bootstrap -->
<!-- <script src="bootstrap/js/bootstrap.min.js"></script> -->
{{ HTML::script('bootstrap/bootstrap/js/bootstrap.min.js') }}
<!-- Modernizr -->
<!-- <script src='js/modernizr.min.js'></script> -->
{{ HTML::script('bootstrap/js/modernizr.min.js') }}

{{ HTML::script('bootstrap/js/bootstrap-datepicker.min.js') }}

{{ HTML::script('bootstrap/js/bootstrap-timepicker.min.js') }}

{{ HTML::script('bootstrap/js/jquery.gritter.min.js') }}

<!-- Gritter -->




{{ HTML::script('bootstrap/js/modernizr.min.js') }}

<!-- Pace -->
<!-- <script src='js/pace.min.js'></script> -->
{{ HTML::script('bootstrap/js/pace.min.js') }}
<!-- Popup Overlay -->
<!-- <script src='js/jquery.popupoverlay.min.js'></script> -->
{{ HTML::script('bootstrap/js/jquery.popupoverlay.min.js') }}
<!-- <script src='js/jquery.slimscroll.min.js'></script>-->
{{ HTML::script('bootstrap/js/jquery.slimscroll.min.js') }}
<!-- Cookie -->
<!-- <script src='js/jquery.cookie.min.js'></script>-->
{{ HTML::script('bootstrap/js/jquery.cookie.min.js') }}
<!-- Endless -->
<!-- <script src="js/endless/endless.js"></script>-->
{{ HTML::script('bootstrap/js/endless/endless.js') }}





<script src="http://173.10.1.149:3000/socket.io/socket.io.js"></script>


{{ HTML::script('assets/js/notificaciones.js') }}
<!-- Datepicker -->



<script>

    $(function () {

        var socket = io('http://173.10.1.149:3000');

        $(".agregar_foto").click(function (event) {
            event.preventDefault();
            var contenedor = $(this).attr('data-contenedor');
            var receptor = $(this).attr('data-receptor');
            $(contenedor).clone().appendTo(receptor);
        });

        $(".provincia").change(function(){setPartido(this)});
        $(".partido").change(function(){setLocalidad(this)});
        getCantidadOficios();

        socket.on('oficio_nuevo', function (data) {
            var jdata = {mensaje:"Un Oficio Nuevo fue cargado",ruta:data.id_oficio};
            console.log(jdata);
            notificaciones(jdata);
            getCantidadOficios();

        });
        socket.on('oficio_cesado', function (data) {
            var jdata = {mensaje:"Oficio Sin Efecto",ruta:data.id_oficio};
            notificaciones(jdata);
        });
//        $('.time').ptTimeSelect({
//            hoursLabel: 'Horas',
//            minutesLabel: 'Minutos',
//            setButtonLabel: 'OK'
//        });
        $('.fecha').datepicker({
            "language":'es'
        });
        $('.time').timepicker({
            minuteStep: 5,
            showInputs: false,
            disableFocus: true
            }
        );
        $('.buscar_dni').focusout(function(){
            var dni  = $(this).val();
            $.ajax({
               type:'POST',
               url:'{{ route("oficios.buscar.dni") }}',
               data:'dni='+dni,
               success:function(html){
                  console.log(html);
               }
            });


        });




        @yield('jquery');
    });

    function getCantidadOficios(){
        $.ajax({
            'url':'{{route("oficios.no_leidos")}}',
            success:function(cantidad){
                $(".cantidad_no_leidos").html(cantidad);
            }
        });
    }

    function setPartido(el) {
        var target = $(el).attr("data-target");
        var id_provincia = $(el).val();

        $.ajax({
            type: "POST",
            data: "id_provincia=" + id_provincia,
            url: "{{ route('combo.partido') }}",
            success: function (sOptions) {
                append(sOptions,target);
                $(target).val($(target).attr('data-value'));

                var subTarget   = $(target).attr('data-target');
                $(subTarget).children("option").remove();

            }
        });
    }
    function setLocalidad(el,idSelected) {
        var target = $(el).attr("data-target");
        var id_partido = $(el).attr('data-value');

        $.ajax({
            type: "POST",
            data: "id_partido=" + id_partido,
            url: "{{ route('combo.localidad') }}",
            success: function (sOptions) {
                append(sOptions,target);
                $(target).val($(target).attr('data-value'));
            }
        });

    }
    function append(sOptions,target){
        $(target).children("option").remove();
        $.each(sOptions, function(key, val) {

            $(target).append('<option value="'+key+'">' + val + '</option>');

        });
    }



    function notificacionWeb(mensaje){

        $.gritter.add({
            title: '<i class="fa fa-info-circle"></i> Nuevo Requerimiento Judicial',
            text: mensaje,
            sticky: false,
            time: '',
            class_name: 'gritter-info'
        });
        // You can have it return a unique id, this can be used to manually remove it later using
        /*
         setTimeout(function(){

         $.gritter.remove(unique_id, {
         fade: true,
         speed: 'slow'
         });

         }, 6000)
         */

        return false;
    }
</script>

@if (Session::has('id'))
<script>
    var socket = io('http://173.10.1.149:3000');
    socket.emit('oficio_cargado', {id_oficio: "{{ Session::get('id') }}" });
</script>
{{ Session::forget('id'); }}

@endif




@yield('scripts')