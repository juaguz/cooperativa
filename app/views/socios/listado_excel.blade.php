<table class="table table-hover">
    <thead>
    <tr>
        <th>Legajo</th>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Tipo Documento</th>
        <th>Nro de Documento</th>
        <th>Direcci&oacute;n</th>
        <th>Tel&eacute;fono</th>
    </tr>
    </thead>
    <tbody>
    @foreach($socios as $key => $value)
    <tr>
        <td>{{ $value->nro_legajo }}</td>
        <td>{{ $value->nombre }}</td>
        <td>{{ $value->apellido }}</td>
        <td>{{ $value->getTipoDocumento->descripcion }}</td>
        <td>{{ $value->nro_documento }}</td>
        <td>{{ $value->direccion }}</td>
        <td>{{ $value->tel_particular }}</td>
    </tr>
    @endforeach
    </tbody>
</table>