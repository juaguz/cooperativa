@extends('header')
@section('scripts')
    {{ HTML::script('assets/js/bonos.js') }}
@stop
@section('content')
    @include('bonos.tabla')
@stop
@include('bonos.modal')