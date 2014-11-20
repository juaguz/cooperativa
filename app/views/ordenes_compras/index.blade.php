@extends('header')
@section('scripts')
    {{ HTML::script('assets/js/ordenes_compras.js') }}
@stop
@section('content')
<a href="{{ route('ordenes.compras.create') }}"><button class="btn btn-default" >Nueva Orden de Compra </button></a>

<h2>Listados de Ordenes de Compra</h2>
{{ Form::model(isset($busqueda) ? $busqueda : null,["method"=>"GET"]) }}
<div class="row" id="busqueda">
    <div class="col-md-2">
        {{ Form::text('id',null,array('class'=>'form-control','type'=>'text','placeholder'=>'Ingrese Nro de OC')) }}
    </div>

    <div class="col-md-2">
        <button class="btn btn-success">Buscar</button>
    </div>

</div>
{{ Form::close() }}
    @include('ordenes_compras.tabla')
@stop
@include('ordenes_compras.modal')