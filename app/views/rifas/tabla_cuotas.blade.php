<style>
    input{
        margin-bottom: 10px;
    }
</style>
 <div class="col-sm-12" id="mensajeCorrecto" style="display: none">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Cuotas Editadas Correctamente</strong>
    </div>
 </div>
<div class="col-sm-12">

    <?php $i=0; ?>
    <form action="{{route('rifas.update.cuotas')}}" method="POST" id="formCuotasRifas">
    @foreach ($cuotas as $cuota)
    <?php $i++ ?>
    <div class="col-sm-5">
        <div class="panel panel-primary ">
            <div class="panel-heading">
                Nro de Cuota: {{ $i }}
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="form-group">

                        <label for="cuota[{{ $i }}][importe]"  class="col-sm-4 control-label">Importe</label>
                        <div class="col-sm-5">
                            <input name="cuota[{{ $i }}][importe]" class="form-control" value="{{ $cuota->importe }}">
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="cuota[{{ $i }}][fecha_vencimiento]"  class="col-sm-4 control-label">Fecha Vto</label>
                        <div class="col-sm-5">
                            <input name="cuota[{{ $i }}][fecha_vencimiento]" class="form-control fecha" value="{{ $cuota->fecha_vencimiento  }}">
                            <input type="hidden" name="cuota[{{ $i }}][id]" class="form-control fecha" value="{{ $cuota->id  }}">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <label for="cuota[{{ $i }}][nro_recibo]"  class="col-sm-4 control-label">Pagada En Cooperativa, recibo N°</label>
                        <div class="col-sm-5">
                            <input name="cuota[{{ $i }}][nro_recibo]" class="form-control" value="{{ $cuota->nro_recibo  }}">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endforeach
    </form>
</div>
<script>
    $('.fecha').datepicker({"language":'es'});
</script>