@extends ('header')
@section('scripts')
<style>
    .row {
        margin-top: 5px !important;
    }
</style>
@stop
@section ('content')
@include('errores')

{{ Form::model(isset($descripcion)? $descripcion:null ,$form_data, array('role' => 'form')) }}

<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('descripcion', 'Descripción') }}
        {{ Form::text('descripcion', null, array('placeholder' => 'Ingrese Descripcion', 'class' => 'form-control')) }}
    </div>
</div>
<div class="row">
    <div class="form-group col-md-4">
        {{ Form::button($action." »", array('type' => 'submit', 'class' => 'btn btn-primary')) }}
    </div>
</div>
{{ Form::close() }}


@stop
