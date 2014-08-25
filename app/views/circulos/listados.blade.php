@extends ('header')
@section ('title') Listado de Círculos @stop

@section('style')
<style>
    #busqueda{
        margin-bottom:2%;
    }
</style>
@stop

@section ('content')
    <a href="{{ route('circulos.create') }}"><button class="btn btn-primary" >Crear Círculo <i class="glyphicon glyphicon-user"></i></button></a>
<h2>Listados de Círculos</h2>
{{ Form::model(isset($busqueda) ? $busqueda : null,["method"=>"GET"]) }}
<div class="row" id="busqueda">
    <div class="col-md-2">
        {{ Form::text('nombre',null,array('class'=>'form-control','type'=>'text','placeholder'=>'Ingrese Nombre')) }}
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
			<th>Cantidad de Socios</th>
            <th>Monto</th>
            <th>Fecha de Inicio</th>
            <th>Fecha de Fin</th>
			<th>Acciones</th>
		</tr>
	</thead>
	<tbody>
		@foreach($circulos as $key => $value)
		<tr>
			<td>{{ $value->nombre }}</td>
            <td>{{ $value->cantidad_socios }}</td>
            <td>{{ $value->importe }}</td>
            <td>{{ $value->fecha_inicio }}</td>
            <td>{{ $value->fecha_fin }}</td>

			<!-- we will also add show, edit, and delete buttons -->
			<td>

				<!-- delete the nerd (uses the destroy method DESTROY /nerds/{id} -->
				<!-- we will add this later since its a little more complicated than the other two buttons -->

				<!-- show the nerd (uses the show method found at GET /nerds/{id} -->
				<a class="btn btn-small btn-info" href="{{ route('circulos.edit',$value->id) }}">Editar</a>





			</td>
		</tr>
	@endforeach
	</tbody>
</table>

{{ $circulos->appends( $busqueda )->links() }}

@stop