@extends ('header')
@section ('title') Listado de Círculos @stop

@section('style')
<style>
    #busqueda{
        margin-bottom:2%;
    }
</style>
@stop

@section ('content')
    <a href="{{ route('circulos.create') }}"><button class="btn btn-default" >Crear Círculo </button></a>
<h2>Listados de Círculos</h2>
{{ Form::model(isset($busqueda) ? $busqueda : null,["method"=>"GET"]) }}
<div class="row" id="busqueda">
    <div class="col-md-2">
        {{ Form::text('nombre',null,array('class'=>'form-control','type'=>'text','placeholder'=>'Ingrese Nombre')) }}
    </div>

    <div class="col-md-2">
        <button class="btn btn-success">Buscar</button>
    </div>

</div>
{{ Form::close() }}

@include('circulos.tablaCirculos')

{{ $circulos->appends( $busqueda )->links() }}

@stop