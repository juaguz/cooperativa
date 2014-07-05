@extends ('header')
@section('scripts')
<style>
    .row {
        margin-top: 5px !important;
    }
</style>
@stop
@section ('content')
<h2>Panel De Administración</h2>
<h3>Usuarios</h3>
<hr>
<div class="row">
    <a href="{{ route('usuarios.create') }}" ><button class="btn btn-primary" >Cargar Usuario <i class="glyphicon glyphicon-user"></i></button></a>
    <a href="{{ route('usuarios.index') }}"><button class="btn btn-primary" >Listado De Usuarios  <i class="glyphicon glyphicon-list-alt"></i></button></a>
    <a href="{{ route('usuarios.clave') }}"><button class="btn btn-primary" >Cambiar Clave  <i class="glyphicon glyphicon-lock"></i></button></a>
</div>







@stop
