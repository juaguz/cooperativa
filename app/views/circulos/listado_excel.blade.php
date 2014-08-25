<table class="table table-hover">
	<thead>
		<tr>
			<th>Nombre</th>
			<th>Cantidad de Socios</th>
            <th>Monto</th>
            <th>Fecha de Inicio</th>
            <th>Fecha de Fin</th>
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

		</tr>
	@endforeach
	</tbody>
</table>
