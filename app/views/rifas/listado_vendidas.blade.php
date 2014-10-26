<div class="row">
        <div class="col-md-12">
                <h4 class="headline">
                    Rifas Vendidas
                    <span class="line"></span>
                </h4>
                <div class="panel panel-default">
                    <div class="seperator"></div>
                    <div class="panel-body">
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