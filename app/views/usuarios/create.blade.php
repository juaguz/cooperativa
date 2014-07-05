@extends ('header')
<?php
    if ($user->exists):
        $form_data = array('route' => array('usuarios.update', $user->id), 'method' => 'PATCH');
        $action    = 'Editar';
    else:
        $form_data = array('route' => 'usuarios.store', 'method' => 'POST');
        $action    = 'Crear';        
    endif;

?>

@section ('title') {{$action}} usuario @stop

@section ('content')
<h1>{{$action}} Usuario</h1>
<div class="alert alert-danger fade in" style="display:none" id="errores">
      
     
</div>

{{ Form::model($user,$form_data, array('role' => 'form')) }}

<div class="row">
	<div class="form-group col-md-4">
		{{ Form::label('id', 'Perfil') }}
		{{ Form::select('id_perfil',$perfiles ,null,array('class' => 'form-control','id'=>'id_perfil')) }}
	</div>
    <div class="form-group col-md-4">
        {{ Form::label('usernam', 'Nombre de Usuario') }}
        {{ Form::text('username', null, array('placeholder' => 'Ingrese el Nombre del Usuario', 'class' => 'form-control')) }}

            </div>

</div>
<div class="row">
	<div class="form-group col-md-4">
		{{ Form::label('nombre', 'Nombre') }}
		{{ Form::text('nombre', null, array('placeholder' => 'Ingrese el Nombre del Usuario', 'class' => 'form-control')) }}
		{{ $errors->first('nombre') }}
	</div>

    <div class="form-group col-md-4">
		{{ Form::label('apellido', 'Apellido') }}
		{{ Form::text('apellido', null, array('placeholder' => 'Ingrese el Apellido del Usuario ', 'class' => 'form-control')) }}
		{{ $errors->first('apellido') }}
	</div>
</div>
<div class="row">
	<div class="form-group col-md-4">
		{{ Form::label('dni', 'Dni') }}
		{{ Form::text('dni', null, array('placeholder' => 'Ingrese el Dni del Usuario ', 'class' => 'form-control')) }}
		{{ $errors->first('dni') }}
	</div>
	<div class="form-group col-md-4">
		{{ Form::label('email', 'Mail') }}
		{{ Form::text('email', null, array('placeholder' => 'Ingrese el Mail del Usuario ', 'class' => 'form-control')) }}
		{{ $errors->first('email') }}
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
<script>

	$(function() {

		$("input[name='dni").focusout(function(event) {
			var dni = $("input[name='dni']").val();
			$.ajax({
				type : 'POST',
				url : '{{ Request::root() }}/usuarios/dni',
				data : 'dni=' + dni,
				success : function(d) {
					var res = jQuery.parseJSON(d);
					if (res.respuesta) {
						$("#id_guardar").attr("disabled", "disabled");
						$("#errores").html("Ya Existe un Usuario con ese Nro Documento").show("slow");
					} else {
						$("#id_guardar").removeAttr("disabled");
						$("#errores").hide("slow");
					}
				}
			});
		});
	}); 
</script>

@stop
