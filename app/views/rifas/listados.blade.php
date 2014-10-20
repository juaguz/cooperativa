@extends ('header')
@section ('title') Listado de Rifas @stop

@section('style')
<style>
    #busqueda{
        margin-bottom:2%;
    }
</style>
@stop

@section ('content')
    <a href="{{ route('rifas.create') }}"><button class="btn btn-primary" >Crear Rifa <i class="glyphicon glyphicon-user"></i></button></a>
<h2>Listados de Rifas</h2>
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
			<th>Desde</th>
            <th>Hasta</th>
            <th>Precio</th>
            <th>Fecha de Sorteo</th>
			<th>Acciones</th>
		</tr>
	</thead>
	<tbody>
		@foreach($rifas as $key => $value)
		<tr>
			<td>{{ $value->nombre }}</td>
            <td>{{ $value->desde }}</td>
            <td>{{ $value->hasta }}</td>
            <td>{{ $value->precio }}</td>
            <td>{{ $value->fecha_sorteo }}</td>

			<!-- we will also add show, edit, and delete buttons -->
			<td>

				<!-- delete the nerd (uses the destroy method DESTROY /nerds/{id} -->
				<!-- we will add this later since its a little more complicated than the other two buttons -->

				<!-- show the nerd (uses the show method found at GET /nerds/{id} -->
				<a class="btn btn-small btn-info" href="{{ route('rifas.edit',$value->id) }}">Editar</a>
				<a class="btn btn-small btn-info" href="{{ route('rifas.vender',$value->id) }}">Vender Rifas</a>





			</td>
		</tr>
	@endforeach
	</tbody>
</table>

{{ $rifas->appends( $busqueda )->links() }}

@stop