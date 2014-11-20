@if(isset($recibo->importe) && $recibo->importe>0)
    Monto {{$recibo->importe}}
@endif
<br>
Responsable: {{$recibo->responsable}}
<br>
Concepto: {{$recibo->concepto}}
<br>
A quien: {{$recibo->quien}}




