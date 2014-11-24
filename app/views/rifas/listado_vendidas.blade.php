<div class="row">
        <div class="col-md-12">
                <h4 class="headline">
                    Rifas Vendidas
                    <span class="line"></span>
                </h4>
                <div class="panel panel-default">
                    <div class="seperator"></div>
                    <div class="panel-body">
                       <div class="row" style="margin-bottom:5px">
                            <div class="col-md-2">
                                <input class="form-control" id="nroBuscar" placeholder="Buscar Nro...">
                            </div>
                            <div class="col-md-2">
                                <button class="btn btn-primary" id="buscar" data-url="{{route("rifas.buscar",$idRifa)}}">Buscar »</button>
                            </div>
                            <div class="col-md-2"></div>

                             @if($rifa->ganador == 0)
                                 <div class="col-md-2">
                                    <input class="form-control" id="nroGanador" name="ganador" placeholder="Asignar Nro Ganador..." >
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-primary" id="guardarNumero" data-url="{{route("rifas.asignar.ganador",$idRifa)}}">Aceptar »</button>
                                    <button class="btn btn-info"    id="buscarNumeroGanador" data-url="{{route("rifas.buscar",$idRifa)}}">Buscar Numero »</button>
                                </div>
                            @else
                                <div class="col-md-2">
                                    <input class="form-control" id="nroGanador" name="ganador" value="{{$rifa->ganador}}" placeholder="Asignar Nro Ganador..."  readonly >
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-info"    id="buscarNumeroGanador" data-url="{{route("rifas.buscar",$idRifa)}}">Buscar Numero »</button>
                                </div>
                            @endif

                       </div>


                    @if($rifasSocios->count() > 0)
                    <table class="table table-responsive">
                        <thead>
                            <td>Socio</td>
                            <td>Numeros</td>
                            <td>Fecha</td>
                            <td>Cuotas</td>
                        </thead>
                        <tbody>
                            @foreach($rifasSocios as $rifaSocio)
                            <tr>
                                <td>{{$rifaSocio->socio->nombre}} {{$rifaSocio->socio->apellido}} {{$rifaSocio->socio->nro_legajo}}</td>
                                <td>
                                    @include('rifas.listado_numeros')
                                </td>
                                <td>{{$rifaSocio->created_at}}</td>
                                <td><button class="btn btn-primary cuotas_rifas" data-url="{{route('rifas.cuotas')}}" data-id_rifa_socio="{{$rifaSocio->id}}">Cuotas</button></td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    @else
                        <p>Todavía no se vendieron rifas</p>
                    @endif
                    <div class="seperator"></div>
                    </div>
                </div>
            </div>
    </div>

    @include('rifas.modal_cuotas')