@extends('header')
@section('scripts')
    {{ HTML::script('assets/js/ordenes_compras.js') }}
@stop
@section('content')
    @include('ordenes_compras.tabla')
@stop
@include('ordenes_compras.modal')