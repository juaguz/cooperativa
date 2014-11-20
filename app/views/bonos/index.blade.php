@extends('header')
@section('scripts')
    {{ HTML::script('assets/js/bonos.js') }}
@stop
@section('content')

<a href="{{ route('bonos.create') }}"><button class="btn btn-default" >Nuevo Bono </button></a>

<h2>Listados de Bonos</h2>
{{ Form::model(isset($busqueda) ? $busqueda : null,["method"=>"GET"]) }}
<div class="row" id="busqueda">
    <div class="col-md-2">
        {{ Form::text('id',null,array('class'=>'form-control','type'=>'text','placeholder'=>'Ingrese Nro de Bono')) }}
    </div>

    <div class="col-md-2">
        <button class="btn btn-success">Buscar</button>
    </div>

</div>
{{ Form::close() }}
    @include('bonos.tabla')
@stop
@include('bonos.modal')