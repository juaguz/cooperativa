@extends ('header')


@section ('title') {{$action}} circulo @stop




@section ('content')
<div class="alert alert-success" style="display:none" id="mensajeCorrectoCirculo">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Socio Eliminado Correctamente</strong>
</div>


<h1>{{$action}} Círculo</h1>



{{ Form::model(isset($circulo) ? $circulo : null,$form_data, array('role' => 'form')) }}


<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('nombre', 'Nombre') }}
        {{ Form::text('nombre', null, array('placeholder' => 'Ingrese Nombre', 'class' => 'form-control','required'=>'required')) }}

    </div>
    <div class="form-group col-md-4">
        {{ Form::label('cantidad_socios', 'Cantidad de Socios') }}
        {{ Form::text('cantidad_socios', null, array('placeholder' => 'Ingrese Cantidad de Socios', 'class' => 'form-control solonumeros','required'=>'required')) }}
    </div>
</div>
<div class="row">
	<div class="form-group col-md-4">
        {{ Form::label('fecha_inicio', 'Fecha de Inicio') }}
        {{ Form::text('fecha_inicio', null, array('placeholder' => 'Ingrese Fecha de Inicio ', 'class' => 'form-control fecha','required'=>'required')) }}

	</div>

    <div class="form-group col-md-4">
        {{ Form::label('fecha_fin', 'Fecha de Fin') }}
        {{ Form::text('fecha_fin', null, array('placeholder' => 'Ingrese Fecha de Fin ', 'class' => 'form-control fecha','required'=>'required')) }}

	</div>
</div>
<div class="row">
	<div class="form-group col-md-4">
        {{ Form::label('importe', 'Monto del Círculo') }}
        {{ Form::text('importe', null, array('placeholder' => 'Ingrese Monto ', 'class' => 'form-control','required'=>'required')) }}

	</div>
    <div class="form-group col-md-4">

    </div>
 </div>

<div class="row">
    <div class="form-group col-md-4">
        <!--<select id="socios" class="form-control sociosCombo">
                <option value="0">Seleccione</option>
                <option value="1">Usuario1</option>
                <option value="2">Usuario2</option>
                <option value="3">Usuario3</option>


        </select>-->
        {{ Form::select('socios',$socios,null,['id'=>'socios','class'=>'form-control sociosCombo'])}}
    </div>
    <div class="form-group col-md-4">
        <button class="btn btn-primary" id="btnAgregar">Agregar Socio</button>
    </div>

</div>



<div class="row" id="resultado" style="">
    <div class="col-md-10">
        <table class="table" id="tablaSocios">
            <thead>
                <th>Socio</th>
                <th>Borrar</th>
            </thead>
            <tbody>
            @if(isset($sociosCirculo))
                @foreach($sociosCirculo as $socio)
                <tr id="socioTr{{$socio->socios->id}}">
                    <td>{{$socio->socios->apellido}} {{$socio->socios->nombre}} Nro Legajo: {{$socio->socios->nro_legajo}}</td>
                    <td><button type="button" class="btn btn-danger" onclick="borrar('{{$socio->socios->id}}','{{$circulo->id}}')"><i class="fa fa-trash-o"></i></button></td>
                </tr>
                @endforeach
            @endif
            </tbody>
        </table>
    </div>
</div>


<div class="row">
	
	<div class="form-group col-md-4">

		{{ Form::button('Guardar', array('type' => 'submit', 'class' => 'btn btn-primary','id'=>'id_guardar')) }}
	</div>
</div>
{{ Form::close() }}



@stop




@section('scripts')
{{ HTML::script('assets/js/jquery.jstepper.min.js') }}
<script>
    var sociosJson  = new Array();
    var utils       = new Helper();
    $(function(){

            $('.solonumeros').jStepper({minValue:0,minLength:1});
            var btnGuardar  = $("#btnGuardar");
            var frmCirculo = $("#circuloFrm");
            var idCirculo  = $("#id").val();
            var divResultado = $("#tablaResultado");

            $(".sociosCombo").select2({
                placeholder: "Seleccione un Socio",
                allowClear: true
            });

            $("#circuloFrm").submit(function(e){
                e.preventDefault();
                var formData = new FormData();
                var data = $(this).serializeArray();
                var url  = $(this).attr('action');


                $.each(data,function(key,obj){
                    formData.append(obj.name,obj.value);
                });

                //data.push({"socios":sociosJson.socios});
                formData.append("socios",sociosJson);
                console.log(formData);
                console.log(typeof(formData));
                $.ajax({
                   type:'POST',
                   url:url,
                   data:formData,
                   cache:false,
                   processData:false,
                   contentType:false,
                    beforeSend:function(){
                        $.blockUI({ message: '<div class="progress-bar progress-bar-danger" style="width: 100%;">Cargando...</div>' });

                   },
                    success:function(respuesta){
                        if(respuesta.success){
                            $.blockUI({ message: '<div class="progress-bar progress-bar-success" style="width: 100%;">Redirigiendo...</div>' });
                            window.location.assign(respuesta.ruta);
                        }


                    }
                });



            });

            $("#btnAgregar").click(function(e){
                e.preventDefault();
                var socioCombo     =  $('#socios option:selected');
                var idSocio        =  socioCombo.val();
                var cantInpt       = $("#cantidad_socios");
                var cantidadSocios =  cantInpt.val();
                var cantidadAgregados = $("#tablaSocios tbody tr").length;
                console.log(cantidadAgregados);
                if( cantidadAgregados == cantidadSocios ){
                    cantInpt.focus();
                    return alert("No se Puede Seguir Cargando Socios, aumente la cantidad");
                }
                if(idSocio==0){
                    return alert("Por favor Seleccione un Socio");
                }
                var datoSocio      =  socioCombo.text();

                socioCombo.remove();

                $("#resultado").show();
                var table          =  $("#resultado table tbody");
                sociosJson.push(idSocio);
                table.append('<tr id="socioTr'+idSocio+'"><td id="socioTd'+idSocio+'">'+datoSocio+'</td><td><button type="button" class="btn btn-danger" onclick="borrar('+idSocio+')"><i class="fa fa-trash-o"></i></button></td></tr>');


            });
    });
    function borrarSocioTabla(idSocio){
        var tr = '#socioTr'+idSocio;

        var nombre = $('#socioTd'+idSocio).text();
        $(tr).remove();
        $("#socios").append('<option value="'+idSocio+'">'+nombre+'</option>');
            $.each(sociosJson, function(i, v) {
                if (v == idSocio) {
                    sociosJson.splice(i);
                    return;
                }
       });
}
function borrar(idSocio,idCirculo){
        console.log(idCirculo);
        var idCirculo = idCirculo || null;
        if(idCirculo==null){
            return borrarSocioTabla(idSocio);
        }
        utils.ajax(null,'POST','circulos/socios/borrar',{id_socio:idSocio,id_circulo:idCirculo},function(respuesta){
                if(respuesta.success==true){

                    borrarSocioTabla(idSocio);
                    $("#mensajeCorrectoCirculo").show();
                }
        });

    }
</script>

@stop
