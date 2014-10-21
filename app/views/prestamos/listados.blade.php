@extends ('header')
@section ('title') Listado de Prestamos @stop
@section('scripts')
{{ HTML::script('assets/js/ordenes_pago/prestamos.js') }}
@stop
@section ('content')

@include('prestamos.tabla')

{{ $prestamos->links() }}

@stop

@include('prestamos.modal')