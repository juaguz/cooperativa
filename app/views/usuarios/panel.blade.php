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
<div class="panel panel-info">
    <div class="panel-heading">Admin de Usuarios</div>
    <div class="panel-body">
    <div class="row">
        <div class="form-group col-md-10">
            <a href={{ route('usuarios.create') }} ><button class="btn btn-primary" >Cargar Usuario <i class="glyphicon glyphicon-user"></i></button></a>
            <a href={{ route('usuarios.index') }} ><button class="btn btn-primary" >Listado De Usuarios  <i class="glyphicon glyphicon-list-alt"></i></button></a>
            <a href={{ route('usuarios.clave') }}"><button class="btn btn-primary" >Cambiar Clave  <i class="glyphicon glyphicon-lock"></i></button></a>
        </div>
    </div>
   </div>
 </div>

<div class="panel panel-info">
    <div class="panel-heading">Lista de Correos</div>
    <div class="panel-body">
        <div class="row">
            <div class="form-group col-md-10">
                <a href=><button class="btn btn-info " >Cargar Mail <i class="glyphicon glyphicon-envelope"></i></button></a>
                <a href><button class="btn btn-info " >Listado De Mails  <i class="glyphicon glyphicon-list-alt"></i></button></a>
            </div>
        </div>
    </div>
</div>

@stop
