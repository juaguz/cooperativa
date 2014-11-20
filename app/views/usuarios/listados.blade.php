@extends ('header')
@section ('title') Listado de Usuarios @stop

@section ('content')
    <a href="{{ route('usuarios.create') }}"><button class="btn btn-primary" >Cargar Usuario <i class="glyphicon glyphicon-user"></i></button></a>
<h2>Listados de Usuarios</h2>
<table class="table table-hover">
	<thead>
		<tr>
			<th>Nombre de Usuario</th>
			<th>Nombre</th>
			<th>Apellido</th>
            <th>Tipo Documento</th>
            <th>DNI</th>
            <th>Perfil</th>
			<th>Acciones</th>
		</tr>
	</thead>
	<tbody>
		@foreach($users as $key => $value)
		<tr>
			<td>{{ $value->usuario }}</td>
			<td>{{ $value->nombre }}</td>
            <td>{{ $value->apellido }}</td>
            <td>{{ $value->getTipoDocumento->descripcion }}</td>
            <td>{{ $value->nro_documento }}</td>
            <td>{{ $value->getPerfil->descripcion }}</td>

			<!-- we will also add show, edit, and delete buttons -->
			<td>

				<!-- delete the nerd (uses the destroy method DESTROY /nerds/{id} -->
				<!-- we will add this later since its a little more complicated than the other two buttons -->

				<!-- show the nerd (uses the show method found at GET /nerds/{id} -->
				<a class="btn btn-small btn-info" href="{{ route('usuarios.show',$value->id) }}">Editar</a>


				

			</td>
		</tr>
	@endforeach
	</tbody>
</table>

@stop