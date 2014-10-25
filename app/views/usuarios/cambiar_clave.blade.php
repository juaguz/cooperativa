@extends ('header')



@section ('title') Cambiar Clave @stop
@section ('content')

{{ Form::model($clave,array('url'=>'usuarios/clave', 'method' => 'POST'), array('role' => 'form')) }}

<div class="row">

	<div class="form-group col-md-3">
		{{ Form::label('clave', 'Clave Anterior') }}
		{{ Form::password('clave_old',null,array('class' => 'form-control')); }}
		@if (isset($mensa))
		{{ $mensa }}
		@endif
		{{ $errors->first('clave_old') }}
	</div>
</div>
<div class="row">
	<div class="form-group col-md-3">
		{{ Form::label('clave_nueva', 'Clave Nueva') }}
		{{ Form::password('clave_nueva',null,array('class' => 'form-control')); }}
		{{ $errors->first('clave_nueva') }}
	</div>
</div>
<div class="row">
	<div class="form-group col-md-3">
		{{ Form::label('clave_confirma', 'Confirme Clave') }}
		{{ Form::password('clave_confirma',null,array('class' => 'form-control','type'=>'number')); }}
		{{ $errors->first('clave_confirma') }}
	</div>
</div>
<div class="row">
	<div class="form-group col-md-4">
		{{ Form::button(' Cambiar »	 ', array('type' => 'submit', 'class' => 'btn btn-primary')) }}
	</div>
</div>

{{ Form::close() }}
@stop