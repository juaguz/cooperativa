@extends ('header')
@section ('title') Listado de Familiares @stop

@section('style')
<style>
    #busqueda{
        margin-bottom:2%;
    }
</style>
@stop

@section ('content')

<a  href="{{ route('cocheria.facturas.create') }}" class="btn btn-default">Cargar Factura</a>
<a  href="{{ route('cocheria.facturas.exportar.excel') }}" class="btn btn-default">Exportar Facturas</a>

<h2>Listados de Facturas</h2>


<table class="table table-hover">
    <thead>
    <tr>
        <th>Fecha</th>
        <th>Nombre Socio</th>
        <th>Apellido Socio</th>
        <th>Legajo Socio</th>
        <th>Nombre Familiar</th>
        <th>Apellido Familiar</th>
        <th>Importe</th>
        <th>Porcentaje</th>
        <th>Descripción</th>
        <th>Acciones</th>

    </tr>
    </thead>
    <tbody>
    @foreach($facturas as $key => $value)
    <tr>
        <td>{{ $value->fecha }}</td>
        <td>{{ $value->getSocios->nombre }}</td>
        <td>{{ $value->getSocios->apellido }}</td>
        <td>{{ $value->getSocios->nro_legajo }}</td>
        @if($value->getFamiliares)
        <td>{{ $value->getFamiliares->nombre }}</td>
        <td>{{ $value->getFamiliares->apellido }}</td>
        @else
        <td>{{ $value->nombre }}</td>
        <td>{{ $value->apellido }}</td>
        @endif
        <td>{{ $value->importe}}</td>
        <td>{{ $value->porcentaje }}</td>
        <td>{{ $value->descripcion }}</td>


        <!-- we will also add show, edit, and delete buttons -->
        <td>

            <!-- delete the nerd (uses the destroy method DESTROY /nerds/{id} -->
            <!-- we will add this later since its a little more complicated than the other two buttons -->

            <!-- show the nerd (uses the show method found at GET /nerds/{id} -->
            <a class="btn btn-small btn-info" href="{{ route('cocheria.facturas.edit',$value->id) }}">Editar</a>





        </td>
    </tr>
    @endforeach
    </tbody>
</table>

{{ $facturas->links() }}

@stop