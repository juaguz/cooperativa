<table class="table table-hover">
    <thead>
    <tr>
        <th>Fecha</th>
        <th>Nombre Socio</th>
        <th>Apellido Socio</th>
        <th>Legajo Socio</th>
        <th>Nombre Familiar</th>
        <th>Apellido Familiar</th>
        <th>Parentezco</th>
        <th>Importe</th>
        <th>Porcentaje</th>
        <th>Descripción</th>
    </tr>
    </thead>
    <tbody>
    @foreach($facturas as $key => $value)
    <tr>
        <td>{{ $value->fecha }}</td>
        <td>{{ $value->getSocios->nombre }}</td>
        <td>{{ $value->getSocios->apellido }}</td>
        <td>{{ $value->getSocios->nro_legajo }}</td>
        <td>{{ $value->getFamiliares->nombre }}</td>
        <td>{{ $value->getFamiliares->apellido }}</td>
        <td>{{ $value->getFamiliares->getParentezco->descripcion }}</td>
        <td>{{ $value->importe}}</td>
        <td>{{ $value->porcentaje }}</td>
        <td>{{ $value->descripcion }}</td>
    </tr>
    @endforeach
    </tbody>
</table>