@extends ('header')


@section ('title') {{$action}} Recibo @stop

@section ('content')


{{ Form::model(isset($recibo) ? $recibo : null,$form_data, array('role' => 'form')) }}

<div class="row">

    <div class="form-group col-md-4">
        {{ Form::label('fecha', 'Fecha') }}
        {{ Form::text('fecha', null, array('placeholder' => '', 'class' => 'form-control fecha','required'=>'required')) }}
    </div>
</div>
<div class="row">

    <div class="form-group col-md-4">
        {{ Form::label('responsable', 'Responsable') }}
        {{ Form::text('responsable', null, array('placeholder' => 'Ingrese Responsable', 'class' => 'form-control','required'=>'required')) }}
    </div>

    <div class="form-group col-md-4">
        {{ Form::label('quien', 'Quien') }}
        {{ Form::text('quien', null, array('placeholder' => 'Ingrese de quien recibe', 'class' => 'form-control','required'=>'required')) }}
    </div>
</div>


<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('monto', 'Importe') }}
        {{ Form::text('monto', null, array('placeholder' => '', 'class' => 'form-control','required'=>'required','type'=>'number')) }}
    </div>
    <div class="form-group col-md-4">
        {{ Form::label('concepto', 'Concepto') }}
        {{ Form::text('concepto', null, array('placeholder' => 'Ingrese el concepto', 'class' => 'form-control')) }}
    </div>
</div>
<div class="row">

    <div class="form-group col-md-4">

        {{ Form::button('Guardar', array('type' => 'submit', 'class' => 'btn btn-primary','id'=>'id_guardar')) }}
        @if(isset($recibo))
            <a class="btn btn-small btn-primary generar_recibo" data-id="{{ $recibo->id}}">Imprimir</a>
        @endif
    </div>
</div>
{{ Form::close() }}
@stop

@section('scripts')
<script>
    $("#form_factura").validate({
        errorClass: "invalid",
        rules:{

            importe:{
                required:true,
                number:true
            }
        }

    });

</script>

@stop
@include('recibos.modal')
