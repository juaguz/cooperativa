@extends ('header')
@section('scripts')
<style>
    .persona {
        display: none;

    }

    .vehiculo {
        display: none;
    }
</style>

@section('jquery')
        var files = new Array();//Variable global para almacenar la data de archivos

        cambiarBusqueda();

        $('input[type=file]').change(function(event){
            files = event.target.files;
        });


        $("#enviar_cese").click(function (event) {

                var data = new FormData();
                var sIdFrm = "#frm_cesar";
                var datosFrm = $(sIdFrm).serializeArray();
                var id = $("#id_oficio").val();
                $.each(files, function (key, value) {
                    console.log(key);
                    data.append("escaneo_cese", value);
                });
                $.each(datosFrm, function (key, object) {
                    data.append(object.name, object.value);
                });

                $.ajax({
                    url: "{{ route('oficios.cesar') }}",
                    type: 'POST',
                    data: data,
                    cache: false,
                    processData: false,
                    contentType: false,
                    success: function (oJson) {
                        socket.emit("oficio_sin_efecto",{id_oficio:id});
                        window.location.reload();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    }
                });
        });
        $("#buscar_por").change(function () {
            cambiarBusqueda();
        });
        $(".abrir_modal").click(function(){
           var valor = $(this).attr('data-id');
           $("#id_oficio").val(valor);
        });
@stop

    <script type="application/javascript">

    //Captura los archivos
    function prepareUpload(event) {
        files = event.target.files;
    }

    function cambiarBusqueda() {
        var valor = $("#buscar_por").val();

        if (valor == "vehiculos") {
            $(".persona").hide();
            $(".persona :input").attr("disabled", "disabled");

            $(".vehiculo").show();
            $(".vehiculo :input").removeAttr("disabled");


        } else if (valor == 0) {
            $(".persona").hide();
            $(".vehiculo").hide();
            $(".persona :input").attr("disabled", "disabled");
            $(".vehiculo :input").attr("disabled", "disabled");
        }else{
            $(".vehiculo").hide();
            $(".vehiculo :input").attr("disabled", "disabled");

            $(".persona").show();
            $(".persona :input").removeAttr("disabled");
        }
    }
</script>
@section('breadcrumb')
<li>Listados</li>
@stop
@stop
@section ('content')
<h3>Listado de Requerimientos</h3>
<div class="row">
    {{ Form::open(array('method'=>'post','url'=>route('oficios.buscar'))) }}
    <div class="form-group">
        <div class="col-md-3">
            {{ Form::label('buscar_por','Buscar Por:') }}
            {{ Form::select('buscar_por',[""=>"",'personas'=>'Buscar por Personas','vehiculos'=>'Vehículos'],isset($data["buscar_por"]) ? $data["buscar_por"] : null,array('class'=>'form-control') ) }}
        </div>
        <div class="col-md-3">
            {{ Form::label('fecha_desde', 'Fecha Desde:') }}
            {{ Form::text( 'fecha_desde',isset($data["fecha_desde"]) ? $data["fecha_desde"]:null, array('placeholder' => '', 'class' =>'form-control fecha')) }}
        </div>

        <div class="col-md-3">
            {{ Form::label('fecha_hasta', 'Fecha Hasta:') }}
            {{ Form::text( 'fecha_hasta',isset($data["fecha_hasta"]) ? $data["fecha_hasta"]:null, array('placeholder' => '', 'class' =>'form-control fecha')) }}
        </div>
        <div class="col-md-3">
            {{ Form::label('jurisdiccion', 'Jurisdicción:') }}
            {{ Form::select( 'jurisdiccion',["0"=>""]+$comboProvincia,isset($data['jurisdiccion']) ?  $data['jurisdiccion']:null, array('placeholder' => '', 'class' =>'form-control'))
            }}
        </div>
        <div class="col-md-3">
            {{ Form::label('tipo_medida', 'Tipo Medida:') }}
            {{ Form::select( 'tipo_medida',["0"=>""]+$comboTipoOficios,isset($data['tipo_medida']) ?  $data['tipo_medida']:null , array('placeholder' => '', 'class'=>'form-control')) }}
        </div>

        <!-- Datos Persona -->

        <div class="persona">
            <div class="col-md-3">
                {{ Form::label('nombre', 'Nombre:') }}
                {{ Form::text( 'nombre',isset($data['nombre']) ? $data['nombre']:null , array('placeholder' => '', 'class' =>'form-control ')) }}
            </div>
            <div class="col-md-3">
                {{ Form::label('apellido', 'Apellido:') }}
                {{ Form::text( 'apellido',isset($data['nombre']) ? $data['apellido']:null, array('placeholder' => '', 'class' =>'form-control ')) }}
            </div>
            <div class="col-md-3">
                {{ Form::label('nro_documento', 'N° Documento:') }}
                {{ Form::text( 'nro_documento',isset($data['nro_documento']) ? $data['nro_documento']:null,array('placeholder' => '', 'class' =>'form-control ')) }}
            </div>
        </div>

        <!-- Datos Vehiculo -->


        <div class="vehiculo">
            <div class="col-md-3">
                {{ Form::label('dominio','Dominio:') }}
                {{ Form::text( 'dominio',isset($data['dominio']) ? $data['dominio']:null , array('placeholder' => '', 'class' =>'form-control')) }}
            </div>
            <div class="col-md-3">
                {{ Form::label('apellido_titular', 'Apellido Titular:') }}
                {{ Form::text( 'apellido_titular',isset($data['apellido_titular']) ? $data['apellido_titular']:null , array('placeholder' => '', 'class' =>'form-control')) }}
            </div>
        </div>


        <!-------------------->

        <div class="col-md-3">
            {{ Form::label('vigente', 'Oficio Vigente:') }}
            {{ Form::select( 'vigente',["0"=>"","1"=>'Si',"2"=>'No'] ,isset($data['vigente'])?$data['vigente']:null, array('placeholder' => '', 'class' =>'form-control')) }}
        </div>
        <div class="col-md-3">

            <button class="btn btn-primary" style="margin-top:1.6em!important "><i class="fa fa-search"></i> </button>
            {{ Form::close() }}
        </div>
    </div>
