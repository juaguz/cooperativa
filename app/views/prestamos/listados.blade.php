@extends ('header')
@section ('title') Listado de Prestamos @stop
@section('scripts')
{{ HTML::script('assets/js/ordenes_pago/prestamos.js') }}
@stop
@section ('content')

<a  href="{{ route('prestamos.create') }}" class="btn btn-default">Nuevo Préstamo</a>

<h2>Listados de Préstamos</h2>

{{ Form::model(isset($busqueda) ? $busqueda : null,["method"=>"GET"]) }}
<div class="row" id="busqueda">
    <div class="col-md-2">
        {{ Form::text('id',null,array('class'=>'form-control','type'=>'text','placeholder'=>'Ingrese Nro de Préstamo')) }}
    </div>

    <div class="col-md-2">
        <button class="btn btn-success">Buscar</button>
    </div>

</div>
{{ Form::close() }}
@include('prestamos.tabla')

{{ $prestamos->links() }}

@stop

@include('prestamos.modal')