
<a  href="{{ route('prestamos.create') }}" class="btn btn-default">Nuevo Préstamo</a>

<h2>Listados de Préstamos</h2>

{{ Form::model(isset($busqueda) ? $busqueda : null,["method"=>"GET"]) }}
<div class="row" id="busqueda">
    <div class="col-md-2">
        {{ Form::text('id',null,array('class'=>'form-control','type'=>'text','placeholder'=>'Ingrese Nro de Préstamo')) }}
    </div>

    <div class="col-md-2">
        <button class="btn btn-success">Buscar</button>
    </div>

</div>
{{ Form::close() }}
<table class="table table-hover table-bordered table-responsive">
    <thead>
    <tr>
        <th>Nro</th>
        <th>Socio</th>
        <th>Monto</th>
        <th>Cantidad de Cuotas</th>
        <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    @foreach($prestamos as $key => $value)
    <tr>
        <td>{{ $value->id }}</td>
        <td>{{ $value->socio->nombre }} {{ $value->socio->apellido }} {{ $value->socio->nro_legajo }}</td>
        <td>{{ $value->monto }}</td>
        <td>{{ $value->cantidad_cuotas }}</td>

        <!-- we will also add show, edit, and delete buttons -->
        <td>

            <!-- delete the nerd (uses the destroy method DESTROY /nerds/{id} -->
            <!-- we will add this later since its a little more complicated than the other two buttons -->

            <!-- show the nerd (uses the show method found at GET /nerds/{id} -->
            <a class="btn btn-small btn-primary" href="{{ route('prestamos.edit',$value->id)}}">Modificar</a>
            <a class="btn btn-small btn-success generar_orden" data-toggle="modal" data-target="#modalPrestamos" href="#" data-id="{{$value->id}}">Imprimir <OP></OP></a>





        </td>
    </tr>
    @endforeach
    </tbody>
</table>
{{$prestamos->links()}}
@stop
