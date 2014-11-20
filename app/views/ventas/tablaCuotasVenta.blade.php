<style>
    input{
        margin-bottom: 10px;
    }
</style>
<div class="col-sm-8">
<?php $i=0; ?>

@foreach ($cuotas as $cuota)
    <?php $i++ ?>
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
        </div>
    </div>
</div>
@endforeach
</div>
<script>
    $('.fecha').datepicker({"language":'es'});
</script>