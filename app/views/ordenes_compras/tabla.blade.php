<table class="table table-bordered">
        <thead>
            <th>Nro Orden</th>
            <th>Socio</th>
            <th>Comercio</th>
            <th>Importe</th>
            <th>Acciones</th>
        </thead>
        <tbody>
        @foreach($ordenes as $orden)
            <tr>
                <td>{{$orden->id}}</td>
                <td>{{$orden->socio->nombre}} {{$orden->socio->apellido}} {{$orden->socio->nro_legajo}}</td>
                <td>{{$orden->comercio->nombre}} {{$orden->comercio->direccion}}</td>
                <td>{{$orden->importe}}</td>
                <td>
                    <a href="{{route('ordenes.compras.edit',$orden->id)}}" class="btn btn-primary">Editar</a>
                    <a class="btn btn-small btn-info generar_orden_venta" data-toggle="modal" data-target="#modalOrdenVenta" href="#" data-id="{{$orden->id}}">Imprimir Orden de Pago</a>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>