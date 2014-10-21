<table class="table table-hover">
	<thead>
		<tr>
			<th>Nombre</th>
			<th>Direcci&oacute;n</th>
            <th>Tel&eacute;fono</th>
            <th>Contacto</th>

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

		</tr>
	@endforeach
	</tbody>
</table>
