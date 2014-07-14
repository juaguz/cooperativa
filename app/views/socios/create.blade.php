@extends ('header')


@section ('title') {{$action}} socio @stop

@section ('content')
<h1>{{$action}} Socio</h1>



{{ Form::model(isset($socio) ? $socio : null,$form_data, array('role' => 'form')) }}


<div class="row">
	<div class="form-group col-md-4">
		{{ Form::label('nombre', 'Nombre') }}
		{{ Form::text('nombre', null, array('placeholder' => 'Ingrese el Nombre del Socio', 'class' => 'form-control')) }}

	</div>

    <div class="form-group col-md-4">
		{{ Form::label('apellido', 'Apellido') }}
		{{ Form::text('apellido', null, array('placeholder' => 'Ingrese el Apellido del Socio ', 'class' => 'form-control')) }}

	</div>
</div>
<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('id_tipo_documento', 'Tipo Documento') }}
        {{ Form::select('id_tipo_documento',$tiposDocumentos ,null,array('class' => 'form-control','id'=>'')) }}
    </div>
	<div class="form-group col-md-4">
		{{ Form::label('nro_documento', 'Nro Documento') }}
		{{ Form::text('nro_documento', null, array('placeholder' => 'Ingrese el Dni del Usuario ', 'class' => 'form-control')) }}

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


@stop
