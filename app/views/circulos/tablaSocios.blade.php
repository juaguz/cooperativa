<style>
    input{
        margin-bottom: 10px;
    }
</style>
<div class="col-sm-8">

@for ($i = 1; $i <= $cantSocios; $i++)
<div class="col-sm-6">
    <div class="panel panel-primary ">

        <div class="panel-body">
            <div class="row">
                <div class="form-group">
                        <label for="socio[{{$i}}][id_socio]"  class="col-sm-4 control-label">Socio</label>
                        <div class="col-sm-12">
                            {{ Form::select('socio[$i][id_socio]',$socios,null,['class'=>'form-control select2']) }}
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
    $('.select2').select2();
</script>