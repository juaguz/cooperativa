@extends ('header')
@section ('title') Listado de Servicios @stop
@section ('content')

@include('servicios.tabla')

{{ $servicios->links() }}

@stop