</div>

<table class="table responsive table-bordered table-hover table-striped" style="margin-top: 1em !important">
    <thead>
    <tr>
        <td>Tipo de Medida</td>
        <td>Fecha</td>
        <td>Estado</td>
        <td>Acciones</td>

    </tr>

    </thead>
    <tbody>
    @foreach ($oficios as $oficio)
    <tr class="{{ ($oficio->estado==2)? 'danger' : 'info' }}">
        <td>{{ $oficio->tipo->descripcion }}</td>
        <td>{{ $oficio->fecha_oficio }}</td>
        <td>{{ $oficio->estadoOficio->descripcion }}</td>
        <td>
            @if ( (Auth::user()->id_perfil == 1)  and ($oficio->estado !=2) )
            <a href='{{ route($oficio->tipo->ruta.".edit",$oficio->id) }}' class=" tooltip-test"  data-toggle="tooltip" data-placement="top"   title="Editar Requerimiento"><i class="fa fa-pencil"></i></a>
            @else
            <a href='{{ route($oficio->tipo->ruta.".show",$oficio->id) }}' class=" tooltip-test"  data-toggle="tooltip" data-placement="top" title="Ver Reporte"><i class="fa fa-eye"></i></a>

            @endif
            @if ( (Auth::user()->id_perfil == 1))
            <a href='{{ route("oficios.log",$oficio->id) }}' class=" tooltip-test"  data-toggle="tooltip" data-placement="top"   title="Seguimiento del Oficio"><i class="fa fa-bookmark"></i></a>
            @endif
            <a href='{{ route($oficio->tipo->ruta.".pdf",$oficio->id) }}' target="_blank" class=" tooltip-test"  data-toggle="tooltip" data-placement="top" title="Descargar Reporte"><i class="fa fa-download"></i></a>
            @if ( ($oficio->estado == 1) and ((Auth::user()->id_perfil != 2)   ))
                <a href='#'  data-id='{{$oficio->id }}' class="abrir_modal tooltip-test"   data-toggle="tooltip" data-placement="top"  title="Dejar Sin Efecto">
                <i class="fa fa-minus-circle" data-toggle="modal"data-target="#myModal"></i></a>
            @endif
        </td>
    </tr>
    @endforeach

    </tbody>

</table>
{{ $oficios->links(); }}
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Cesar Oficio</h4>
            </div>
            <div class="modal-body">
                {{ Form::open(array('name'=>'frm_cesar','id'=>'frm_cesar','route'=>'oficios.cesar','file'=>'true')); }}

                {{ Form::label('fecha_cese','Fecha de Sin Efecto:') }}
                {{ Form::text('fecha_cese',null,array('placeholder' => '', 'class' =>'form-control fecha')) }}
                {{ Form::label('escaneo_cese','Oficio de Cese:') }}
                {{ Form::file('escaneo_cese',null,array('placeholder' => '', 'class' =>'form-control')) }}
                {{ Form::hidden('id_oficio',null,array('id'=>'id_oficio','placeholder' => '', 'class' =>'form-control')) }}

            </div>
            <div class="modal-footer">
                <button type="button" id="enviar_cese" class="btn btn-primary">Guardar</button>
                {{ Form::close(); }}
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>

            </div>
        </div>
    </div>
</div>


@stop
