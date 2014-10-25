<h2>Listados de Prestamos</h2>
<table class="table table-hover">
    <thead>
    <tr>
        <th>Socio</th>
        <th>Monto</th>
        <th>Interes</th>
        <th>Cantidad de Cuotas</th>
        <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    @foreach($prestamos as $key => $value)
    <tr>
        <td>{{ $value->socio->nombre }} {{ $value->socio->apellido }} {{ $value->socio->nro_legajo }}</td>
        <td>{{ $value->monto }}</td>
        <td>{{ $value->interes }}</td>
        <td>{{ $value->cantidad_cuotas }}</td>

        <!-- we will also add show, edit, and delete buttons -->
        <td>

            <!-- delete the nerd (uses the destroy method DESTROY /nerds/{id} -->
            <!-- we will add this later since its a little more complicated than the other two buttons -->

            <!-- show the nerd (uses the show method found at GET /nerds/{id} -->
            <a class="btn btn-small btn-info" href="{{ route('prestamos.edit',$value->id)}}">Editar</a>
            <a class="btn btn-small btn-info generar_orden" data-toggle="modal" data-target="#modalPrestamos" href="#" data-id="{{$value->id}}">Imprimir Orden de Pago</a>





        </td>
    </tr>
    @endforeach
    </tbody>
</table>
