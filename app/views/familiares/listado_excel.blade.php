<table class="table table-responsive table-bordered">
    <thead>
        <tr>
            <td>Nombre</td>
            <td>Apellido</td>
            <td>Tipo Documento</td>
            <td>Nro Documento</td>
            <td>Fecha Nacimiento</td>
            <td>Sexo</td>
            <td>Estudios</td>
            <td>Socio Cooperativa</td>
            <td>Socio Futbol</td>
            <td>Socio Pesca</td>
            <td>Dirección</td>
            <td>Localidad</td>
            <td>Celular</td>
            <td>Tel Particular</td>
            <td>Tel Laboral</td>
            <td>Nombre de Socio</td>
            <td>Apellido de Socio</td>
            <td>Legajo de Socio</td>
        </tr>
    </thead>
    <tbody>
@foreach ($familiares as $familiar)
    <tr>
        <td> {{ $familiar->nombre   }} </td>
        <td> {{ $familiar->apellido }} </td>
        <td> {{ $familiar->getTipoDocumento->descripcion }} </td>
        <td> {{ $familiar->nro_documento }} </td>
        <td> {{ $familiar->fecha_nac }} </td>
        <td> {{ $familiar->getSexo->descripcion }} </td>
        <td> {{ $familiar->getEstudio->descripcion }} </td>
        <td> {{ $familiar->getSiNoSocioCoop->descripcion }} </td>
        <td> {{ $familiar->getSiNoSocioFutbol->descripcion }} </td>
        <td> {{ $familiar->getSiNoSocioPesca->descripcion }} </td>
        <td> {{ $familiar->direccion }} </td>
        <td> {{ $familiar->localidad }} </td>
        <td> {{ $familiar->tel_cel }} </td>
        <td> {{ $familiar->tel_part }} </td>
        <td> {{ $familiar->tel_lab }} </td>
        <td> {{ $familiar->getSocio->nombre }} </td>
        <td> {{ $familiar->getSocio->apellido }} </td>
        <td> {{ $familiar->getSocio->nro_legajo }} </td>
    </tr>
@endforeach
    </tbody>
</table>