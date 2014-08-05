@extends ('header')
@section('scripts')
<style>
    .row {
        margin-top: 5px !important;
    }
</style>
@stop
@section ('content')
<div class="main-header clearfix">
    <div class="page-title">
        <h3 class="no-margin">Cooperativa C.A.S.A.L Ltda.</h3>
        <span>{{ Auth::user()->nombre }} {{ Auth::user()->apellido }}</span>
    </div>
    <!-- /page-title -->

    <ul class="page-stats">
        <li>
            <div class="value">
                <span>Requerimientos Pendientes</span>
                <h4  class="cantidad_no_leidos"></h4>

            </div>
            <span id="visits" class="sparkline"><canvas width="79" height="35"
                                                        style="display: inline-block; width: 79px; height: 35px; vertical-align: top;"></canvas>

            </span>
        </li>

    </ul>
    <!-- /page-stats -->
</div>
<div class="grey-container shortcut-wrapper">
    <h3> BIENVENIDO/A AL SISTEMA INTEGRADO DE REQUERIMIENTOS JUDICIALES</h3>
    <span>Los  siguientes enlaces le ayudarán a empezar con el Sistema.</span>
</div>
<div class="row">

    <div class="col-md-4">
        <h4 class="headline">
            Cargar Requerimiento
            <span class="line"></span>
        </h4>
        <div class="panel bg-success fadeInDown animation-delay4">

            <div class="seperator"></div>
            <div class="panel-body">

                @include('menu.oficios_inicio')

            </div>

        </div>
    </div>
    <div class="col-md-4">
        <h4 class="headline">
            Reportes
            <span class="line"></span>
        </h4>
        <div class="panel bg-success fadeInDown animation-delay5">

            <div class="seperator"></div>
            <div class="panel-body">
                <a href="{{ route('oficios.index') }}" class="btn btn-default block">Listado de Requerimientos</a>

            </div>

        </div>
    </div>
    @if(Auth::user()->id_perfil == 1)
    <div class="col-md-4">
        <h4 class="headline">
            Administración
            <span class="line"></span>
        </h4>
        <div class="panel bg-success fadeInDown animation-delay6">

            <div class="seperator"></div>
            <div class="panel-body">
                <a href="{{ route('usuarios.index') }}" class="btn btn-default block">Listado Usuarios</a>
                <div class="seperator"></div>
                <a href="{{ route('usuarios.create') }}" class="btn btn-default block">Crear Usuario</a>
                <div class="seperator"></div>
                <a href="{{ route('usuarios.create') }}" class="btn btn-default block">Crear Mail</a>
                <div class="seperator"></div>
                <a href="{{ route('usuarios.create') }}" class="btn btn-default block">Listado Mails</a>

            </div>

        </div>
    </div>
    @endif
</div>
@stop
