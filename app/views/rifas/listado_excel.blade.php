<table class="table table-hover">
	<thead>
		<tr>
			<th>Nombre</th>
			<th>Desde</th>
            <th>Hasta</th>
            <th>Meses</th>

		</tr>
	</thead>
	<tbody>
		@foreach($rifas as $key => $value)
		<tr>
			<td>{{ $value->nombre }}</td>
            <td>{{ $value->desde }}</td>
            <td>{{ $value->hasta }}</td>
            <td>{{ $value->meses }}</td>

			<!-- we will also add show, edit, and delete buttons -->

		</tr>
	@endforeach
	</tbody>
</table>
