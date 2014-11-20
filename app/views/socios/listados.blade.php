@extends ('header')
@section ('title') Listado de Socios @stop

@section('style')
<style>
    #busqueda{
        margin-bottom:2%;
    }
</style>
@stop

@section ('content')
    <a href="{{ route('socios.create') }}"><button class="btn btn-default" >Nuevo Socio </i></button></a>
<h2>Listados de Socios</h2>
{{ Form::model(isset($busqueda) ? $busqueda : null,["method"=>"GET"]) }}
<div class="row" id="busqueda">
    <div class="col-md-2">
        {{ Form::text('nro_legajo',null,array('class'=>'form-control','type'=>'text','placeholder'=>'Ingrese Legajo')) }}
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
			<th>Apellido</th>
            <th>Tipo Documento</th>
            <th>Nro de Documento</th>
			<th>Acciones</th>
		</tr>
	</thead>
	<tbody>
		@foreach($socios as $key => $value)
		<tr>
			<td>{{ $value->nombre }}</td>
            <td>{{ $value->apellido }}</td>
            <td>{{ $value->getTipoDocumento->descripcion }}</td>
            <td>{{ $value->nro_documento }}</td>

			<!-- we will also add show, edit, and delete buttons -->
			<td>

				<!-- delete the nerd (uses the destroy method DESTROY /nerds/{id} -->
				<!-- we will add this later since its a little more complicated than the other two buttons -->

				<!-- show the nerd (uses the show method found at GET /nerds/{id} -->
				<a class="btn btn-small btn-primary" href="{{ route('socios.edit',$value->id) }}">Ingresar</a>

			</td>
		</tr>
	@endforeach
	</tbody>
</table>

{{ $socios->appends( $busqueda )->links() }}

@stop