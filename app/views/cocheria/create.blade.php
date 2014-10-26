@extends ('header')


@section ('title') {{$action}} Factura @stop

@section ('content')


{{ Form::model(isset($factura) ? $factura : null,$form_data, array('role' => 'form')) }}

<div class="row">

    <div class="form-group col-md-4">
        {{ Form::label('fecha', 'Fecha de Factura') }}
        {{ Form::text('fecha', null, array('placeholder' => '', 'class' => 'form-control fecha','required'=>'required')) }}
    </div>
    <div class="form-group col-md-4">
        {{ Form::label('fecha_defuncion', 'Fecha de Defunción') }}
        {{ Form::text('fecha_defuncion', null, array('placeholder' => '', 'class' => 'form-control fecha','required'=>'required')) }}
    </div>

</div>
<div class="row">

    <div class="form-group col-md-4">
        {{ Form::label('id_socio', 'Socio') }}
        {{ Form::select('id_socio',$sociosCocheria ,null, array('placeholder' => '','class' => 'form-control select2','required'=>'required')) }}
    </div>

    <div class="form-group col-md-4">
        {{ Form::label('id_familiar', 'Familiar') }}
        {{ Form::select('id_familiar',isset($familiaresCombo) ? $familiaresCombo:[] ,null, array('placeholder' => '', 'class' => 'form-control')) }}
    </div>
</div>


<div class="row">
    <div class="form-group col-md-4">
        {{ Form::label('importe', 'Importe') }}
        {{ Form::text('importe', null, array('placeholder' => '', 'class' => 'form-control','required'=>'required','type'=>'number')) }}
    </div>
    <div class="form-group col-md-4">
        {{ Form::label('porcentaje', 'Porcentaje') }}
        {{ Form::text('porcentaje', null, array('placeholder' => '', 'class' => 'form-control')) }}
    </div>
</div>
<div class="row">
    <div class="form-group col-md-8">
        {{Form::label('nombre','Nombre') }}
        {{ Form::text('nombre', null, array('placeholder' => '', 'class' => 'form-control')) }}
    </div>
    <div class="form-group col-md-8">
        {{ Form::label('apellido','Apellido') }}
        {{ Form::text('apellido', null, array('placeholder' => '', 'class' => 'form-control')) }}
    </div>
</div>
<div class="row">
   <div class="form-group col-md-8">
       {{ Form::label('descripcion','Descripcion') }}
       {{ Form::textarea('descripcion', null, array('placeholder' => '', 'class' => 'form-control')) }}
   </div>

</div>
<div class="row">
    <div class="form-group col-md-8">
        {{Form::label('monto_quincenal','Monto Quincenal') }}
        {{ Form::text('monto_quincenal', null, array('placeholder' => '', 'class' => 'form-control','type'=>'number')) }}
    </div>
    <div class="form-group col-md-8">
        {{ Form::label('monto_mensual','Monto Mensual') }}
        {{ Form::text('monto_mensual', null, array('placeholder' => '', 'class' => 'form-control','type'=>'number')) }}
    </div>
</div>
<div class="row">
    <div class="form-group col-md-8">
        {{ Form::label('primer_vencimiento', 'Fecha de Vencimiento 1era Quincena') }}
        {{ Form::text('primer_vencimiento', null, array('placeholder' => '', 'class' => 'form-control fecha','required'=>'required')) }}
    </div>
    <div class="form-group col-md-8">
        {{ Form::label('segundo_vencimiento', 'Fecha de Vencimiento 2da Quincena/Mensuales') }}
        {{ Form::text('segundo_vencimiento', null, array('placeholder' => '', 'class' => 'form-control fecha','required'=>'required')) }}
    </div>
</div>

<div class="row">

    <div class="form-group col-md-4">

        {{ Form::button('Guardar', array('type' => 'submit', 'class' => 'btn btn-primary','id'=>'id_guardar')) }}
    </div>
</div>
{{ Form::close() }}
@stop

@section('scripts')
<script>
    $("#form_factura").validate({
        errorClass: "invalid",
        rules:{
            fecha:{
                required: true,
                date:true
            },
            porcentaje:{
                required:true,
                number:true
            },
            importe:{
                required:true,
                number:true
            }
        }

    });
    $("#id_socio").change(function(){
        var id = $(this).val();
        $.ajax({
           data:'id_socio='+id,
           url:"{{ route('getFamiliaresSocios') }}",
           type:"post",
           success:function(data){
               var option;
               $(data).each(function(index){
                   option+='<option value="'+data[index]["id"]+'">'+data[index]['full_name']+'</option>';

               });
               $("#id_familiar option").remove();
               $("#id_familiar").append(option);

           }
        });

    });
</script>

@stop
