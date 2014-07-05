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
                    <a href="{{ route('inicio') }}"> <span class="menu-icon"> <i class="fa fa-home "></i></span>
                        <span class="text"> Inicio </span> <span class="menu-hover"></span> </a>
                </li>
                <li class="">
                    <a href="#">
								<span class="menu-icon">
									<i class="fa fa-bell fa-lg"></i>
								</span>
								<span class="text" class=" tooltip-test"  data-toggle="tooltip" data-placement="top" title="Requerimentos Pendientes">
									Requerimientos
								</span>
                                <span class="menu-hover"></span>
                        <span class="badge badge-danger bounceIn animation-delay6 cantidad_no_leidos" ></span>

                    </a>
                </li>

                @if( (Auth::user()->id_perfil==1) or (Auth::user()->id_perfil==3) )
                    @include('menu.oficios')
                @endif
                @if(Auth::user()->id_perfil==1)
                    @include('menu.administrador')
                @endif
                <li class="">
                    <a href="{{ route('oficios.index') }}"> <span class="menu-icon"> <i class="fa fa-chevron-right"></i></span>
                        <span class="text">Consulta de  Requerimientos</span> <span class="menu-hover"></span> </a>
                </li>

                <!--
                <li class="openable">
                    <a href="#"> <span class="menu-icon"> <i class="fa fa-chevron-right"></i></span>
                        <span class="text"> Menu 2 </span> <span class="menu-hover"></span> </a>
                    <ul class="submenu">
                        <li><a href="#"><span class="submenu-label">Items 1</span></a></li>
                        <li><a href="#"><span class="submenu-label">Items 2</span></a></li>
                        <li><a href="#"><span class="submenu-label">Items 3</span></a></li>
                        <li><a href="#"><span class="submenu-label">Items 4</span></a></li>
                    </ul>
                </li>
                <li> <a href="#">
                        <span class="menu-icon"> <i class="fa fa-chevron-right"></i> </span>
                        <span class="text"> Menu 3 </span>
                        <span class="menu-hover"></span> </a>
                </li>
                <li> <a href="#">
                        <span class="menu-icon"> <i class="fa fa-chevron-right"></i> </span>
                        <span class="text"> Menu 4 </span>
                        <span class="menu-hover"></span> </a> </li>-->
            </ul>
        </div>
        <!-- /main-menu -->
    </div>
    <!-- /sidebar-inner -->
</aside>
<!-- ./main-menu -->