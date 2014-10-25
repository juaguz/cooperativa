@extends ('header')


@section ('title') {{$action}} prestamo @stop

@section ('content')
<h1>{{$action}} Prestamo <a href="{{ route('socios.edit',$prestamo->id_socio) }}" style="color:cornflowerblue">{{ $prestamo->socio->nombre }} {{ $prestamo->socio->apellido }}</a></h1>



{{ Form::model(isset($prestamo) ? $prestamo : null,$form_data, array('role' => 'form')) }}


<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('id_socio', 'Socio') }}
        {{ Form::select('id_socio',$sociosCombo,null,array('class' => 'form-control select2')) }}

    </div>
    <div class="form-group col-md-4">
        {{ Form::label('monto', 'Monto') }}
        {{ Form::text('monto', null, array('placeholder' => 'Ingrese Monto', 'class' => 'form-control')) }}
    </div>
</div>
<div class="row">
	<div class="form-group col-md-4">
		{{ Form::label('interes', 'Interes') }}
		{{ Form::text('interes', null, array('placeholder' => 'Ingrese Interes', 'class' => 'form-control','type'=>'range')) }}

	</div>

    <div class="form-group col-md-4">
		{{ Form::label('cantidad_cuotas', 'Cantidad de Cuotas') }}
		{{ Form::text('cantidad_cuotas',null, array('placeholder' => 'Ingrese Cantidad de Cuotas ', 'class' => 'form-control')) }}

	</div>
</div>

<div class="row">
	<div class="form-group col-md-4">
		{{ Form::button('Generar', array('type' => 'button', 'class' => 'btn btn-default','id'=>'btnGenerar')) }}
		{{ Form::button('Guardar', array('type' => 'submit', 'class' => 'btn btn-primary','id'=>'btnGuardar','disabled'=>'disabled')) }}
        @if(isset($prestamo))
        <a class="btn btn-small btn-info generar_orden" data-toggle="modal" data-target="#modalPrestamos" href="#" data-id="{{$prestamo->id}}">Imprimir Orden de Pago</a>
        @endif
	</div>
</div>
<div id="tablaResultado">

</div>
{{ Form::hidden('id',null, array('placeholder' => 'Ingrese Cantidad de Cuotas ', 'class' => 'form-control','id'=>'id')) }}
{{ Form::close() }}

@stop






@section('scripts')
{{ HTML::script('assets/js/ordenes_pago/prestamos.js') }}
<script>
    $(function(){
        var btnGuardar  = $("#btnGuardar");
        var frmPrestamo = $("#prestamoForm");
        var frmCuotas   = $("#tablaResultado");

        var idPrestamo  = $("#id").val();
        var divResultado = $("#tablaResultado");

        if(idPrestamo != ''){
            $("#btnGenerar").attr("disabled","disabled");
            $("#prestamoForm :input").attr("disabled","disabled");
            $.ajax({
                url:"{{ route('prestamos.getTablaPrestamo') }}",
                type:"POST",
                data:{id_prestamo:idPrestamo},
                beforeSend:function(){
                    $.blockUI({ message: '<div class="progress-bar progress-bar-danger" style="width: 100%;">Cargando...</div>' });

                },
                success:function(html){
                    btnGuardar.removeAttr("disabled");
                    divResultado.html(html);
                    $.unblockUI();

                }
            });
        }





        $("#btnGenerar").click(function(e){
            e.preventDefault();
            var data = frmPrestamo.serialize();
            var divResultado = $("#tablaResultado");
            $.ajax({
                url:"{{ route('prestamos.getTabla') }}",
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
@include('prestamos.modal')
