@extends ('header')


@section ('title') {{$action}} comercio @stop

@section ('content')
<h1>{{$action}} Comercio</h1>



{{ Form::model(isset($comercio) ? $comercio : null,$form_data, array('role' => 'form')) }}


<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('nombre', 'Nombre') }}
        {{ Form::text('nombre', null, array('placeholder' => 'Ingrese Razón Social', 'class' => 'form-control')) }}

    </div>
    <div class="form-group col-md-4">
        {{ Form::label('direccion', 'Dirección') }}
        {{ Form::text('direccion', null, array('placeholder' => 'Ingrese Dirección', 'class' => 'form-control')) }}
    </div>
</div>
<div class="row">
	<div class="form-group col-md-4">
		{{ Form::label('telefono', 'Teléfono') }}
		{{ Form::text('telefono', null, array('placeholder' => 'Ingrese Nro de Teléfono', 'class' => 'form-control')) }}

	</div>

    <div class="form-group col-md-4">
		{{ Form::label('persona_contacto', 'Contacto') }}
		{{ Form::text('persona_contacto', null, array('placeholder' => 'Ingrese Nombre del Contacto ', 'class' => 'form-control')) }}

	</div>
</div>
<div>
	<div class="form-group col-md-4">
		{{ Form::label('observaciones', 'Observaciones') }}
		{{ Form::textarea('observaciones', null, array('placeholder' => 'Observaciones', 'class' => 'form-control')) }}

	</div>
    <div class="form-group col-md-4"></div>
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
