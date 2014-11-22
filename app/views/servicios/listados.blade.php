@extends ('header')
@section ('title') Listado de Servicios @stop
@section ('content')
<a  href="{{ route('servicios.create') }}" class="btn btn-default">Vender Servicio</a>
@include('servicios.tabla')

{{ $servicios->links() }}

@stop