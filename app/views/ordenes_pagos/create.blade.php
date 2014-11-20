@extends('header')
@section('scripts')
{{ HTML::script('assets/js/ordenes_pagos.js') }}
@stop
@section('content')
{{ Form::model(isset($orden_pago) ? $orden_pago : null,$form_data, array('role' => 'form')) }}
<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('quien', 'Quien') }}
        {{ Form::text('quien',null,array('class' => 'form-control')) }}
    </div>
    <div class="form-group col-md-4">
        {{ Form::label('a_quien', 'A quien') }}
        {{ Form::text('a_quien',null,array('class' => 'form-control')) }}
    </div>
    <div class="form-group col-md-4">
        {{ Form::label('importe', 'Importe') }}
        {{ Form::text('importe',null,array('class' => 'form-control onlynumber')) }}
    </div>
    <div class="form-group col-md-4">
        {{ Form::label('fecha', 'Fecha') }}
        {{ Form::text('fecha', null, array('placeholder' => '', 'class' => 'form-control fecha')) }}
    </div>
    <div class="form-group col-md-12">
        {{ Form::label('concepto', 'Concepto') }}
        {{ Form::textarea('concepto', null, array('placeholder' => '', 'class' => 'form-control')) }}
    </div>
</div>
<button class="btn btn-primary" type="submit"> Guardar </button>
@if(isset($orden_pago))
    <a class="btn btn-small btn-info generar_orden" data-toggle="modal" data-url="{{route('ordenes.pagos.comprobante',$orden_pago->id)}}" data-target="#modalOrdenPago" href="#" data-id="{{$orden_pago->id}}">Imprimir</a>
@endif
{{Form::close()}}
@include('ordenes_pagos.modal')

@stop