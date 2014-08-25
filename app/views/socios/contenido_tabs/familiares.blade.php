<h1>Familiares</h1>
<table class="table table-responsive table-over">
    <thead>
    <th>Nombre</th>
    <th>Apellido</th>
    <th>Parentezco</th>
    <th>Acciones</th>
    </thead>
    <tbody>
    @foreach($socio->getFamiliares as $familiar)
    <tr>
        <td>{{ $familiar->nombre }}</td>
        <td>{{ $familiar->apellido }}</td>
        <td>{{ $familiar->getParentezco->descripcion }}</td>
        <td><a href="{{ route('familiares.edit',$familiar->id)  }}" class="btn btn-primary">Editar</a></td>
    </tr>
    @endforeach
    </tbody>
</table>
<a href="{{ route('familiares.create',$socio->id)  }}" class="btn btn-primary">Agregar Familiar</a>