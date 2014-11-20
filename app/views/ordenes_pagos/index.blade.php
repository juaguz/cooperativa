@extends('header')
@section('scripts')
    {{ HTML::script('assets/js/ordenes_pagos.js') }}
@stop
@section('content')

<a href="{{ route('ordenes.pagos.create') }}"><button class="btn btn-default" >Nueva Orden de Pago </button></a>

<h2>Listados de OP</h2>
{{ Form::model(isset($busqueda) ? $busqueda : null,["method"=>"GET"]) }}
<div class="row" id="busqueda">
    <div class="col-md-2">
        {{ Form::text('id',null,array('class'=>'form-control','type'=>'text','placeholder'=>'Ingrese Nro de OP')) }}
    </div>

    <div class="col-md-2">
        <button class="btn btn-success">Buscar</button>
    </div>

</div>
{{ Form::close() }}



    <table class="table table-responsive table-bordered">
        <thead>
            <th>0rden de Pago</th>
            <th>Fecha</th>
            <th>Concepto</th>
            <th>Monto</th>
            <th>Acciones</th>
        </thead>
        <tbody>
            @foreach($ordenes as $orden)
                <tr>
                    <td>{{$orden->id}}</td>
                    <td>{{$orden->fecha}}</td>
                    <td>{{$orden->concepto}}</td>
                    <td>{{$orden->importe}}</td>
                    <td>
                        <a href="{{route('ordenes.pagos.edit',$orden->id)}}" class="btn btn-primary">Modificar</a>
                        <a class="btn btn-small btn-success generar_orden" data-toggle="modal" data-url="{{route('ordenes.pagos.comprobante',$orden->id)}}" data-target="#modalOrdenPago" href="#" data-id="{{$orden->id}}">Imprimir</a>
                    </td>

                </tr>
            @endforeach
        </tbody>

    </table>
{{$ordenes->links()}}
@stop
@include('ordenes_pagos.modal')
