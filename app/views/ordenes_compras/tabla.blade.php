



<a href="{{ route('ordenes.compras.create') }}"><button class="btn btn-default" >Nueva Orden de Compra </button></a>

<h2>Listados de Ordenes de Compra</h2>
{{ Form::model(isset($busqueda) ? $busqueda : null,["method"=>"GET"]) }}
<div class="row" id="busqueda">
    <div class="col-md-2">
        {{ Form::text('id',null,array('class'=>'form-control','type'=>'text','placeholder'=>'Ingrese Nro de OC')) }}
    </div>

    <div class="col-md-2">
        <button class="btn btn-success">Buscar</button>
    </div>

</div>
{{ Form::close() }}


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
                    <a href="{{route('ordenes.compras.edit',$orden->id)}}" class="btn btn-primary">Modificar</a>
                    <a class="btn btn-small btn-success generar_orden_venta" data-toggle="modal" data-target="#modalOrdenVenta" href="#" data-id="{{$orden->id}}">Imprimir</a>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>