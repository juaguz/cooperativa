Socio:{{$orden->socio->nombre}} {{$orden->socio->apellido}} N° {{$orden->socio->nro_legajo}}
<br>
@if(isset($orden->importe) && $orden->importe>0)
    Importe de  {{$orden->importe}}
@endif
<br>
Comercio: {{$orden->comercio->nombre}}
<br>
Dirección: {{$orden->comercio->direccion}}




