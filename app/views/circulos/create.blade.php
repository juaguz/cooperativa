@extends ('header')


@section ('title') {{$action}} circulo @stop

@section ('content')
<h1>{{$action}} Círculo</h1>



{{ Form::model(isset($circulo) ? $circulo : null,$form_data, array('role' => 'form')) }}


<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('nombre', 'Nombre') }}
        {{ Form::text('nombre', null, array('placeholder' => 'Ingrese Nombre', 'class' => 'form-control')) }}

    </div>
    <div class="form-group col-md-4">
        {{ Form::label('cantidad_socios', 'Cantidad de Socios') }}
        {{ Form::text('cantidad_socios', null, array('placeholder' => 'Ingrese Cantidad de Socios', 'class' => 'form-control')) }}
    </div>
</div>
<div class="row">
	<div class="form-group col-md-4">
        {{ Form::label('fecha_inicio', 'Fecha de Inicio') }}
        {{ Form::text('fecha_inicio', null, array('placeholder' => 'Ingrese Fecha de Inicio ', 'class' => 'form-control fecha')) }}

	</div>

    <div class="form-group col-md-4">
        {{ Form::label('fecha_fin', 'Fecha de Fin') }}
        {{ Form::text('fecha_fin', null, array('placeholder' => 'Ingrese Fecha de Fin ', 'class' => 'form-control fecha')) }}

	</div>
</div>
<div class="row">
	<div class="form-group col-md-4">
        {{ Form::label('importe', 'Monto del Círculo') }}
        {{ Form::text('importe', null, array('placeholder' => 'Ingrese Monto ', 'class' => 'form-control')) }}

	</div>
    <div class="form-group col-md-4">

    </div>
 </div>
<br>

<div id="tablaResultado">

</div>

<div class="row">
	
	<div class="form-group col-md-4">
        {{ Form::button('Generar', array('type' => 'button', 'class' => 'btn btn-default','id'=>'btnGenerar')) }}
		{{ Form::button('Guardar', array('type' => 'submit', 'class' => 'btn btn-primary','id'=>'id_guardar')) }}
	</div>
</div>
{{ Form::close() }}



@stop




@section('scripts')
<script>
    $(function(){
        var btnGuardar  = $("#btnGuardar");
        var frmCirculo = $("#circuloFrm");


        var idCirculo  = $("#id").val();
        var divResultado = $("#tablaResultado");

        /*
        if(idCirculo != ''){
            $("#btnGenerar").attr("disabled","disabled");

            $.ajax({
                url:"{{ route('circulos.getTablaCirculo') }}",
                type:"POST",
                data:{id_circulo:idCirculo},
                beforeSend:function(){
                    $.blockUI({ message: '<div class="progress-bar progress-bar-danger" style="width: 100%;">Cargando...</div>' });

                },
                success:function(html){
                    //btnGuardar.removeAttr("disabled");
                    //divResultado.html(html);
                    $.unblockUI();

                }
            });
        }*/





        $("#btnGenerar").click(function(e){
            e.preventDefault();
            var data = frmCirculo.serialize();
            var divResultado = $("#tablaResultado");
            $.ajax({
                url:"{{ route('circulos.getTabla') }}",
                type:"POST",
                data:data,
                beforeSend:function(){
                    $.blockUI({ message: '<div class="progress-bar progress-bar-danger" style="width: 100%;">Cargando...</div>' });

                },
                success:function(html){
                    btnGuardar.removeAttr("disabled");
                    divResultado.html(html);
                    $.unblockUI();


                }
            });
        });
    });

</script>

@stop
