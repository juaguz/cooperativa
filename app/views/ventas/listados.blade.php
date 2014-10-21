@extends ('header')
@section ('title') Listado de Ventas @stop
@section ('content')

@include('ventas.tabla')

{{ $ventas->links() }}

@stop