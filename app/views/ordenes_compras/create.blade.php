@extends('header')
@section('scripts')

{{ HTML::script('assets/js/ordenes_compras.js') }}

@stop
@section('content')
  {{ Form::model(isset($orden) ? $orden : null,$form_data, array('role' => 'form')) }}
    <div class="row">
        <div class="form-group col-md-4">
            {{ Form::label('id_socio', 'Socio') }}
            {{ Form::select('id_socio',$socios ,null,array('class' => 'form-control select2','id'=>'')) }}
        </div>
        <div class="form-group col-md-4">
            {{ Form::label('id_comercio', 'Comercio') }}
            {{ Form::select('id_comercio',$comercios ,null,array('class' => 'form-control select2','id'=>'')) }}
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-4">
            {{ Form::label('importe', 'Importe') }}
            {{ Form::text('importe',null,array('class' => 'form-control onlynumber')) }}
        </div>
        <div class="form-group col-md-4">
            {{ Form::label('fecha_vencimiento', 'Fecha de Vencimiento') }}
            {{ Form::text('fecha_vencimiento', null, array('placeholder' => '', 'class' => 'form-control fecha')) }}
        </div>
    </div>
    <button class="btn btn-primary" type="submit"> Guardar </button>
    @if(isset($orden))
    <a class="btn btn-small btn-success generar_orden_venta" data-toggle="modal" data-target="#modalOrdenVenta" href="#" data-id="{{$orden->id}}">Imprimir Orden de Compra</a>
    @endif
  {{Form::close()}}
@include('ordenes_compras.modal')

@stop