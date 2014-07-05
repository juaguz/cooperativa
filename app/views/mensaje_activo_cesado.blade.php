@if (isset($oficios))


@endif
@if (isset($oficios) and ($oficios->estado==1) )

<div class="alert alert-success">
    <b>
        &nbsp; Estado:Vigente
        <p class="pull-left"> &nbsp;Usuario que Cargo el Requerimiento: {{ $oficios->user->nombre }} {{ $oficios->user->apellido }} </p>

        <p class="pull-right">&nbsp;Fecha de Carga: {{ $oficios->created_at }}</p>
        <p class="pull-right">&nbsp;Requerimento N°: {{ $oficios->id }}</p>
    </b></div>
@elseif (isset($oficios) and ($oficios->estado==2) )
<div class="alert alert-danger"><b> Estado: Sin Efecto</b>

    {{ $oficios->oficioCesado->user->nombre }} {{ $oficios->oficioCesado->user->nombre }}
    <br>
    Fecha en la que quedo sin Efecto:
    {{ $oficios->oficioCesado->fecha_cese }}

    @if (!empty($oficios->oficioCesado->path ))
        @if(Request::segment(2) !="pdf")
            <a class=""  target="_blank" href="{{ URL::asset($oficios->oficioCesado->path ) }}"> Descargar Archivo de Cese </a>
        @endif
    @else
        <p class="pull-left" > Archivo de Cese No Cargado. &nbsp;</p>
    @endif
    <p class="pull-right">&nbsp;Requerimento N°: {{ $oficios->id }}</p>
</div>



@endif