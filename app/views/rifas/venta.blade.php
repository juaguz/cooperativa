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
                                <div class="col-md-5">
                                    <label>Seleccione Socio</label>
                                    <select class="select2"></select>
                                </div>
                                <div class="col-md-5">
                                    <div class="row rifas">
                                        <label>Seleccione N°1</label>
                                        <select class="select2" name="numero[]"></select>
                                    </div>
                                    <div class="row rifas">
                                        <label>Seleccione N°2</label>
                                        <select class="select2" name="numero[]"></select>
                                    </div>

                                    <div class="row rifas">
                                        <label>Seleccione N°3</label>
                                        <select class="select2" name="numero[]"></select>
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

@stop