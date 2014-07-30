<table>
    <thead>
        <tr>
            <td>Nombre</td>
            <td>Apellido</td>
            <td>Tipo Documento</td>
        </tr>
    </thead>
    <tbody>
@foreach ($familiares as $familiar)
    <tr>
        <td> {{ $familiar->nombre   }} </td>
        <td> {{ $familiar->apellido }} </td>
        <td> {{ $familiar->getTipoDocumento->descripcion }} </td>
    </tr>
@endforeach
    </tbody>
</table>