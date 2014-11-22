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


<h2>Listados de Recibos</h2>
{{ Form::model(isset($busqueda) ? $busqueda : null,["method"=>"GET"]) }}
<div class="row" id="busqueda">
    <div class="col-md-2">
        {{ Form::text('id',null,array('class'=>'form-control','type'=>'text','placeholder'=>'Ingrese Nro de Recibo')) }}
    </div>

    <div class="col-md-2">
        <button class="btn btn-success">Buscar</button>
    </div>

</div>
{{ Form::close() }}

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
            <a class="btn btn-small btn-primary" href="{{ route('recibos.edit',$value->id) }}">Modificar</a>
            <a class="btn btn-small btn-success generar_recibo" data-id="{{ $value->id}}">Imprimir</a>





        </td>
    </tr>
    @endforeach
    </tbody>
</table>

{{ $recibos->links() }}
@include('recibos.modal')
@stop