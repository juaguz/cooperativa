<table class="table table-hover">
    <thead>
    <tr>

        <th>Nombre</th>
        <th>Desde</th>
        <th>Hasta</th>
        <th>Precio</th>
        <th>Fecha de Sorteo</th>
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
    </tr>
    @endforeach
    </tbody>
</table>