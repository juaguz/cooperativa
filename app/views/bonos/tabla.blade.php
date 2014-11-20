
<a href="{{ route('bonos.create') }}"><button class="btn btn-default" >Nuevo Bono </button></a>

<h2>Listados de Bonos</h2>
{{ Form::model(isset($busqueda) ? $busqueda : null,["method"=>"GET"]) }}
<div class="row" id="busqueda">
    <div class="col-md-2">
        {{ Form::text('id',null,array('class'=>'form-control','type'=>'text','placeholder'=>'Ingrese Nro de Bono')) }}
    </div>

    <div class="col-md-2">
        <button class="btn btn-success">Buscar</button>
    </div>

</div>
{{ Form::close() }}


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
                    <a href="{{route('bonos.edit',$bono->id)}}" class="btn btn-primary">Modificar</a>
                    <a class="btn btn-small btn-success generar_bono" data-toggle="modal" data-target="#modalBono" href="#" data-id="{{$bono->id}}">Imprimir Bono</a>
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>