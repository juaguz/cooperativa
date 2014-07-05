@extends ('header')
@section('scripts')
<style>
    .row {
        margin-top: 5px !important;
    }
</style>
@stop
@section ('content')

<table class="table responsive table-bordered table-hover">
    <thead>
        <th>Descripción</th>
        <th>Acciones</th>
    </thead>
    <tbody>
    @foreach ($descripciones as $descripcion)
        <tr>
            <td>{{ $descripcion->descripcion }}</td>
            <td><a href="{{ route($ruta,$descripcion->id) }}"><button class="btn btn-info">Editar</button></a></td>
        </tr>
    @endforeach
    </tbody>
</table>
<a href="{{ $UrlCrear }}"><button class="btn btn-success">Crear »</button></a>
@stop
