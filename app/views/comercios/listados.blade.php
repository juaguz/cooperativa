@extends ('header')
@section ('title') Listado de Comercios @stop

@section('style')
<style>
    #busqueda{
        margin-bottom:2%;
    }
</style>
@stop

@section ('content')
    <a href="{{ route('comercios.create') }}"><button class="btn btn-primary" >Crear Comercio <i class="glyphicon glyphicon-user"></i></button></a>
<h2>Listados de Comercios</h2>
{{ Form::model(isset($busqueda) ? $busqueda : null,["method"=>"GET"]) }}
<div class="row" id="busqueda">
    <div class="col-md-2">
        {{ Form::text('nombre',null,array('class'=>'form-control','type'=>'text','placeholder'=>'Ingrese Razon Social')) }}
    </div>

    <div class="col-md-2">
        <button class="btn btn-success">Buscar</button>
    </div>

</div>
{{ Form::close() }}

<table class="table table-hover">
	<thead>
		<tr>
			<th>Nombre</th>
			<th>Direcci&oacute;n</th>
            <th>Tel&eacute;fono</th>
            <th>Contacto</th>
			<th>Acciones</th>
		</tr>
	</thead>
	<tbody>
		@foreach($comercios as $key => $value)
		<tr>
			<td>{{ $value->nombre }}</td>
            <td>{{ $value->direccion }}</td>
            <td>{{ $value->telefono }}</td>
            <td>{{ $value->persona_contacto }}</td>

			<!-- we will also add show, edit, and delete buttons -->
			<td>

				<!-- delete the nerd (uses the destroy method DESTROY /nerds/{id} -->
				<!-- we will add this later since its a little more complicated than the other two buttons -->

				<!-- show the nerd (uses the show method found at GET /nerds/{id} -->
				<a class="btn btn-small btn-info" href="{{ route('comercios.edit',$value->id) }}">Editar</a>





			</td>
		</tr>
	@endforeach
	</tbody>
</table>

{{ $comercios->appends( $busqueda )->links() }}

@stop