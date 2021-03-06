<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>@yield('title', 'Cooperativa')</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    @include("include_head")
</head>

<body class="pace-done">
<!-- Overlay Div
<div id="overlay" class="transparent"></div>-->
<!-- wrapper -->
<div id="wrapper" class="preload">
    <!-- top-nav-->
    @include("include_top_nav")
    <!-- /top-nav-->
    <!-- menu-lateral -->
    @include("include_main_menu")
    <!-- /menu-lateral -->
    <!-- main-container -->

    <div id="main-container">
        <!-- breadcrumb -->
        <div id="breadcrumb">
            <ul class="breadcrumb">
                <li><i class="fa fa-home"></i><a href=""> Inicio</a></li>
                @yield('breadcrumb')
            </ul>
        </div>
        <!-- breadcrumb -->

        <div class="padding-md">
        @include("errores")
        @include("mensaje_correcto")
        @yield('content')

        </div>
    </div>
    <!-- /main-container -->


</div>
<!-- /wrapper -->
@include("logout")
<!-- include("include_script.php"); -->
@include("include_script")
</body>
</html>