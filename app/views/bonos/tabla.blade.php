<table class="table table-bordered">
        <thead>
            <th>Nro Bono</th>
            <th>Socio</th>
            <th>Comercio</th>
            <th>Importe</th>
            <th>Acciones</th>
        </thead>
        <tbody>
        @foreach($bonos as $bono)
            <tr>
                <td>{{$bono->id}}</td>
                <td>{{$bono->socio->nombre}} {{$bono->socio->apellido}} {{$bono->socio->nro_legajo}}</td>
                <td>{{$bono->comercio->nombre}} {{$bono->comercio->direccion}}</td>
                <td>{{$bono->importe}}</td>
                <td>
                    <a href="{{route('bonos.edit',$orden->id)}}" class="btn btn-primary">Editar</a>
                    <a class="btn btn-small btn-info generar_bono" data-toggle="modal" data-target="#modalBono" href="#" data-id="{{$bono->id}}">Imprimir Bono</a>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>