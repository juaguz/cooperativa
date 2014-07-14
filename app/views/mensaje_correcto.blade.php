@if (Session::has('mensaje_exito'))
<div class="alert alert-success">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>{{ Session::get('mensaje_exito') }}</strong>

</div>

@endif