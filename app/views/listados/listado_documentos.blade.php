<div style="display: none">
    {{ isset($oficios->archivos->nombre) ? $oficios->archivos : null }}
</div>
@if (isset($oficios->archivos))
<div class="panel panel-info">
    <div class="panel-heading">Archivos del Oficio</div>
    <div class="panel-body">
        <div class="row">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>
                        Fecha de Carga
                    </th>
                    <th>
                        Ver
                    </th>
                </tr>
                </thead>
                <tbody>
                @foreach($oficios->archivos as $archivo)
                <tr>
                    <td>{{ $archivo->created_at }}</td>
                    <td><a href="{{ URL::asset($archivo->path) }}">Descargar</a></td>
                </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endif