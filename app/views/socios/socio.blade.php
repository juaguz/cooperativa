@extends('header')
@section('scripts')
{{ HTML::script('assets/js/ordenes_pago/prestamos.js') }}
@stop
@section('content')
<div class="panel panel-default">
    <div class="panel-tab clearfix">
        <ul class="tab-bar">
            <li class="active"><a href="#datoSocio" data-toggle="tab"><i class="fa fa-user"></i> Datos del Socio</a></li>
            <li><a href="#familiares" data-toggle="tab"><i class="fa fa-users"></i> Familiares</a></li>
            <li><a href="#prestamos" data-toggle="tab"><i class="fa fa-dollar"></i> Prestamos</a></li>
            <li><a href="#circulos" data-toggle="tab"><i class="fa fa-circle-o"></i> Circulos</a></li>
            <li><a href="#rifas" data-toggle="tab"><i class="fa fa-ticket"></i> Rifas</a></li>
            <li><a href="#ventas" data-toggle="tab"><i class="fa fa-money"></i> Ventas</a></li>
            <li><a href="#ordenes" data-toggle="tab"><i class="fa fa-folder-o"></i> Ordenes de Compra</a></li>
            <li><a href="#ordenes" data-toggle="tab"><i class="fa fa-folder-o"></i> Bonos</a></li>
            <li><a href="#futbol" data-toggle="tab"><i class="fa fa-futbol-o"></i> Peña de Futbol</a></li>
            <li><a href="#pesca" data-toggle="tab"><i class="fa fa-anchor"></i> Peña de Pesca</a></li>
        </ul>
    </div>
    <div class="panel-body">
        <div class="tab-content">
            <div class="tab-pane fade in active" id="datoSocio">
                @include('socios.contenido_tabs.formulario')
            </div>
            <div class="tab-pane fade" id="familiares">
                @include('socios.contenido_tabs.familiares')
            </div>
            <div class="tab-pane fade" id="prestamos">
              @include('prestamos.tabla',["prestamos"=>$socio->getPrestamos])
            </div>
            <!--<div class="tab-pane fade" id="circulos">
            </div>-->
            <div class="tab-pane fade" id="rifas">
                <table class="table">
                    <thead>
                        <td>Nombre Rifas</td>
                        <td>Numeros</td>
                    </thead>
                    <tbody>
                        @foreach($socio->getRifas as $rifaSocio)
                        <tr>
                            <td>{{$rifaSocio->rifa->nombre}}</td>
                            <td>
                                @include('rifas.listado_numeros',$rifaSocio)
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="ventas">
              @include('ventas.tabla',["ventas"=>$socio->getVentas])
            </div>
            <div class="tab-pane fade" id="futbol">
              @include('servicios.tabla',["servicios"=>$socio->getFutbol])
            </div>
            <div class="tab-pane fade" id="pesca">
              @include('servicios.tabla',["servicios"=>$socio->getPesca])
            </div>
        </div>
    </div>
</div>
@stop
@include('prestamos.modal')