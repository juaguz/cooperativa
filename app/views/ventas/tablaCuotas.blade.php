<style>
    input{
        margin-bottom: 10px;
    }
</style>
<div class="col-sm-8">

@for ($i = 1; $i <= $cantCuotas; $i++)
<div class="col-sm-6">
    <div class="panel panel-primary ">
        <div class="panel-heading">
            Nro de Cuota: {{ $i }}
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="form-group">

                        <label for="cuota[{{ $i }}][importe]"  class="col-sm-4 control-label">Importe</label>
                        <div class="col-sm-5">
                            <input name="cuota[{{ $i }}][importe]" class="form-control" value="{{ $montoPorCuota }}">
                         </div>

                </div>
            </div>
            <div class="row">
                <div class="form-group">
                        <label for="cuota[{{ $i }}][fecha_vencimiento]"  class="col-sm-4 control-label">Fecha Vto</label>
                        <div class="col-sm-5">
                            <input name="cuota[{{ $i }}][fecha_vencimiento]" class="form-control fecha" value="">
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endfor
</div>
<script>
    $('.fecha').datepicker({"language":'es'});
</script>