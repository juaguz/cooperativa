Socio:{{$bono->socio->nombre}} {{$bono->socio->apellido}} N° {{$bono->socio->nro_legajo}}
<br>
@if(isset($bono->importe) && $bono->importe>0)
    Importe  {{$bono->importe}}
@endif
<br>
Comercio: {{$bono->comercio->nombre}}
<br>
Dirección: {{$bono->comercio->direccion}}




