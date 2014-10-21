@extends('header')
<style>
    .rifas{
        margin-top:10px !important;
    }
</style>
@section('content')
    <div class="row">
        <div class="col-md-12">
                <h4 class="headline">
                    Rifas Vendidas
                    <span class="line"></span>
                </h4>
                <div class="panel panel-default">
                    <div class="seperator"></div>
                    <div class="panel-body">
                    <table class="table table-responsive">
                        <thead>
                            <td>Socio</td>
                            <td>Numeros</td>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Socio</td>
                                <td>1,2,3,4,5,6</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="seperator"></div>
                    </div>
                </div>
            </div>
    </div>
    {{Form::open(["route"=>["rifas.venta",$idRifa],"method"=>"POST"])}}
    <div class="row">
            <div class="col-md-12">
                    <h4 class="headline">
                        Vender Rifas
                        <span class="line"></span>
                    </h4>
                    <div class="panel panel-default">
                        <div class="seperator"></div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <label>Seleccione Socio</label>
                                    {{Form::select('id_socio',$socios,null,["class"=>"form-control select2"])}}
                                </div>
                                <div class="col-md-4">
                                    <div class="row rifas">
                                        <label>Seleccione N°1</label>

                                        {{Form::select('numero[]',$rangoRifas,null,["class"=>"form-control"])}}
                                    </div>
                                    <div class="row rifas">
                                        <label>Seleccione N°2</label>
                                        {{Form::select('numero[]',$rangoRifas,null,["class"=>"form-control"])}}
                                    </div>

                                    <div class="row rifas">
                                        <label>Seleccione N°3</label>
                                        {{Form::select('numero[]',$rangoRifas,null,["class"=>"form-control"])}}
                                    </div>
                                </div>
                            </div>
                        <div class="seperator"></div>

                        </div>
                        <div class="panel-footer">
                            <button class="btn btn-primary">Guardar »</button>
                        </div>
                    </div>
                </div>
        </div>
        {{Form::close()}}

@stop