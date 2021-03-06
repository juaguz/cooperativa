<a  href="{{ route('ventas.create') }}" class="btn btn-default">Nueva Venta</a>



<h2>Listados de Ventas</h2>



<table class="table table-hover">
    <thead>
    <tr>
        <th>Socio</th>
        <th>Descripción</th>
        <th>Monto</th>
        <th>Interes</th>
        <th>Cantidad de Cuotas</th>
        <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    @foreach($ventas as $key => $value)
    <tr>
        <td>{{ $value->socio->nombre }} {{ $value->socio->apellido }} {{ $value->socio->nro_legajo }}</td>
        <td>{{ $value->descripcion }}</td>
        <td>{{ $value->monto }}</td>
        <td>{{ $value->interes }}</td>
        <td>{{ $value->cantidad_cuotas }}</td>

        <!-- we will also add show, edit, and delete buttons -->
        <td>

            <!-- delete the nerd (uses the destroy method DESTROY /nerds/{id} -->
            <!-- we will add this later since its a little more complicated than the other two buttons -->

            <!-- show the nerd (uses the show method found at GET /nerds/{id} -->
            <a class="btn btn-small btn-primary" href="{{ route('ventas.edit',$value->id) }}">Ingresar</a>





        </td>
    </tr>
    @endforeach
    </tbody>
</table>