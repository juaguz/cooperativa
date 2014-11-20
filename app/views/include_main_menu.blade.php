<!-- main-menu
================================================== -->
<aside class="fixed skin-6">
    <div class="sidebar-inner scrollable-sidebar">
        <div class="size-toggle">
            <a class="btn btn-sm" id="sizeToggle">
                <span class="icon-bar"></span> <span class="icon-bar"></span>
                <span class="icon-bar"></span> </a>
            <a class="btn btn-sm pull-right logoutConfirm_open"  href="#logoutConfirm"> <i class="fa fa-power-off fa-lg"></i> </a>
        </div>
        <!-- /size-toggle -->
        <!-- user-block -->
        <!-- <div class="user-block clearfix"> <img src="img/user.jpg" alt="User Avatar">
          <div class="detail">
          <strong>Usuario</strong>
          </div>
        </div> -->
        <!-- /user-block -->
        <div class="main-menu">
            <ul>
                <!--<li class="active openable open">-->
                <li class="openable open">
                    <a href="#"> <span class="menu-icon"> <i class="fa fa-user"></i></span>

                        <span class="text"> {{ Auth::user()->nombre }} {{ Auth::user()->apellido }} </span> <span class="menu-hover"></span> </a>
                    <ul class="submenu">
                        <li><a href="#"><span class="submenu-label">Modificar contraseña</span></a></li>
                        <li><a href="#"><span class="submenu-label">Manual</span></a></li>
                    </ul>
                </li>
                <li class="openable open">
                    <a href=""> <span class="menu-icon"> <i class="fa fa-home "></i></span>
                        <span class="text"> Inicio </span> <span class="menu-hover"></span> </a>
                </li>





                <li class="openable">
                    <a href="#"> <span class="menu-icon"> <i class="fa fa-chevron-right"></i></span>
                        <span class="text"> Socios </span> <span class="menu-hover"></span> </a>
                    <ul class="submenu">
                        <li><a href="{{ route('socios.index') }}"><span class="submenu-label"><i class="fa fa-users"></i>  Listado de Socios</span></a></li>
                        <li><a href="{{ route('socios.create') }}"><span class="submenu-label"><i class="fa fa-user"></i>  Nuevo Socio</span></a></li>
                        <!--<li><a href="{{ route('socios.exportar.excel') }}"><span class="submenu-label"><i class="fa fa-file-excel-o"></i>  Socios a excel </span></a></li>-->
                        <li><a href="{{ route('familiares.index') }}"><span class="submenu-label"><i class="fa fa-users"></i>  Listado de Familiares</span></a></li>
                        <!--<li><a href="{{ route('familiares.exportar.excel') }}"><span class="submenu-label"><i class="fa fa-file-excel-o"></i>  Familiares a Excel </span></a></li>-->
                    </ul>
                </li>
                <li class="openable">
                    <a href="#"> <span class="menu-icon"> <i class="fa fa-chevron-right"></i></span>
                        <span class="text"> Rifas </span> <span class="menu-hover"></span> </a>
                    <ul class="submenu">
                       <li><a href="{{ route('rifas.index') }}"><span class="submenu-label"><i class="fa fa-users"></i>  Listado de Rifas</span></a></li>
                        <li><a href="{{ route('rifas.create') }}"><span class="submenu-label"><i class="fa fa-user"></i>  Nueva Rifa</span></a></li>
                        <li><a href="{{ route('rifas.exportar.excel') }}"><span class="submenu-label"><i class="fa fa-file-excel-o"></i>  Rifas a excel </span></a></li>
                    </ul>
                </li>
                <li class="openable">
                    <a href="#"> <span class="menu-icon"> <i class="fa fa-chevron-right"></i></span>
                        <span class="text"> Círculos </span> <span class="menu-hover"></span> </a>
                    <ul class="submenu">
                    <li><a href="{{ route('circulos.index') }}"><span class="submenu-label"><i class="fa fa-users"></i>  Listado de Círculos</span></a></li>
                        <li><a href="{{ route('circulos.create') }}"><span class="submenu-label"><i class="fa fa-user"></i>  Nuevo Círculo</span></a></li>
                        <!--<li><a href="{{ route('circulos.exportar.excel') }}"><span class="submenu-label"><i class="fa fa-file-excel-o"></i>  Circulos a excel </span></a></li>-->
                    </ul>
                </li>
                <li class="openable">
                    <a href="#"> <span class="menu-icon"> <i class="fa fa-chevron-right"></i></span>
                        <span class="text"> Préstamos </span> <span class="menu-hover"></span> </a>
                    <ul class="submenu">
                        <li><a href="{{ route('prestamos.index') }}"><span class="submenu-label"><i class="fa fa-users"></i>  Listado de Prestamos</span></a></li>
                        <li><a href="{{ route('prestamos.create') }}"><span class="submenu-label"><i class="fa fa-user"></i>  Nuevo Prestamo </span></a></li>
                        <!--<li><a href="@{{ route('prestamos.exportar.excel') }}"><span class="submenu-label"><i class="fa fa-file-excel-o"></i>  Prestamos a excel </span></a></li>-->
                    </ul>
                </li>
                <li class="openable">
                    <a href="#"> <span class="menu-icon"> <i class="fa fa-chevron-right"></i></span>
                        <span class="text"> Ventas / Financiación </span> <span class="menu-hover"></span> </a>
                    <ul class="submenu">
                        <li><a href="{{ route('ventas.index') }}"><span class="submenu-label"><i class="fa fa-users"></i>  Listado de Ventas</span></a></li>
                        <li><a href="{{ route('ventas.create') }}"><span class="submenu-label"><i class="fa fa-user"></i>  Nueva Venta / Financiar </span></a></li>
                        <!--<li><a href="@{{ route('ventas.exportar.excel') }}"><span class="submenu-label"><i class="fa fa-file-excel-o"></i>  Bajar a excel </span></a></li>-->
                    </ul>
                </li>

                <li class="openable">
                    <a href="#"> <span class="menu-icon"> <i class="fa fa-chevron-right"></i></span>
                        <span class="text"> Cocheria </span> <span class="menu-hover"></span> </a>
                    <ul class="submenu">
                        <li><a href="{{ route('cocheria.facturas.index') }}"><span class="submenu-label"><i class="fa fa-list-ul"></i>  Listado de Facturas</span></a></li>
                        <li><a href="{{ route('cocheria.facturas.create') }}"><span class="submenu-label"><i class="fa fa-list-alt"></i>  Nueva Factura</span></a></li>
                        <!--<li><a href="{{ route('cocheria.facturas.exportar.excel') }}"><span class="submenu-label"><i class="fa fa-file-excel-o"></i>  Exportar a Excel </span></a></li>-->

                    </ul>
                </li>

                <li class="openable">
                    <a href="#"> <span class="menu-icon"> <i class="fa fa-chevron-right"></i></span>
                        <span class="text"> Comercios </span> <span class="menu-hover"></span> </a>
                    <ul class="submenu">
                        <li><a href="{{ route('comercios.index') }}"><span class="submenu-label"><i class="fa fa-users"></i>  Listado de Comercios</span></a></li>
                        <li><a href="{{ route('comercios.create') }}"><span class="submenu-label"><i class="fa fa-user"></i>  Nuevo Comercio</span></a></li>
                       <!-- <li><a href="{{ route('comercios.exportar.excel') }}"><span class="submenu-label"><i class="fa fa-file-excel-o"></i>  Exportar a excel </span></a></li>-->

                    </ul>
                </li>


                <li class="openable">
                    <a href="#"> <span class="menu-icon"> <i class="fa fa-chevron-right"></i></span>
                        <span class="text"> Peñas </span> <span class="menu-hover"></span> </a>
                    <ul class="submenu">
                        <li><a href="{{ route('servicios.index') }}"><span class="submenu-label"><i class="fa fa-users"></i>  Listado de Servicios</span></a></li>
                        <li><a href="{{ route('servicios.create') }}"><span class="submenu-label"><i class="fa fa-user"></i>  Nuevo Servicio </span></a></li>
                        <!--<li><a href="@{{ route('servicios.exportar.excel') }}"><span class="submenu-label"><i class="fa fa-file-excel-o"></i>  Exportar a excel </span></a></li>-->

                    </ul>
                </li>

                <li class="openable">
                    <a href="#"> <span class="menu-icon"> <i class="fa fa-chevron-right"></i></span>
                        <span class="text"> Comprobantes </span> <span class="menu-hover"></span> </a>
                    <ul class="submenu">
                        <li><a href="{{ route('recibos.index') }}"><span class="submenu-label">  Listado de Recibos</span></a></li>
                        <li><a href="{{ route('recibos.create') }}"><span class="submenu-label">  Nuevo Recibo </span></a></li>
                        <!--<li><a href="@{{ route('recibos.exportar.excel') }}"><span class="submenu-label"><i class="fa fa-file-excel-o"></i>  Exportar a excel </span></a></li>-->
                        <li><a href="{{ route('ordenes.compras.index') }}"><span class="submenu-label">  Listado de OC</span></a></li>
                        <li><a href="{{ route('ordenes.compras.create') }}"><span class="submenu-label">  Nueva Orden de Compra</span></a></li>
                        <!--<li><a href="@{{ route('ordenes.compras.exportar.excel') }}"><span class="submenu-label"><i class="fa fa-file-excel-o"></i>  Ordenes de Compra a excel </span></a></li>-->
                        <li><a href="{{ route('bonos.index') }}"><span class="submenu-label">  Listado de Bonos</span></a></li>
                        <li><a href="{{ route('bonos.create') }}"><span class="submenu-label">  Nuevo Bono</span></a></li>
                        <!--<li><a href="@{{ route('bonos.exportar.excel') }}"><span class="submenu-label"><i class="fa fa-file-excel-o"></i> Bonos a excel </span></a></li>-->
                        <li><a href="{{ route('ordenes.pagos.index') }}"><span class="submenu-label">  Listado de Ordenes de Pago</span></a></li>
                        <li><a href="{{ route('ordenes.pagos.create') }}"><span class="submenu-label">  Nueva Orden de Pago</span></a></li>

                    </ul>
                </li>

                <!--<li> <a href="#">
                        <span class="menu-icon"> <i class="fa fa-chevron-right"></i> </span>
                        <span class="text"> Menu 4 </span>
                        <span class="menu-hover"></span> </a> </li>
            </ul>-->
        </div>
        <!-- /main-menu -->
    </div>
    <!-- /sidebar-inner -->
</aside>
<!-- ./main-menu -->