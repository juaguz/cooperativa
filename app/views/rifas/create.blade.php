@extends ('header')


@section ('title') {{$action}} rifa @stop

@section ('content')
<h1>{{$action}} Rifa</h1>



{{ Form::model(isset($rifa) ? $rifa : null,$form_data, array('role' => 'form')) }}


<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('nombre', 'Nombre') }}
        {{ Form::text('nombre', null, array('placeholder' => 'Ingrese Nombre', 'class' => 'form-control')) }}

    </div>
    <div class="form-group col-md-4">
        {{ Form::label('precio', 'Precio') }}
        {{ Form::text('precio', null, array('placeholder' => 'Ingrese Precio', 'class' => 'form-control')) }}
    </div>
</div>
<div class="row">
	<div class="form-group col-md-4">
		{{ Form::label('desde', 'Primer N&uacute;mero') }}
		{{ Form::text('desde', null, array('placeholder' => 'Ingrese Primer N&uacute;mero', 'class' => 'form-control')) }}

	</div>

    <div class="form-group col-md-4">
		{{ Form::label('hasta', 'Último Número') }}
		{{ Form::text('hasta', null, array('placeholder' => 'Ingrese Último Número ', 'class' => 'form-control')) }}

	</div>
</div>
<div class="row">
	<div class="form-group col-md-4">
        {{ Form::label('fecha_sorteo', 'Fecha de Sorteo') }}
        {{ Form::text('fecha_sorteo', null, array('placeholder' => 'Ingrese Fecha de Sorteo ', 'class' => 'form-control fecha')) }}

	</div>
    <div class="form-group col-md-4">

    </div>
 </div>
<br>

<div class="row">
	
	<div class="form-group col-md-4">
		
		{{ Form::button('Guardar', array('type' => 'submit', 'class' => 'btn btn-primary','id'=>'id_guardar')) }}
	</div>
</div>
{{ Form::close() }}



@stop




@section('scripts')

@stop
