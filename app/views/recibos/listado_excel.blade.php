<table class="table table-hover">
    <thead>
    <tr>
        <th>Fecha</th>
        <th>Responsable</th>
        <th>Concepto</th>
        <th>De quien</th>
        <th>Monto</th>
    </tr>
    </thead>
    <tbody>
    @foreach($recibos as $key => $value)
    <tr>
        <td>{{ $value->fecha }}</td>
        <td>{{ $value->responsable }}</td>
        <td>{{ $value->concepto }}</td>
        <td>{{ $value->quien }}</td>
        <td>{{ $value->monto }}</td>

    </tr>
    @endforeach
    </tbody>
</table>