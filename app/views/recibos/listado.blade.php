@extends ('header')
@section ('title') Listado de Recibos @stop

@section('style')
<style>
    #busqueda{
        margin-bottom:2%;
    }
</style>
@stop

@section ('content')

<a  href="{{ route('recibos.create') }}" class="btn btn-default">Nuevo Recibo</a>
<a  href="{{ route('recibos.exportar.excel') }}" class="btn btn-default">Exportar Recibos</a>

<h2>Listados de Recibos</h2>


<table class="table table-hover">
    <thead>
    <tr>
        <th>Fecha</th>
        <th>Responsable</th>
        <th>Concepto</th>
        <th>De quien</th>
        <th>Monto</th>
        <th>Acciones</th>

    </tr>
    </thead>
    <tbody>
    @foreach($recibos as $key => $value)
    <tr>
        <td>{{ $value->fecha }}</td>
        <td>{{ $value->responsable }}</td>
        <td>{{ $value->concepto }}</td>
        <td>{{ $value->quien }}</td>
        <td>{{ $value->monto }}</td>


        <!-- we will also add show, edit, and delete buttons -->
        <td>

            <!-- delete the nerd (uses the destroy method DESTROY /nerds/{id} -->
            <!-- we will add this later since its a little more complicated than the other two buttons -->

            <!-- show the nerd (uses the show method found at GET /nerds/{id} -->
            <a class="btn btn-small btn-info" href="{{ route('recibos.edit',$value->id) }}">Editar</a>





        </td>
    </tr>
    @endforeach
    </tbody>
</table>

{{ $recibos->links() }}

@stop