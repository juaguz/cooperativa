@extends('header')
@section('content')
<div class="panel panel-default">
    <div class="panel-tab clearfix">
        <ul class="tab-bar">
            <li class="active"><a href="#datoSocio" data-toggle="tab"><i class="fa fa-user"></i> Datos del Socio</a></li>
            <li><a href="#familiares" data-toggle="tab"><i class="fa fa-users"></i> Familiares</a></li>
            <li><a href="#prestamos" data-toggle="tab"><i class="fa fa-money"></i> Prestamos</a></li>
            <li><a href="#circulos" data-toggle="tab"><i class="fa fa-circle-o"></i> Circulos</a></li>
        </ul>
    </div>
    <div class="panel-body">
        <div class="tab-content">
            <div class="tab-pane fade in active" id="datoSocio">
                @include('socios.contenido_tabs.formulario');
            </div>
            <div class="tab-pane fade" id="familiares">
                @include('socios.contenido_tabs.familiares');
            </div>
            <div class="tab-pane fade" id="prestamos">
              @include('prestamos.tabla',["prestamos"=>$socio->getPrestamos]);
            </div>
            <div class="tab-pane fade" id="circulos">
                @include('circulos.tabla',["circulos"=>$socio->getCirculos]);
            </div>
        </div>
    </div>
</div>
@stop