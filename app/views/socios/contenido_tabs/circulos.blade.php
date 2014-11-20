<div class="tab-pane fade" id="circulos">
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
                 		@foreach($socio->getCirculosSocios as $key => $value)
                 		<tr>
                 			<td>{{ $value->circulo->nombre }}</td>
                             <td>{{ $value->circulo->cantidad_socios }}</td>
                             <td>{{ $value->circulo->importe }}</td>
                             <td>{{ $value->circulo->fecha_inicio }}</td>
                             <td>{{ $value->circulo->fecha_fin }}</td>
                 			<td>
                 				<a class="btn btn-small btn-info"   href="{{ route('circulos.edit',$value->circulo->id) }}">Editar</a>
                 				<a class="btn btn-small btn-danger" href="{{ route('circulos.elimiar_socio',$value->id) }}">Eliminar del Circulo</a>
                 			</td>
                 		</tr>
                 	@endforeach
                 	</tbody>
                 </table>