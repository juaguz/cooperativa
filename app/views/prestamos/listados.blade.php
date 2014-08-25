@extends ('header')
@section ('title') Listado de Prestamos @stop
@section ('content')

@include('prestamos.tabla')

{{ $prestamos->links() }}

@stop