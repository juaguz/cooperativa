@extends ('header')


@section ('title') {{$action}} socio @stop

@section ('content')
<h1>{{$action}} Socio</h1>



{{ Form::model(isset($socio) ? $socio : null,$form_data, array('role' => 'form')) }}


<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('nro_legajo', 'Legajo') }}
        {{ Form::text('nro_legajo', null, array('placeholder' => 'Ingrese el Legajo del Socio', 'class' => 'form-control')) }}

    </div>
    <div class="form-group col-md-4">
        {{ Form::label('id_tipo_socio', 'Tipo de Socio') }}
        {{ Form::select('id_tipo_socio',$tiposSocios ,null,array('class' => 'form-control','id'=>'')) }}
    </div>
</div>
<div class="row">
	<div class="form-group col-md-4">
		{{ Form::label('nombre', 'Nombre') }}
		{{ Form::text('nombre', null, array('placeholder' => 'Ingrese el Nombre del Socio', 'class' => 'form-control')) }}

	</div>

    <div class="form-group col-md-4">
		{{ Form::label('apellido', 'Apellido') }}
		{{ Form::text('apellido', null, array('placeholder' => 'Ingrese el Apellido del Socio ', 'class' => 'form-control')) }}

	</div>
</div>
<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('id_tipo_documento', 'Tipo Documento') }}
        {{ Form::select('id_tipo_documento',$tiposDocumentos ,null,array('class' => 'form-control','id'=>'')) }}
    </div>
	<div class="form-group col-md-4">
		{{ Form::label('nro_documento', 'Nro Documento') }}
		{{ Form::text('nro_documento', null, array('placeholder' => 'Ingrese el Dni del Usuario ', 'class' => 'form-control')) }}

	</div>
 </div>
<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('id_sexo', 'Sexo') }}
        {{ Form::select('id_sexo',$sexos ,null,array('class' => 'form-control','id'=>'')) }}
    </div>
    <div class="form-group col-md-4">
        {{ Form::label('fecha_nac', 'Fecha de Nacimiento') }}
        {{ Form::text('nro_documento', null, array('placeholder' => 'Ingrese Fecha de Nacimiento ', 'class' => 'form-control fecha')) }}

    </div>
</div>
<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('direccion', 'Direcci&oacute;n') }}
        {{ Form::text('direccion',null,array('placeholder' => 'Ingrese la direcci&oacute;n','class' => 'form-control')) }}
    </div>
    <div class="form-group col-md-4">
        {{ Form::label('localidad', 'Localidad') }}
        {{ Form::text('localidad', null, array('placeholder' => 'Ingrese la Localidad ', 'class' => 'form-control')) }}

    </div>
</div>
<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('tel_part', 'Tel&eacute;fono Particular') }}
        {{ Form::text('tel_part',null,array('placeholder' => 'Ingrese Tel Particular','class' => 'form-control')) }}
    </div>
    <div class="form-group col-md-4">
        {{ Form::label('tel_cel', 'Tel&eacute;fono Celular') }}
        {{ Form::text('tel_cel', null, array('placeholder' => 'Ingrese Nro de Celular ', 'class' => 'form-control')) }}

    </div>
</div>
<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('tel_lab', 'Tel&eacute;fono Laboral') }}
        {{ Form::text('tel_lab',null,array('placeholder' => 'Ingrese Tel Laboral','class' => 'form-control')) }}
    </div>
    <div class="form-group col-md-4 ">
        {{ Form::label('socio_coop', '¿Es socio de Cooperativa?') }}
        {{ Form::select('socio_coop',$sino ,null,array('class' => 'form-control','id'=>'')) }}

    </div>
</div>
<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('socio_futbol', '¿Es socio de F&uacute;tbol?') }}
        {{ Form::select('socio_futbol',$sino ,null,array('class' => 'form-control','id'=>'')) }}

    </div>
    <div class="form-group col-md-4 ">
        {{ Form::label('socio_pesca', '¿Es socio de Pesca?') }}
        {{ Form::select('socio_pesca',$sino ,null,array('class' => 'form-control','id'=>'')) }}

    </div>
</div>
<div class="row">

    <div class="form-group col-md-4">
        {{ Form::label('id_estudio', 'Estudios') }}
        {{ Form::select('id_estudio',$estudios ,null,array('class' => 'form-control','id'=>'')) }}

    </div>

</div>

<div class="row">
	
	<div class="form-group col-md-4">
		
		{{ Form::button('Guardar', array('type' => 'submit', 'class' => 'btn btn-primary','id'=>'id_guardar')) }}
	</div>
</div>
{{ Form::close() }}


@if(isset($socio))

    <h1>Familiares</h1>
    <table class="table table-responsive table-over">
        <thead>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Parentezco</th>
            <th>Acciones</th>
        </thead>
        <tbody>
        @foreach($socio->getFamiliares as $familiar)
            <tr>
                <td>{{ $familiar->nombre }}</td>
                <td>{{ $familiar->apellido }}</td>
                <td>{{ $familiar->getParentezco->descripcion }}</td>
                <td><a href="{{ route('familiares.edit',$familiar->id)  }}" class="btn btn-primary">Editar</a></td>
            </tr>
        @endforeach
        </tbody>
    </table>
    <a href="{{ route('familiares.create',$socio->id)  }}" class="btn btn-primary">Agregar Familiar</a>
@endif
@stop




@section('scripts')

@stop